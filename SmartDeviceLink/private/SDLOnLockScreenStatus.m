//
//  SDLOnLockScreenStatus.m
//  SmartDeviceLink
//

#import "SDLOnLockScreenStatus.h"

#import "NSMutableDictionary+Store.h"
#import "SDLHMILevel.h"
#import "SDLRPCParameterNames.h"
#import "SDLRPCFunctionNames.h"

NS_ASSUME_NONNULL_BEGIN

@implementation SDLOnLockScreenStatus

- (instancetype)init {
    self = [super init];
    if (!self) {
        return nil;
    }

    _lockScreenStatus = SDLLockScreenStatusOff;

    return self;
}

- (instancetype)initWithDriverDistractionStatus:(nullable NSNumber<SDLBool> *)driverDistractionStatus userSelected:(nullable NSNumber<SDLBool> *)userSelected lockScreenStatus:(SDLLockScreenStatus)lockScreenStatus hmiLevel:(nullable SDLHMILevel)hmiLevel {
    self = [self init];
    if (!self) {
        return nil;
    }
    _driverDistractionStatus = driverDistractionStatus;
    _userSelected = userSelected;
    _lockScreenStatus = lockScreenStatus;
    _hmiLevel = hmiLevel;

    return self;
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString stringWithFormat:@"driverDistractionStatus: %@, userSelected: %@, lockScreenStatus: %lu, hmiLevel: %@", self.driverDistractionStatus, self.userSelected, (unsigned long)self.lockScreenStatus, self.hmiLevel];

    return description;
}

@end

NS_ASSUME_NONNULL_END
