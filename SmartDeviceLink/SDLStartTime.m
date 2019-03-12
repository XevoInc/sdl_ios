//  SDLStartTime.m
//


#import "SDLStartTime.h"

#import "NSMutableDictionary+Store.h"
#import "SDLRPCParameterNames.h"

NS_ASSUME_NONNULL_BEGIN

@implementation SDLStartTime

- (instancetype)initWithTimeInterval:(NSTimeInterval)timeInterval {
    self = [self init];
    if (!self) { return nil; }

    // https://stackoverflow.com/a/15304826/1221798
    long seconds = lround(timeInterval);
    self.hours = @(seconds / 3600);
    self.minutes = @((seconds % 3600) / 60);
    self.seconds = @(seconds % 60);

    return self;
}

- (instancetype)initWithHours:(UInt8)hours minutes:(UInt8)minutes seconds:(UInt8)seconds {
    self = [self init];
    if (!self) {
        return nil;
    }

    self.hours = @(hours);
    self.minutes = @(minutes);
    self.seconds = @(seconds);

    return self;
}

- (void)setHours:(NSNumber<SDLInt> *)hours {
    [store sdl_setObject:hours forName:SDLRPCParameterNameHours];
}

- (NSNumber<SDLInt> *)hours {
    return [store sdl_objectForName:SDLRPCParameterNameHours];
}

- (void)setMinutes:(NSNumber<SDLInt> *)minutes {
    [store sdl_setObject:minutes forName:SDLRPCParameterNameMinutes];
}

- (NSNumber<SDLInt> *)minutes {
    return [store sdl_objectForName:SDLRPCParameterNameMinutes];
}

- (void)setSeconds:(NSNumber<SDLInt> *)seconds {
    [store sdl_setObject:seconds forName:SDLRPCParameterNameSeconds];
}

- (NSNumber<SDLInt> *)seconds {
    return [store sdl_objectForName:SDLRPCParameterNameSeconds];
}

@end

NS_ASSUME_NONNULL_END
