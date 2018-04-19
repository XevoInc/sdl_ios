//
//  SDLTCPAbstractTransport.h
//  SmartDeviceLink-iOS
//
//  Created by Sho Amano on 2018/04/19.
//  Copyright © 2018 Xevo Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SDLTCPTransport;

NS_ASSUME_NONNULL_BEGIN

@interface SDLTCPAbstractTransport : NSObject

- (instancetype)initWithParent:(SDLTCPTransport *)parent;
- (void)connect;
- (void)disconnect;
- (void)sendData:(NSData *)dataToSend;

@end

NS_ASSUME_NONNULL_END
