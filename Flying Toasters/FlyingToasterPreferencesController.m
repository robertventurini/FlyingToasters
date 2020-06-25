//
//  FlyingToasterPreferencesController.m
//  Flying Toasters
//
//  Created by Robert Venturini on 3/9/19.
//  Copyright © 2019 Robert Venturini. All rights reserved.
//

#import "FlyingToasterPreferencesController.h"
#import "ToasterDefaults.h"

@interface FlyingToasterPreferencesController ()
@property (weak) IBOutlet NSSlider* speedSlider;
@property (weak) IBOutlet NSSlider* toastSlider;
@property (weak) IBOutlet NSSlider* densitySlider;
@end

@implementation FlyingToasterPreferencesController
- (void)windowDidLoad {
    [super windowDidLoad];
    
    self.speedSlider.integerValue =
    [self tickerValueForFlightSpeed:[ToasterDefaults getFlightSpeed]];
    
    self.toastSlider.integerValue =
    [self tickerValueForToastLevel:[ToasterDefaults getToastLevel]];
    
    self.densitySlider.integerValue = [ToasterDefaults getNumberOfToasters];
}

#pragma mark - Translation Methods
- (NSUInteger)tickerValueForFlightSpeed:(FlightSpeed)speed
{
    switch (speed) {
        case kSnailSpeed:
            return 0;
            break;
            
        case kSlowSpeed:
            return 1;
            break;
            
        case kMediumSpeed:
            return 2;
            break;
            
        case kFastSpeed:
            return 3;
            break;
            
        case kLightningSpeed:
            return 4;
            break;
    }
}

- (FlightSpeed)speedForTickerValue:(NSUInteger)tickerValue
{
    if (tickerValue < 1) {
        return kSnailSpeed;
    }
    
    if (tickerValue == 1) {
        return kSlowSpeed;
    }
    
    if (tickerValue == 2) {
        return kMediumSpeed;
    }
    
    if (tickerValue == 3) {
        return kFastSpeed;
    }
    
    if (tickerValue > 3) {
        return kLightningSpeed;
    }
    
    return kMediumSpeed;
}

- (NSUInteger)tickerValueForToastLevel:(ToastLevel)level
{
    switch (level) {
        case kLightToast:
            return 0;
            break;
            
        case kGoldenBrownToast:
            return 1;
            break;
            
        case kDarkToast:
            return 2;
            break;
            
        case kBurntToast:
            return 3;
            break;
    }
}

- (ToastLevel)levelForTickerValue:(NSUInteger)tickerValue
{
    if (tickerValue < 1) {
        return kLightToast;
    }
    
    if (tickerValue == 2) {
        return kDarkToast;
    }
    
    if (tickerValue > 2) {
        return kBurntToast;
    }
    return kGoldenBrownToast;
}

#pragma mark - Actions
- (IBAction)didPressDone:(id)sender
{
    if (self.delegate != nil) {
        [self.delegate flyingToasterPreferencesDidFinish:self];
        return;
    }

    // Actual screensaver return here...
    [self.window.sheetParent endSheet:self.window returnCode:NSModalResponseOK];
}

- (IBAction)didChangeToastLevel:(NSSlider*)toastSlider
{
    ToastLevel level = [self levelForTickerValue:toastSlider.integerValue];
    [ToasterDefaults setToastLevel:level];
}

- (IBAction)didChangeFlightSpeed:(NSSlider*)speedSlider
{
    FlightSpeed speed = [self speedForTickerValue:speedSlider.integerValue];
    [ToasterDefaults setFlightSpeed:speed];
}

- (IBAction)didChangeToasterDensity:(NSSlider*)densitySlider
{
    [ToasterDefaults setNumberOfToasters:densitySlider.intValue];
    NSLog(@"[Flying Toasters] - density changed: %d", densitySlider.intValue);
}

@end
