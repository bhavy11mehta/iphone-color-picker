//
//  ColorPickerAppDelegate.m
//  ColorPicker
//
//  Created by Gilly Dekel on 23/3/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "ColorPickerAppDelegate.h"
#import "ColorPickerViewController.h"

@implementation ColorPickerAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
