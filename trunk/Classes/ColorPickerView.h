//
//  ColorPickerView.h
//  ColorPicker
//
//  Created by Gilly Dekel on 23/3/09.
//  Extended by Fabián Cañas August 2010.
//  Copyright 2010. All rights reserved.
//

#import <UIKit/UIKit.h>


@class GradientView;
@interface ColorPickerView : UIView {
	GradientView *gradientView;
	UIImage *backgroundImage; //Image that will sit in back on the view
	UIImage *closeButtonImage; //Image for close button
	UIImage *nextButtonImage; //Image for next button
	IBOutlet UIImageView *backgroundImageView;
	IBOutlet UIView *showColor;
	IBOutlet UIImageView *crossHairs;
	IBOutlet UIImageView *brightnessBar;
	
	//Private vars
	CGRect colorMatrixFrame;
	
	CGFloat currentBrightness;
	CGFloat currentHue;
	CGFloat currentSaturation;
	
	UIColor *currentColor;
	
	
	
}

@property (nonatomic,retain) UIImage *backgroundImage;
@property (nonatomic,retain) UIImage *closeButtonImage;
@property (nonatomic,retain) UIImage *nextButtonImage;

@property (readwrite) CGFloat currentBrightness;
@property (readwrite) CGFloat currentHue;
@property (readwrite) CGFloat currentSaturation;

- (UIColor *) getColorShown;

@end
