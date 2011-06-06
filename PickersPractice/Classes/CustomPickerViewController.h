//
//  CustomPickerViewController.h
//  PickersPractice
//
//  Created by Elias Wald on 6/3/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CustomPickerViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource> {
    IBOutlet UIPickerView *picker;
    IBOutlet UILabel *winLabel;
    
    NSArray *column1;
    NSArray *column2;
    NSArray *column3;
    NSArray *column4;
    NSArray *column5;
}

@property (nonatomic, retain) UIPickerView *picker;
@property (nonatomic, retain) UILabel *winLabel;
@property (nonatomic, retain) NSArray *column1;
@property (nonatomic, retain) NSArray *column2;
@property (nonatomic, retain) NSArray *column3;
@property (nonatomic, retain) NSArray *column4;
@property (nonatomic, retain) NSArray *column5;
- (IBAction)spin;

@end
