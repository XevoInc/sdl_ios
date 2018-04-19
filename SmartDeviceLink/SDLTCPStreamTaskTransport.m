//
//  SDLTCPStreamTaskTransport.m
//  SmartDeviceLink
//
//  Created by Sho Amano on 2018/04/19.
//  Copyright © 2018 Xevo Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SDLTCPStreamTaskTransport.h"
#import "SDLTCPTransport.h"
#import "SDLLogMacros.h"

NS_ASSUME_NONNULL_BEGIN

const NSUInteger MaxReceiveSize = 16384;
const NSTimeInterval SendTimeoutSec = 15.0;

@interface SDLTCPStreamTaskTransport ()

@property (nullable, strong, nonatomic) NSURLSession *urlSession;
@property (nullable, strong, nonatomic) NSURLSessionStreamTask *streamTask;
@property (nullable, strong, nonatomic) NSOperationQueue *delegateQueue;
@property (weak, nonatomic) SDLTCPTransport *parent;
@property (assign, nonatomic) BOOL disconnected;

@end


@implementation SDLTCPStreamTaskTransport

+ (BOOL)isAvailable {
    // NSURLSessionStreamTask should be available on iOS 9.0+. However, this code didn't
    // work when tested against iOS 9.0.2 device - the state of the task would quickly
    // become "canceling" right after the task was resumed, and no communication was performed.
    // Here we limit the usage to iOS 10.0+ to avoid such unexpected behavior.
    if (@available(iOS 10.0, *)) {
        return YES;
    } else {
        return NO;
    }
}

- (instancetype)initWithParent:(SDLTCPTransport *)parent {
    if (self = [super init]) {
        SDLLogD(@"SDLTCPStreamTaskTransport init");
        _parent = parent;
    }
    return self;
}

- (void)dealloc {
    SDLLogD(@"SDLTCPStreamTaskTransport dealloc");
    [self disconnect];
}

#pragma mark - SDLTCPAbstractTransport methods

- (void)connect {
    SDLLogV(@"SDLTCPStreamTaskTransport connect (hostName=%@, port=%@)", self.parent.hostName, self.parent.portNumber);

    self.disconnected = NO;

    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    queue.maxConcurrentOperationCount = 1;  // make the queue serial
    self.delegateQueue = queue;

    NSURLSessionConfiguration *config = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    // this transport is primary for video streaming
    config.networkServiceType = NSURLNetworkServiceTypeVideo;
    config.allowsCellularAccess = NO;

    self.urlSession = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:self.delegateQueue];
    self.streamTask = [self.urlSession streamTaskWithHostName:self.parent.hostName port:[self.parent.portNumber integerValue]];

    [self.streamTask addObserver:self forKeyPath:@"state" options:(NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew) context:nil];

    // start connecting to TCP server
    [self.streamTask resume];
}

- (void)disconnect {
    SDLLogD(@"SDLTCPStreamTaskTransport disconnect");

    @synchronized(self) {
        // prevent onTransportDisconnected event triggered by this disconnect
        self.disconnected = YES;
    }

    [self.streamTask closeWrite];
    [self.streamTask closeRead];

    [self.urlSession invalidateAndCancel];

    if (self.delegateQueue != nil) {
        if (NSOperationQueue.currentQueue != self.delegateQueue) {
            SDLLogD(@"SDLTCPStreamTaskTransport waits for all delegate methods to finish ...");
            [self.delegateQueue waitUntilAllOperationsAreFinished];
        } else {
            SDLLogW(@"SDLTCPStreamTaskTransport disconnect is called from a delegate method!");
        }
    }
    [self.streamTask removeObserver:self forKeyPath:@"state"];
    self.streamTask = nil;
    self.delegateQueue = nil;
    self.urlSession = nil;

    SDLLogD(@"SDLTCPStreamTaskTransport disconnect completed");
}

- (void)initiateRead {
    [self.streamTask readDataOfMinLength:1 maxLength:MaxReceiveSize timeout:0 completionHandler:^(NSData *data, BOOL atEOF, NSError *error) {
        [self readCompletionHandler:data atEOF:atEOF error:error];
    }];
}

- (void)sendData:(NSData *)msgBytes {
    [self.streamTask writeData:msgBytes timeout:SendTimeoutSec completionHandler:^(NSError *error) {
        if (error != nil) {
            SDLLogW(@"SDLTCPStreamTaskTransport send failed: %@", error);
            [self onSendFailed];
        }
    }];
}

#pragma mark - Stream task state changes

- (void)observeValueForKeyPath:(nullable NSString *)keyPath
                      ofObject:(nullable id)object
                        change:(nullable NSDictionary<NSKeyValueChangeKey, id> *)change
                       context:(nullable void *)context {
    if (change == nil) {
        return;
    }

    NSURLSessionTaskState oldState = [change[NSKeyValueChangeOldKey] integerValue];
    NSURLSessionTaskState newState = [change[NSKeyValueChangeNewKey] integerValue];

    // TODO: state change to Running doesn't mean that the task has connected to server.
    // So it is not correct to trigger onTransportConnected event here.
    if (newState == NSURLSessionTaskStateRunning && oldState != newState) {
        SDLLogD(@"SDLTCPStreamTaskTransport state is running");

        [self.delegateQueue addOperationWithBlock:^{
            // delegate methods should be called on the delegate queue
            [self onTransportStarted];
        }];
    } else if (newState == NSURLSessionTaskStateCompleted && oldState != newState) {
        SDLLogD(@"SDLTCPStreamTaskTransport state is completed");

        [self.delegateQueue addOperationWithBlock:^{
            [self onTransportEnded];
        }];
    }
}

#pragma mark - Delegate methods
// these methods run on the delegate queue

- (void)onTransportStarted {
    // if we already receive a connection error, do nothing
    @synchronized(self) {
        if (self.disconnected) {
            return;
        }
    }

    SDLLogD(@"SDLTCPStreamTaskTransport notifying onTransportConnected");
    [self.parent.delegate onTransportConnected];

    [self initiateRead];
}

- (void)readCompletionHandler:(nullable NSData *)data atEOF:(BOOL)atEOF error:(nullable NSError *)error {
    if (error == nil && data != nil) {
        [self.parent.delegate onDataReceived:data];
    }

    if (atEOF) {
        SDLLogD(@"SDLTCPStreamTaskTransport received EOF event");
        [self onTransportError];
    } else if (error != nil) {
        SDLLogW(@"SDLTCPStreamTaskTransport detected receive error: %@", error);
        [self onTransportError];
    } else {
        [self initiateRead];
    }
}

- (void)onSendFailed {
    [self notifyTransportDisconnected];
}

- (void)onTransportEnded {
    [self notifyTransportDisconnected];
}

- (void)onTransportError {
    [self notifyTransportDisconnected];
}

- (void)notifyTransportDisconnected {
    BOOL notifyDisconnected = NO;
    @synchronized(self) {
        if (!self.disconnected) {
            notifyDisconnected = YES;
            // prevent notifying disconnected event multiple times
            self.disconnected = YES;
        }
    }

    if (notifyDisconnected) {
        SDLLogD(@"SDLTCPStreamTaskTransport notifying onTransportDisconnected");
        [self.parent.delegate onTransportDisconnected];
    }
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(nullable NSError *)error {
    if (error != nil) {
        SDLLogW(@"SDLTCPStreamTaskTransport received error event: %@", error);
        [self onTransportError];
    } else {
        SDLLogD(@"SDLTCPStreamTaskTransport received completion event (ignored)");
    }
}

- (void)URLSession:(NSURLSession *)session readClosedForStreamTask:(NSURLSessionStreamTask *)streamTask {
    SDLLogD(@"SDLTCPStreamTaskTransport received read closed event");
}

- (void)URLSession:(NSURLSession *)session writeClosedForStreamTask:(NSURLSessionStreamTask *)streamTask {
    SDLLogD(@"SDLTCPStreamTaskTransport received write closed event");
}

- (void)URLSession:(NSURLSession *)session didBecomeInvalidWithError:(nullable NSError *)error {
    // this should be called after calling invalidateAndCancel
    SDLLogD(@"SDLTCPStreamTaskTransport URL session invalidated: %@", error);
}

@end

NS_ASSUME_NONNULL_END
