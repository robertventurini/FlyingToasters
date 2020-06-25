//
//  ToasterDefaults.h
//  Flying Toasters
//
//  Created by Robert Venturini on 3/9/19.
//  Copyright © 2019 Robert Venturini. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <ScreenSaver/ScreenSaver.h>

typedef NS_ENUM(NSUInteger, ToastLevel) {
    kLightToast,
    kGoldenBrownToast,
    kDarkToast,
    kBurntToast
};

typedef NS_ENUM(NSUInteger, FlightSpeed) {
    kSnailSpeed = 20,
    kSlowSpeed = 10,
    kMediumSpeed = 8,
    kFastSpeed = 3,
    kLightningSpeed = 1
};

@interface ToasterDefaults : ScreenSaverDefaults
+ (FlightSpeed)getFlightSpeed;
+ (void)setFlightSpeed:(FlightSpeed)speed;

+ (ToastLevel)getToastLevel;
+ (void)setToastLevel:(ToastLevel)level;

+ (void)setNumberOfToasters:(NSUInteger)numOfToasters;
+ (NSUInteger)getNumberOfToasters;

@end
