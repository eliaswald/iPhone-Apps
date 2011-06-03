//
//  ControlTestViewController.h
//  ControlTest
//
//  Created by Elias Wald on 6/2/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ControlTestViewController : UIViewController {
	IBOutlet UITextField *cityField;
	IBOutlet UITextField *stateField;
}
@property (nonatomic, retain) UITextField *cityField;
@property (nonatomic, retain) UITextField *stateField;

- (IBAction)textFieldDoneEditing:(id)sender;
- (IBAction)backgroundClick:(id)sender;

@end

