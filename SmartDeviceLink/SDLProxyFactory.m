//  SDLSyncProxyFactory.m
//

#import "SDLProxyFactory.h"

#import "SDLIAPTransport.h"
#import "SDLProtocol.h"
#import "SDLProxy.h"
#import "SDLSecondaryTransportManager.h"
#import "SDLTCPTransport.h"

NS_ASSUME_NONNULL_BEGIN

@implementation SDLProxyFactory

+ (SDLProxy *)buildSDLProxyWithListener:(NSObject<SDLProxyListener> *)delegate {
    return [self buildSDLProxyWithListener:delegate secondaryTransportManager:nil];
}

+ (SDLProxy *)buildSDLProxyWithListener:(NSObject<SDLProxyListener> *)delegate secondaryTransportManager:(nullable SDLSecondaryTransportManager *)secondaryTransportManager {
    SDLIAPTransport *transport = [[SDLIAPTransport alloc] init];
    SDLProtocol *protocol = [[SDLProtocol alloc] init];

    // make sure that secondary transport manager is started prior to starting protocol
    if (secondaryTransportManager != nil) {
        [secondaryTransportManager startWithProtocol:protocol];
    }

    SDLProxy *ret = [[SDLProxy alloc] initWithTransport:transport protocol:protocol delegate:delegate];

    return ret;
}

+ (SDLProxy *)buildSDLProxyWithListener:(NSObject<SDLProxyListener> *)delegate
                           tcpIPAddress:(NSString *)ipaddress
                                tcpPort:(NSString *)port {
    SDLTCPTransport *transport = [[SDLTCPTransport alloc] init];
    transport.hostName = ipaddress;
    transport.portNumber = port;

    SDLProtocol *protocol = [[SDLProtocol alloc] init];

    SDLProxy *ret = [[SDLProxy alloc] initWithTransport:transport protocol:protocol delegate:delegate];

    return ret;
}

@end

NS_ASSUME_NONNULL_END
