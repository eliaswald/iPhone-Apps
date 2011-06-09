//
//  PresidentsDetailController.h
//  Nav
//
//  Created by Elias Wald on 6/9/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kNumberOfEditableRows 4
#define kNameRowIndex 0
#define kFromYearRowIndex 1
#define kToYearRowIndex 2
#define kPartyIndex 3

#define kLabelTag 4096

@class President;

@interface PresidentsDetailController : UITableViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate> {
    President *president;
    NSArray *fieldLabels;
    NSMutableDictionary *tempValues;
    UITextField *textFieldBeingEdited;
}
@property (nonatomic, retain) President *president;
@property (nonatomic, retain) NSArray *fieldLabels;
@property (nonatomic, retain) NSMutableDictionary *tempValues;
@property (nonatomic, retain) UITextField *textFieldBeingEdited;

- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;
- (IBAction)textFieldDone:(id)sender;

@end
