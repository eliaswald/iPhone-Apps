//
//  DatePickerViewController.h
//  PickersPractice
//
//  Created by Elias Wald on 6/3/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DatePickerViewController : UIViewController {
    IBOutlet UIDatePicker *datePicker;
}

@property (nonatomic, retain) UIDatePicker *datePicker;
-(IBAction)buttonPressed:(id)sender;

@end
