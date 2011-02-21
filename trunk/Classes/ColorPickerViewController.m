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


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	NSUserDefaults *saveColors = [NSUserDefaults standardUserDefaults];
	if (defaultsKey==nil) {
        defaultsKey = @"";
    }
	
	UIColor *theColor;
	
	ColorPickerView *theView = (ColorPickerView *)[self view];
	
	if ([defaultsKey isEqualToString:@"CMYColor"]) { // CMY Color
		NSArray *componentsArray = [saveColors objectForKey:@"CMYComponents"];
		float components[5] = {[[componentsArray objectAtIndex:0] floatValue], [[componentsArray objectAtIndex:1] floatValue], [[componentsArray objectAtIndex:2] floatValue], 0.0, 1.0};
		
		CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceCMYK();
		CGColorRef color = CGColorCreate(colorSpace, components);
		
		theColor = [UIColor colorWithCGColor:color];
		
		[theView setColor:theColor];
		
		CGColorRelease(color);
		CGColorSpaceRelease(colorSpace);
	} else {
		NSData *colorData = [saveColors objectForKey:defaultsKey];
		if (colorData != nil) {
			theColor = (UIColor*)[NSKeyedUnarchiver unarchiveObjectWithData:colorData];
		}
		
		[theView setColor:theColor];
	}
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
