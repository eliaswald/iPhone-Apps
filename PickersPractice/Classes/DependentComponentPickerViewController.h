//
//  DependentComponentPickerViewController.h
//  PickersPractice
//
//  Created by Elias Wald on 6/3/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kStateComponent 0
#define kZipComponent 1

@interface DependentComponentPickerViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate> {
    IBOutlet UIPickerView *picker;
    
    NSDictionary *stateZips;
    NSArray *states;
    NSArray *curZips;
}
@property (nonatomic, retain) UIPickerView *picker;
@property (nonatomic, retain) NSDictionary *stateZips;
@property (nonatomic, retain) NSArray *states;
@property (nonatomic, retain) NSArray *curZips;

- (IBAction)buttonPressed;

@end
