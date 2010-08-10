//
//  ColorPickerViewController.m
//  ColorPicker
//
//  Created by Gilly Dekel on 23/3/09.
//  Extended by Fabián Cañas August 2010.
//  Copyright 2010. All rights reserved.
//

#import "ColorPickerViewController.h"
#import "ColorPickerView.h"
#import "UIColor-HSVAdditions.h"

@implementation ColorPickerViewController

@synthesize delegate, defaultsKey, chooseButton;

NSString *keyForHue = @"hue";
NSString *keyForSat = @"sat";
NSString *keyForBright = @"bright";

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	NSUserDefaults *saveColors = [NSUserDefaults standardUserDefaults];
	if (defaultsKey==nil) {
        defaultsKey = @"";
        NSLog(@"problem 0 in ColorPickerViewController.viewDidLoad");
    }
    
    NSData *colorData= [saveColors objectForKey:defaultsKey];
    UIColor *color;
    if (colorData!=nil) {
        color = (UIColor*)[NSKeyedUnarchiver unarchiveObjectWithData:colorData];
    }
    
    ColorPickerView *theView = (ColorPickerView*) [self view];
	
    [theView setColor:color];
}

//- (void) viewWillDisappear :(BOOL)animated { 
//
//}

- (UIColor *) getSelectedColor {
	return [(ColorPickerView *) [self view] getColorShown];
}

- (IBAction) chooseSelectedColor {
    [delegate colorPickerViewController:self didSelectColor:[self getSelectedColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [super dealloc];
}

@end
