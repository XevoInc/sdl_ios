//  SDLTCPTransport.h
//

#import "SDLAbstractTransport.h"

NS_ASSUME_NONNULL_BEGIN

@interface SDLTCPTransport : SDLAbstractTransport

@property (strong, nonatomic) NSString *hostName;
@property (strong, nonatomic) NSString *portNumber;

@end

NS_ASSUME_NONNULL_END
