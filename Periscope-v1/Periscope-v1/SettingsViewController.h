//
//  SettingsViewController.h
//  Periscope-v1
//
//  Created by Elias Wald on 6/13/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SettingsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate> {
    
    NSArray *signUpLabels;
    IBOutlet UITableView *signUpTable;
    IBOutlet UITableView *signInTable;
    IBOutlet UIToolbar *navigationBar;
    UITextField *textFieldBeingEdited;
    IBOutlet UIBarButtonItem *saveButton;
    IBOutlet UIBarButtonItem *cancelButton;
    NSArray *signInLabels;
    
}
@property (nonatomic, retain) IBOutlet UITableView *signUpTable;
@property (nonatomic, retain) NSArray *signUpLabels;
@property (nonatomic, retain) IBOutlet UIToolbar *navigationBar;
@property (nonatomic, retain) UITextField *textFieldBeingEdited;
@property (nonatomic, retain) UIBarButtonItem *saveButton;
@property (nonatomic, retain) UIBarButtonItem *cancelButton;
@property (nonatomic, retain) IBOutlet UITableView *signInTable;
@property (nonatomic, retain) NSArray *signInLabels;


- (IBAction)cancel;
- (IBAction)save;
- (IBAction)signIn;
- (IBAction)signUp;


@end
