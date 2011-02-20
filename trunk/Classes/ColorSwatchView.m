//
//  ColorSwatchView.m
//  ColorPicker
//
//  Created by Fabián Cañas on 9/9/10.
//  Copyright 2010 Fabián Cañas. All rights reserved.
//

#import "ColorSwatchView.h"
#import <QuartzCore/QuartzCore.h>

void drawRoundRect(CGContextRef context, CGRect rect) {
    CGFloat radius = 7;
    CGContextBeginPath(context);
	CGContextMoveToPoint(context, CGRectGetMinX(rect) + radius, CGRectGetMinY(rect));
    CGContextAddArc(context, CGRectGetMaxX(rect) - radius, CGRectGetMinY(rect) + radius, radius, 3 * M_PI / 2, 0, 0);
    CGContextAddArc(context, CGRectGetMaxX(rect) - radius, CGRectGetMaxY(rect) - radius, radius, 0, M_PI / 2, 0);
    CGContextAddArc(context, CGRectGetMinX(rect) + radius, CGRectGetMaxY(rect) - radius, radius, M_PI / 2, M_PI, 0);
    CGContextAddArc(context, CGRectGetMinX(rect) + radius, CGRectGetMinY(rect) + radius, radius, M_PI, 3 * M_PI / 2, 0);	
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);
}

@implementation ColorSwatchView

@synthesize swatchColor;

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    NSLog(@"in drawrect");
    CGColorSpaceRef rgba = CGColorSpaceCreateDeviceRGB();
    
    CGColorRef borderColor = [[UIColor darkGrayColor] CGColor];
    
    CGFloat channelsFill[] = {1.0,1.0,1.0,1.0};

    CGColorRef backgroundFill;
    if (swatchColor!=nil) {
        backgroundFill = [swatchColor CGColor];
    } else {
        backgroundFill = CGColorCreate(rgba, channelsFill);
    }
    
    CGContextSetFillColorWithColor(currentContext, backgroundFill);
    CGContextSetLineWidth(currentContext, 1);
    CGContextSetStrokeColorWithColor(currentContext, borderColor);
    
    //CGContextFillRect(currentContext, rect);
    NSLog(@"about to access");
    NSLog(@"frame width: %f\t\trect width: %f",self.frame.size.width,rect.size.width);
    
    if (rect.size.width==self.frame.size.width) {
        drawRoundRect(currentContext, rect);
    }
    
    CGColorSpaceRelease(rgba);
    //CGColorRelease(borderColor);
}


- (void)dealloc {
    [super dealloc];
}


@end
