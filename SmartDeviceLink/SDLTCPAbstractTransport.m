//
//  SDLTCPAbstractTransport.m
//  SmartDeviceLink
//
//  Created by Sho Amano on 2018/04/19.
//  Copyright © 2018 Xevo Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SDLTCPAbstractTransport.h"

NS_ASSUME_NONNULL_BEGIN

@implementation SDLTCPAbstractTransport

- (instancetype)initWithParent:(SDLTCPTransport *)parent {
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

- (void)connect {
    [self doesNotRecognizeSelector:_cmd];
}

- (void)disconnect {
    [self doesNotRecognizeSelector:_cmd];
}

- (void)sendData:(NSData *)dataToSend {
    [self doesNotRecognizeSelector:_cmd];
}

@end

NS_ASSUME_NONNULL_END
