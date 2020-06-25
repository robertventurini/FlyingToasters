//
//  FlyingToasterPreferencesController.h
//  Flying Toasters
//
//  Created by Robert Venturini on 3/9/19.
//  Copyright © 2019 Robert Venturini. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@protocol FlyingToasterPreferencesDelegate;

@interface FlyingToasterPreferencesController : NSWindowController
@property (weak) id<FlyingToasterPreferencesDelegate> delegate;
@end


@protocol FlyingToasterPreferencesDelegate <NSObject>
- (void)flyingToasterPreferencesDidFinish:(FlyingToasterPreferencesController*)prefs;
@end
