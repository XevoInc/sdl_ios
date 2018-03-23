//  SDLAbstractProtocol.m

#import "SDLAbstractProtocol.h"

#import "SDLRPCMessage.h"

NS_ASSUME_NONNULL_BEGIN

@implementation SDLAbstractProtocol

- (instancetype)init {
    if (self = [super init]) {
        _protocolDelegateTable = [NSHashTable weakObjectsHashTable];
        _debugConsoleGroupName = @"default";
    }
    return self;
}

// Implement in subclasses.
- (BOOL)storeHeader:(SDLProtocolHeader *)header forServiceType:(SDLServiceType)serviceType {
    [self doesNotRecognizeSelector:_cmd];
    return NO;
}

- (void)startServiceWithType:(SDLServiceType)serviceType payload:(nullable NSData *)payload {
    [self doesNotRecognizeSelector:_cmd];
}

- (void)startSecureServiceWithType:(SDLServiceType)serviceType payload:(nullable NSData *)payload completionHandler:(void (^)(BOOL, NSError *))completionHandler {
    [self doesNotRecognizeSelector:_cmd];
}

- (void)endServiceWithType:(SDLServiceType)serviceType {
    [self doesNotRecognizeSelector:_cmd];
}

- (void)registerSecondaryTransport:(nullable NSData *)payload {
    [self doesNotRecognizeSelector:_cmd];
}

- (void)sendRPC:(SDLRPCMessage *)message {
    [self doesNotRecognizeSelector:_cmd];
}

- (BOOL)sendRPC:(SDLRPCMessage *)message encrypted:(BOOL)encryption error:(NSError *__autoreleasing *)error {
    [self doesNotRecognizeSelector:_cmd];
    return NO;
}

- (void)handleBytesFromTransport:(NSData *)receivedData {
    [self doesNotRecognizeSelector:_cmd];
}

- (void)sendRawData:(NSData *)data withServiceType:(SDLServiceType)serviceType {
    [self doesNotRecognizeSelector:_cmd];
}

- (void)sendEncryptedRawData:(NSData *)data onService:(SDLServiceType)serviceType {
    [self doesNotRecognizeSelector:_cmd];
}


#pragma mark - SDLTransportListener Implementation
- (void)onTransportConnected {
    NSArray<id<SDLProtocolListener>> *listeners;
    @synchronized(self.protocolDelegateTable) {
        listeners = self.protocolDelegateTable.allObjects;
    }
    for (id<SDLProtocolListener> listener in listeners) {
        if ([listener respondsToSelector:@selector(onProtocolOpened)]) {
            [listener onProtocolOpened];
        }
    }
}

- (void)onTransportDisconnected {
    NSArray<id<SDLProtocolListener>> *listeners;
    @synchronized(self.protocolDelegateTable) {
        listeners = self.protocolDelegateTable.allObjects;
    }
    for (id<SDLProtocolListener> listener in listeners) {
        if ([listener respondsToSelector:@selector(onProtocolClosed)]) {
            [listener onProtocolClosed];
        }
    }
}

- (void)onDataReceived:(NSData *)receivedData {
    [self handleBytesFromTransport:receivedData];
}

@end

NS_ASSUME_NONNULL_END
