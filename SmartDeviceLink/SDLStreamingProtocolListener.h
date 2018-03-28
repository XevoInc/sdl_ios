//
//  SDLStreamingProtocolListener.h
//  SmartDeviceLink-iOS
//
//  Created by Sho Amano on 2018/03/23.
//  Copyright © 2018 Xevo Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SDLAbstractProtocol;

NS_ASSUME_NONNULL_BEGIN

@protocol SDLStreamingProtocolListener <NSObject>

/**
 *  Called when protocol instance for audio service has been updated.
 *
 *  If `newProtocol` is nil, it indicates that underlying transport
 *  becomes unavailable.
 *
 *  @param oldProtocol protocol instance that has been used for audio streaming.
 *  @param newProtocol protocol instance that will be used for audio streaming.
 */
- (void)onAudioServiceProtocolUpdated:(nullable SDLAbstractProtocol *)oldProtocol to:(nullable SDLAbstractProtocol *)newProtocol;

/**
 *  Called when protocol instance for video service has been updated.
 *
 *  If `newProtocol` is nil, it indicates that underlying transport
 *  becomes unavailable.
 *
 *  @param oldProtocol protocol instance that has been used for video streaming.
 *  @param newProtocol protocol instance that will be used for video streaming.
 */
- (void)onVideoServiceProtocolUpdated:(nullable SDLAbstractProtocol *)oldProtocol to:(nullable SDLAbstractProtocol *)newProtocol;

@end

NS_ASSUME_NONNULL_END
