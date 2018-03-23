//  SDLProxyFactory.h
//

#import <Foundation/Foundation.h>

#import "SDLProxyListener.h"

@class SDLProxy;
@class SDLSecondaryTransportManager;

NS_ASSUME_NONNULL_BEGIN

__deprecated_msg("Use SDLManager instead")
@interface SDLProxyFactory : NSObject {
}

+ (SDLProxy *)buildSDLProxyWithListener:(NSObject<SDLProxyListener> *)listener;

// intended for internal use
+ (SDLProxy *)buildSDLProxyWithListener:(NSObject<SDLProxyListener> *)delegate
              secondaryTransportManager:(nullable SDLSecondaryTransportManager *)secondaryTransportManager;

+ (SDLProxy *)buildSDLProxyWithListener:(NSObject<SDLProxyListener> *)listener
                           tcpIPAddress:(NSString *)ipaddress
                                tcpPort:(NSString *)port;
@end

NS_ASSUME_NONNULL_END
