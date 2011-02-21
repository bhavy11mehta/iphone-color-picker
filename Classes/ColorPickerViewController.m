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

@synthesize delegate, chooseButton;
#ifdef IPHONE_COLOR_PICKER_SAVE_DEFAULT
@synthesize defaultsKey;
#else
@synthesize defaultsColor;
#endif

NSString *keyForHue = @"hue";
NSString *keyForSat = @"sat";
NSString *keyForBright = @"bright";

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
#ifdef IPHONE_COLOR_PICKER_SAVE_DEFAULT
	if (defaultsKey==nil) {
        self.defaultsKey = @"";
        NSLog(@"problem 0 in ColorPickerViewController.viewDidLoad");
    }
#endif
    
	
    [self moveToDefault];   // Move the crosshair to the default setting
}

-(void) moveToDefault {
	NSUserDefaults *saveColors = [NSUserDefaults standardUserDefaults];
	UIColor *theColor;
	ColorPickerView *theView = (ColorPickerView *)[self view];
  #ifdef IPHONE_COLOR_PICKER_SAVE_DEFAULT
    if ([defaultsKey isEqualToString:@"CMYColor"]) { // CMY Color
		NSArray *componentsArray = [saveColors objectForKey:@"CMYComponents"];
		float components[5] = {[[componentsArray objectAtIndex:0] floatValue], [[componentsArray objectAtIndex:1] floatValue], [[componentsArray objectAtIndex:2] floatValue], 0.0, 1.0};
		
		CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceCMYK();
		CGColorRef color = CGColorCreate(colorSpace, components);
		
		theColor = [UIColor colorWithCGColor:color];
		
		[theView setColor:theColor];
		
		CGColorRelease(color);
		CGColorSpaceRelease(colorSpace);
	} else { // RGB Color
		NSData *colorData = [saveColors objectForKey:defaultsKey];
		if (colorData != nil) {
			theColor = (UIColor*)[NSKeyedUnarchiver unarchiveObjectWithData:colorData];
		}
		
		[theView setColor:theColor];
	}
  #else
    [theView setColor:defaultsColor];
  #endif
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

- (IBAction) cancelColorSelection {
    #ifdef IPHONE_COLOR_PICKER_SAVE_DEFAULT
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
	if (defaultsKey==nil) {
        defaultsKey = @"";
        NSLog(@"problem 0 in ColorPickerViewController.viewDidLoad");
    }
    
	UIColor *theColor;
	
    if ([defaultsKey isEqualToString:@"CMYColor"]) { // CMY Color
		NSArray *componentsArray = [userDefaults objectForKey:@"CMYComponents"];
		float components[5] = {[[componentsArray objectAtIndex:0] floatValue], [[componentsArray objectAtIndex:1] floatValue], [[componentsArray objectAtIndex:2] floatValue], 0.0, 1.0};
		
		CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceCMYK();
		CGColorRef color = CGColorCreate(colorSpace, components);
		
		theColor = [UIColor colorWithCGColor:color];
		
		[delegate colorPickerViewController:self didSelectColor:theColor];
		
		CGColorRelease(color);
		CGColorSpaceRelease(colorSpace);
	} else { // RGB Color
		NSData *colorData = [userDefaults objectForKey:defaultsKey];
		if (colorData != nil) {
			theColor = (UIColor*)[NSKeyedUnarchiver unarchiveObjectWithData:colorData];
		}
		
		[delegate colorPickerViewController:self didSelectColor:theColor];
	}
    #else
    [self dismissModalViewControllerAnimated:YES];
    #endif
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


// Housekeeping actions when a view as unloaded
- (void)viewDidUnload {
  // Release any retained subviews of the main view.
#if ___IPHONE_OS_VERSION_MAX_ALLOWED >= 30000
  [super viewDidUnload];  // First super, from iOS 3 on

  self.chooseButton=nil;   // Same as release, but also setting it to nil
#endif

  return;
}



- (void)dealloc {
    // Release claimed resources also
#ifdef IPHONE_COLOR_PICKER_SAVE_DEFAULT
    [defaultsKey release];
#else
    [defaultsColor release];
#endif

    [super dealloc];
}

@end
