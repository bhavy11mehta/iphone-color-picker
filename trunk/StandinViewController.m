//
//  StandinViewController.m
//  ColorPicker
//
//  Created by Fabián Cañas on 8/9/10.
//  Copyright 2010 Fabián Cañas. All rights reserved.
//

#import "StandinViewController.h"

@implementation StandinViewController

@synthesize colorSwatch;

-(IBAction) selectColor:(id)sender {
    ColorPickerViewController *colorPickerViewController = 
        [[ColorPickerViewController alloc] initWithNibName:@"ColorPickerViewController" bundle:nil];
    colorPickerViewController.delegate = self;
    colorPickerViewController.defaultsKey = @"SwatchColor";
    [self presentModalViewController:colorPickerViewController animated:YES];
    [colorPickerViewController release];
}

- (void)colorPickerViewController:(ColorPickerViewController *)colorPicker didSelectColor:(UIColor *)color {
    NSLog(@"Color: %d",color);
    
    NSData *colorData = [NSKeyedArchiver archivedDataWithRootObject:color];
    [[NSUserDefaults standardUserDefaults] setObject:colorData forKey:colorPicker.defaultsKey];
    
    if ([colorPicker.defaultsKey isEqualToString:@"SwatchColor"]) {
        colorSwatch.backgroundColor = color;
    }
        
    [colorPicker dismissModalViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Retrieve saved user default for the color swatch - Must be archived before stored as a preference
    // Retrieve data object
    NSData *colorData = [[NSUserDefaults standardUserDefaults] objectForKey:@"SwatchColor"];
    UIColor *color;
    if (colorData!=nil) {
        // If the data object is valid, unarchive the color we've stored in it.
        color = (UIColor *)[NSKeyedUnarchiver unarchiveObjectWithData:colorData];
    } else {
        // If the data's not valid, the user default wasn't set, or there was an error retrieving the default value.
        
        // This is not the Apple-sanctioned way to set up defaults,
        // I've done it this way to consolidate initial defaults with error-checking code.
        
        // Create a new color (gray)
        color = [UIColor grayColor];
        // Archive the color into an NSData object
        colorData = [NSKeyedArchiver archivedDataWithRootObject:color];
        // Store the NSData into the user defaults
        [[NSUserDefaults standardUserDefaults] setObject:colorData forKey:@"SwatchColor"];
    }

    // Set the swatch color
    colorSwatch.backgroundColor = color;
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    colorSwatch = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
