//
//  SDLTCPTransport.m
//  SmartDeviceLink
//
//  Created by Sho Amano on 2018/04/19.
//  Copyright © 2018 Xevo Inc. All rights reserved.
//

#import "SDLTCPTransport.h"
#import "SDLTCPStreamTaskTransport.h"
#import "SDLTCPLegacyTransport.h"
#import "SDLLogMacros.h"
#import "SDLLogManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface SDLTCPTransport ()
@property (strong, nonatomic) SDLTCPAbstractTransport *transport;
@end

@implementation SDLTCPTransport

- (instancetype)init {
    if (self = [super init]) {
        if ([SDLTCPStreamTaskTransport isAvailable]) {
            _transport = [[SDLTCPStreamTaskTransport alloc] initWithParent:self];
        } else {
            _transport = [[SDLTCPLegacyTransport alloc] initWithParent:self];
        }
    }
    return self;
}

- (void)connect {
    [self.transport connect];
}

- (void)sendData:(NSData *)msgBytes {
    [self.transport sendData:msgBytes];
}

- (void)disconnect {
    [self.transport disconnect];
}

@end

NS_ASSUME_NONNULL_END
