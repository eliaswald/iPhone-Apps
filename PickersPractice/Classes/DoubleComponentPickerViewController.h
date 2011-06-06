//
//  DoubleComponentPickerViewController.h
//  PickersPractice
//
//  Created by Elias Wald on 6/3/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kFillingComponent 0;
#define kBreadComponent 1;

@interface DoubleComponentPickerViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate> {
    IBOutlet UIPickerView *doublePicker;
    NSArray *fillingTypes;
    NSArray *breakTypes;
}
@property (nonatomic, retain) UIPickerView *doublePicker;
@property (nonatomic, retain) NSArray *fillingTypes;
@property (nonatomic, retain) NSArray *breadTypes;
- (IBAction)buttonPressed;

@end
