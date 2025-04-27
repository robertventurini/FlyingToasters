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

static NSNotificationName const ScreenSaverWillStopNotificationName = @"com.apple.screensaver.willstop";

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
        
        
        [[NSDistributedNotificationCenter defaultCenter] addObserver:self
                                                            selector:@selector(screenSaverWillStopNotification:)
                                                                name:ScreenSaverWillStopNotificationName
                                                              object:nil];
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

- (void)screenSaverWillStopNotification:(NSNotification*)notification
{
    if (@available(macOS 14.0, *)) {
        // Bug in macOS 14+ warrants forcefully exiting the screensaver
        // so that the 'legacyScreenSaver' process will also quit and release its memory.
        // This is hacky, but seems to side step the problem.
        // This approach was reported working on the aerial screensaver here:
        // https://github.com/JohnCoates/Aerial/issues/1305
        exit(0);
    }
}

@end
