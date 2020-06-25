//
//  AppDelegate.m
//  Flying Toaster Test
//
//  Created by Robert Venturini on 3/9/19.
//  Copyright (c) 2019 Robert Venturini. All rights reserved.
//

#import "AppDelegate.h"
#import "FlyingToasterScreenSaverView.h"
#import "FlyingToasterPreferencesController.h"

@interface AppDelegate () <FlyingToasterPreferencesDelegate>

@property (weak) IBOutlet NSWindow *window;
@property (strong) FlyingToasterPreferencesController* preferencesController;
@property (strong) FlyingToasterScreenSaverView* ftv;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    self.ftv = [[FlyingToasterScreenSaverView alloc] init];
    self.ftv.frame = self.window.contentView.bounds;
    [self.window.contentView addSubview:self.ftv];

    self.ftv.translatesAutoresizingMaskIntoConstraints = NO;
    [self.window.contentView addConstraints:
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_ftv]|" options:NSLayoutFormatAlignAllCenterY metrics:nil views:NSDictionaryOfVariableBindings(_ftv)]];

    [self.window.contentView addConstraints:
    [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_ftv]|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:NSDictionaryOfVariableBindings(_ftv)]];

    [self.window makeKeyAndOrderFront:nil];
    [self.ftv startAnimation];

    self.preferencesController =
    [[FlyingToasterPreferencesController alloc] initWithWindowNibName:@"FlyingToasterPreferencesController"];
    [self.preferencesController.window setTitle:@"Flying Toaster Test Preferences"];
    self.preferencesController.delegate = self;

    NSWindow* preferencesWindow = self.preferencesController.window;
    [preferencesWindow setStyleMask:NSWindowStyleMaskTitled|NSWindowStyleMaskClosable];



    // Test line to ensure we exit cleanly
    //    [self.ftv performSelector:@selector(stopAnimation) withObject:nil afterDelay:10];
};

- (IBAction)didSelectPrefences:(id)sender
{
    [self.preferencesController showWindow:self];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (void)flyingToasterPreferencesDidFinish:(FlyingToasterPreferencesController*)prefs
{
    // Restart
    [self.ftv stopAnimation];
    [self.ftv startAnimation];

    [[prefs window] close];
}

@end
