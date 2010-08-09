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

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
