//  SDLTCPLegacyTransport.h
//

#import "SDLTCPAbstractTransport.h"

NS_ASSUME_NONNULL_BEGIN

@interface SDLTCPLegacyTransport : SDLTCPAbstractTransport {
    _Nullable CFSocketRef socket;
}

@end

NS_ASSUME_NONNULL_END
