//
//  SDLStreamingAudioLifecycleManager.h
//  SmartDeviceLink
//
//  Created by Joel Fischer on 6/19/18.
//  Copyright © 2018 smartdevicelink. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SDLConfiguration.h"
#import "SDLHMILevel.h"
#import "SDLProtocolListener.h"
#import "SDLStreamingAudioManagerType.h"
#import "SDLStreamingMediaManagerConstants.h"
#import "SDLSystemCapabilityManager.h"

@class SDLAudioStreamManager;
@class SDLProtocol;
@class SDLStateMachine;
@class SDLEncryptionConfiguration;

@protocol SDLConnectionManagerType;


NS_ASSUME_NONNULL_BEGIN

@interface SDLStreamingAudioLifecycleManager : NSObject <SDLProtocolListener, SDLStreamingAudioManagerType>

@property (nonatomic, strong, readonly) SDLAudioStreamManager *audioManager;

@property (strong, nonatomic, readonly) SDLStateMachine *audioStreamStateMachine;
@property (strong, nonatomic, readonly) SDLAudioStreamManagerState *currentAudioStreamState;

@property (strong, nonatomic, readonly) SDLStateMachine *appStateMachine;

@property (copy, nonatomic, nullable) SDLHMILevel hmiLevel;

/**
 *  Whether or not the audio session is connected.
 */
@property (assign, nonatomic, readonly, getter=isAudioConnected) BOOL audioConnected;

/**
 *  Whether or not the audio session is encrypted. This may be different than the requestedEncryptionType.
 */
@property (assign, nonatomic, readonly, getter=isAudioEncrypted) BOOL audioEncrypted;

/// Whether or not vidoe/audio streaming is supported
/// @discussion If connected to a module pre-SDL v4.5 there is no way to check if streaming is supported so `YES` is returned by default even though the module may NOT support video/audio streaming.
@property (assign, nonatomic, readonly, getter=isStreamingSupported) BOOL streamingSupported;

/**
 *  The requested encryption type when a session attempts to connect. This setting applies to both video and audio sessions.
 *
 *  DEFAULT: SDLStreamingEncryptionFlagAuthenticateAndEncrypt
 */
@property (assign, nonatomic) SDLStreamingEncryptionFlag requestedEncryptionType;

- (instancetype)init NS_UNAVAILABLE;

/// Create a new streaming audio manager for navigation and projection apps with a specified configuration.
/// @param connectionManager The pass-through for RPCs
/// @param configuration This session's configuration
/// @param systemCapabilityManager The system capability manager object for reading window capabilities
- (instancetype)initWithConnectionManager:(id<SDLConnectionManagerType>)connectionManager configuration:(SDLConfiguration *)configuration systemCapabilityManager:(nullable SDLSystemCapabilityManager *)systemCapabilityManager NS_DESIGNATED_INITIALIZER;

/**
 *  Start the manager with a completion block that will be called when startup completes. This is used internally. To use an SDLStreamingMediaManager, you should use the manager found on `SDLManager`.
 */
- (void)startWithProtocol:(SDLProtocol *)protocol;

/**
 *  Stop the manager. This method is used internally.
 */
- (void)stop;

/**
 *  This method receives PCM audio data and will attempt to send that data across to the head unit for immediate playback
 *
 *  @param audioData    The data in PCM audio format, to be played
 *
 *  @return Whether or not the data was successfully sent.
 */
- (BOOL)sendAudioData:(NSData *)audioData;

@end

NS_ASSUME_NONNULL_END
