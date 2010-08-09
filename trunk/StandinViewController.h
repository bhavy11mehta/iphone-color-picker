//
//  StandinViewController.h
//  ColorPicker
//
//  Created by Fabián Cañas on 8/9/10.
//  Copyright 2010 University of Colorado, Boulder. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColorPickerViewController.h"

@interface StandinViewController : UIViewController <ColorPickerViewControllerDelegate> {
    IBOutlet UIView *colorSwatch;
}

@property (readwrite,nonatomic,retain) IBOutlet UIView *colorSwatch;

-(IBAction) selectColor:(id)sender;

@end
