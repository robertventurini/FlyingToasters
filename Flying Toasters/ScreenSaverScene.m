//
//  ScreenSaverScene.m
//  Flying Toasters
//
//  Created by Robert Venturini on 3/9/19.
//  Copyright © 2019 Robert Venturini. All rights reserved.
//

#import "ScreenSaverScene.h"

@interface ScreenSaverScene ()

@end

@implementation ScreenSaverScene

- (instancetype)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size]) {
        
    }
    
    return self;
}

- (BOOL)acceptsFirstResponder
{
    // This scene is intended for use in a screensaver -- do not override the
    // built in screensaver catches or it will be difficult to end...
    return NO;
}

@end
