//
//  PersistenceViewController.h
//  Persistence
//
//  Created by Elias Wald on 6/10/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kFilename @"archive"
#define kDataKey @"Data"

@interface PersistenceViewController : UIViewController {
    IBOutlet UITextField *field1;
    IBOutlet UITextField *field2;
    IBOutlet UITextField *field3;
    IBOutlet UITextField *field4;
}
@property (nonatomic, retain) UITextField *field1;
@property (nonatomic, retain) UITextField *field2;
@property (nonatomic, retain) UITextField *field3;
@property (nonatomic, retain) UITextField *field4;

-(NSString *)dataFilePath;
-(void)applicationWillResignActiveNotification:(NSNotification *)notification;
-(IBAction)textFieldDoneEditing:(id)sender;

@end
