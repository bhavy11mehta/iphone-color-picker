//
//  ColorPickerAppDelegate.h
//  ColorPicker
//
//  Created by Gilly Dekel on 23/3/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ColorPickerViewController;

@interface ColorPickerAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ColorPickerViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ColorPickerViewController *viewController;

@end

