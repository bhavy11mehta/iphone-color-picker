//
//  ColorPickerAppDelegate.h
//  ColorPicker
//
//  Created by Gilly Dekel on 23/3/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class StandinViewController;

@interface ColorPickerAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    StandinViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet StandinViewController *viewController;

@end

