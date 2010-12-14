//
//  ColorPickerViewController.m
//  ColorPicker
//
//  Created by Gilly Dekel on 23/3/09.
//  Extended by Fabián Cañas August 2010.
//  Copyright 2010 Fabián Cañas. All rights reserved.
//
//    Redistribution and use in source and binary forms, with or without
//    modification, are permitted provided that the following conditions are met:
//    * Redistributions of source code must retain the above copyright
//    notice, this list of conditions and the following disclaimer.
//    * Redistributions in binary form must reproduce the above copyright
//    notice, this list of conditions and the following disclaimer in the
//    documentation and/or other materials provided with the distribution.
//    * Neither the name of the <organization> nor the
//    names of its contributors may be used to endorse or promote products
//    derived from this software without specific prior written permission.
//
//    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
//    ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
//    WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
//    DISCLAIMED. IN NO EVENT SHALL FABIAN CANAS BE LIABLE FOR ANY
//    DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
//    (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
//     LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
//    ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//    (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
//    SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
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


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
#ifdef IPHONE_COLOR_PICKER_SAVE_DEFAULT
	NSUserDefaults *saveColors = [NSUserDefaults standardUserDefaults];
	if (defaultsKey==nil) {
        self.defaultsKey = @"";
    }
    
    NSData *colorData= [saveColors objectForKey:defaultsKey];
    UIColor *color;
    if (colorData!=nil) {
        color = (UIColor*)[NSKeyedUnarchiver unarchiveObjectWithData:colorData];
    }
#endif
    
	
    [self moveToDefault];   // Move the crosshair to the default setting
}

-(void) moveToDefault {
  ColorPickerView *theView = (ColorPickerView*) [self view];
  #ifdef IPHONE_COLOR_PICKER_SAVE_DEFAULT
    [theView setColor:color];
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
