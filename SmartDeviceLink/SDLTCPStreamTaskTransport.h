//
//  SDLTCPStreamTaskTransport.h
//  SmartDeviceLink-iOS
//
//  Created by Sho Amano on 2018/04/19.
//  Copyright © 2018 Xevo Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SDLTCPAbstractTransport.h"

NS_ASSUME_NONNULL_BEGIN

@interface SDLTCPStreamTaskTransport : SDLTCPAbstractTransport <NSURLSessionStreamDelegate>

// returns whether SDLTCPStreamTaskTransport is available on this device
+ (BOOL)isAvailable;

@end

NS_ASSUME_NONNULL_END
