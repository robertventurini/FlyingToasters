//
//  FlyingToasterScreenSaverView.m
//  Flying Toasters
//
//  Created by Robert Venturini on 3/9/19.
//  Copyright © 2019 Robert Venturini. All rights reserved.
//

#import "FlyingToasterPreferencesController.h"
#import "FlyingToastersView.h"
#import "FlyingToasterScreenSaverView.h"

@interface FlyingToasterScreenSaverView ()
@property (strong) FlyingToastersView* ftv;
@property (strong) FlyingToasterPreferencesController* prefsController;
@end

@implementation FlyingToasterScreenSaverView
- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    if (self = [super initWithFrame:frame isPreview:isPreview]) {
        [self setAnimationTimeInterval:1/30.0];
        
        _ftv = [[FlyingToastersView alloc] init];
        _ftv.frame = NSMakeRect(0, 0, frame.size.width, frame.size.height);
        
        [self addSubview:_ftv];
    }
    
    return self;
}

- (void)setFrame:(NSRect)frame
{
    [super setFrame:frame];
    _ftv.frame = NSMakeRect(0, 0, frame.size.width, frame.size.height);
}

- (void)startAnimation
{
    [super startAnimation];
    
    self.ftv.toastLevel = [ToasterDefaults getToastLevel];
    self.ftv.speed = [ToasterDefaults getFlightSpeed];
    self.ftv.numOfToasters = [ToasterDefaults getNumberOfToasters];
    
    [self.ftv start];
}

- (void)stopAnimation
{
    [super stopAnimation];
    [self.ftv end];
}

- (void)animateOneFrame
{
    return;
}

- (BOOL)hasConfigureSheet
{
    return YES;
}

- (NSWindow*)configureSheet
{
    _prefsController =
    [[FlyingToasterPreferencesController alloc] initWithWindowNibName:@"FlyingToasterPreferencesController"];
    
    return _prefsController.window;
}

@end
