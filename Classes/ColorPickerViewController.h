//
//  ColorPickerViewController.h
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

#import <UIKit/UIKit.h>

@class ColorPickerViewController;

@protocol ColorPickerViewControllerDelegate <NSObject>

- (void)colorPickerViewController:(ColorPickerViewController *)colorPicker didSelectColor:(UIColor *)color;

@end

@interface ColorPickerViewController : UIViewController {
    id<ColorPickerViewControllerDelegate> delegate;
#ifdef IPHONE_COLOR_PICKER_SAVE_DEFAULT
    NSString *defaultsKey;
#else
    UIColor *defaultsColor;
#endif
    IBOutlet UIButton *chooseButton;
}

// Use this member to update the display after the default color value
// was changed.
// This is required when e.g. the view controller is kept in memory
// and is re-used for another color value selection
// Automatically called after construction, so no need to do it here.
-(void) moveToDefault;


@property(nonatomic,assign)	id<ColorPickerViewControllerDelegate> delegate;
#ifdef IPHONE_COLOR_PICKER_SAVE_DEFAULT
  @property(readwrite,nonatomic,retain) NSString *defaultsKey;
#else
  @property(readwrite,nonatomic,retain) UIColor *defaultsColor;
#endif
@property(readwrite,nonatomic,retain) IBOutlet UIButton *chooseButton;

- (IBAction) chooseSelectedColor;
- (UIColor *) getSelectedColor;

@end

