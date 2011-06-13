//
//  SettingsViewController.h
//  Periscope-v1
//
//  Created by Elias Wald on 6/13/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SettingsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate> {
    
    NSArray *fieldLabels;
    IBOutlet UITableView *signUpTable;
    IBOutlet UITableView *signInTable;
    IBOutlet UIToolbar *navigationBar;
    UITextField *textFieldBeingEdited;
    IBOutlet UIBarButtonItem *saveButton;
    IBOutlet UIBarButtonItem *cancelButton;
    IBOutlet UIButton *backgroundButton;
    
}
@property (nonatomic, retain) IBOutlet UITableView *signUpTable;
@property (nonatomic, retain) NSArray *fieldLabels;
@property (nonatomic, retain) IBOutlet UIToolbar *navigationBar;
@property (nonatomic, retain) UITextField *textFieldBeingEdited;
@property (nonatomic, retain) UIBarButtonItem *saveButton;
@property (nonatomic, retain) UIBarButtonItem *cancelButton;
@property (nonatomic, retain) UIButton *backgroundButton;
@property (nonatomic, retain) IBOutlet UITableView *signInTable;


- (IBAction)backgroundClick:(id)sender;
- (IBAction)cancel;
- (IBAction)save;


@end
