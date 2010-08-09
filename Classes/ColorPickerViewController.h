//
//  ColorPickerViewController.h
//  ColorPicker
//
//  Created by Gilly Dekel on 23/3/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AboutScreenViewController;

@interface ColorPickerViewController : UIViewController {
	
}

@property (nonatomic, retain) AboutScreenViewController * aboutScreenViewController;

- (UIColor *) getSelectedColor;

@end

