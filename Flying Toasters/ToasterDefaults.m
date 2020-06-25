//
//  ToasterDefaults.m
//  Flying Toasters
//
//  Created by Robert Venturini on 3/9/19.
//  Copyright © 2019 Robert Venturini. All rights reserved.
//

#import "ToasterDefaults.h"

static NSString* ToasterDefaultsFlightSpeedKey = @"toaster_flight_speed";
static NSString* ToasterDefaultsToastLevelKey = @"toast_level";
static NSString* ToasterDefaultsNumberOfToastersKey = @"number_of_toasters";

@implementation ToasterDefaults
+ (ScreenSaverDefaults*)_defaults
{
    ScreenSaverDefaults* defaults =
    [ScreenSaverDefaults defaultsForModuleWithName:@"Flying Toasters"];

    [defaults synchronize];

    return defaults;
}

+ (FlightSpeed)getFlightSpeed
{
    NSNumber* speedNum = [[self _defaults] objectForKey:ToasterDefaultsFlightSpeedKey];
    
    if (speedNum) {
        return [speedNum unsignedIntegerValue];
    }
    
    return kMediumSpeed;
}

+ (void)setFlightSpeed:(FlightSpeed)speed
{
    [[self _defaults] setObject:@(speed) forKey:ToasterDefaultsFlightSpeedKey];
}

+ (ToastLevel)getToastLevel
{
    NSNumber* toastLevel = [[self _defaults] objectForKey:ToasterDefaultsToastLevelKey];
    
    if (toastLevel) {
        return [toastLevel unsignedIntegerValue];
    }
    
    return kGoldenBrownToast;
}

+ (void)setToastLevel:(ToastLevel)level
{
    [[self _defaults] setObject:@(level) forKey:ToasterDefaultsToastLevelKey];
}

+ (void)setNumberOfToasters:(NSUInteger)numOfToasters
{
    [[self _defaults] setObject:@(numOfToasters) forKey:ToasterDefaultsNumberOfToastersKey];
}

+ (NSUInteger)getNumberOfToasters
{
    NSNumber* numOfToasters = [[self _defaults] objectForKey:ToasterDefaultsNumberOfToastersKey];
    
    if (numOfToasters != nil) {
        return [numOfToasters unsignedIntegerValue];
    }
    
    return 6;
}

@end
