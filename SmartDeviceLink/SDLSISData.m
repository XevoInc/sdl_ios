//  SDLSISData.m
//

#import "SDLSISData.h"

#import "SDLStationIDNumber.h"
#import "SDLGPSData.h"
#import "SDLRPCParameterNames.h"
#import "NSMutableDictionary+Store.h"


NS_ASSUME_NONNULL_BEGIN

@implementation SDLSISData

- (instancetype)initWithStationShortName:(nullable NSString *)stationShortName stationIDNumber:(nullable SDLStationIDNumber *)stationIDNumber stationLongName:(nullable NSString *)stationLongName stationLocation:(nullable SDLGPSData *)stationLocation stationMessage:(nullable NSString *)stationMessage {
    self = [self init];
    if(!self) {
        return nil;
    }
    self.stationShortName = stationShortName;
    self.stationIDNumber = stationIDNumber;
    self.stationLongName = stationLongName;
    self.stationLocation = stationLocation;
    self.stationMessage = stationMessage;

    return self;
}

- (void)setStationShortName:(nullable NSString *)stationShortName {
    [store sdl_setObject:stationShortName forName:SDLRPCParameterNameStationShortName];
}

- (nullable NSString *)stationShortName {
    return [store sdl_objectForName:SDLRPCParameterNameStationShortName];
}

- (void)setStationIDNumber:(nullable SDLStationIDNumber *)stationIDNumber {
    [store sdl_setObject:stationIDNumber forName:SDLRPCParameterNameStationIDNumber];
}

- (nullable SDLStationIDNumber *)stationIDNumber {
    return [store sdl_objectForName:SDLRPCParameterNameStationIDNumber ofClass:SDLStationIDNumber.class];
}

- (void)setStationLongName:(nullable NSString *)stationLongName {
    [store sdl_setObject:stationLongName forName:SDLRPCParameterNameStationLongName];
}

- (nullable NSString *)stationLongName {
    return [store sdl_objectForName:SDLRPCParameterNameStationLongName];
}

- (void)setStationLocation:(nullable SDLGPSData *)stationLocation {
    [store sdl_setObject:stationLocation forName:SDLRPCParameterNameStationLocation];
}

- (nullable SDLGPSData *)stationLocation {
    return [store sdl_objectForName:SDLRPCParameterNameStationLocation ofClass:SDLGPSData.class];
}

- (void)setStationMessage:(nullable NSString *)stationMessage {
    [store sdl_setObject:stationMessage forName:SDLRPCParameterNameStationMessage];
}

- (nullable NSString *)stationMessage {
    return [store sdl_objectForName:SDLRPCParameterNameStationMessage];
}

@end

NS_ASSUME_NONNULL_END
