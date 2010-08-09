//
//  GradientView.h
//  ColorPicker
//
//  Created by Gilly Dekel on 23/3/09.
//  Extended by Fabián Cañas August 2010.
//  Copyright 2010. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface GradientView : UIView {
	CGGradientRef gradient;
	UIColor *theColor;
}

@property (readwrite,nonatomic,retain) UIColor *theColor;
- (void) setupGradient;
@end
