//
//  MainViewController.h
//  AppSettings
//
//  Created by Elias Wald on 6/9/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import "FlipsideViewController.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate> {
    IBOutlet UILabel *usernameLabel;
    IBOutlet UILabel *passwordLabel;
    IBOutlet UILabel *protocolLabel;
    IBOutlet UILabel *warpDriveLabel;
    IBOutlet UILabel *warpFactorLabel;
    
    IBOutlet UILabel *favoriteTeaLabel;
    IBOutlet UILabel *favoriteCandyLabel;
    IBOutlet UILabel *favoriteGameLabel;
    IBOutlet UILabel *favoriteExcuseLabel;
    IBOutlet UILabel *favoriteSinLabel;
}
@property (nonatomic, retain) UILabel *usernameLabel;
@property (nonatomic, retain) UILabel *passwordLabel;
@property (nonatomic, retain) UILabel *protocolLabel;
@property (nonatomic, retain) UILabel *warpDriveLabel;
@property (nonatomic, retain) UILabel *warpFactorLabel;

@property (nonatomic, retain) UILabel *favoriteTeaLabel;
@property (nonatomic, retain) UILabel *favoriteCandyLabel;
@property (nonatomic, retain) UILabel *favoriteGameLabel;
@property (nonatomic, retain) UILabel *favoriteExcuseLabel;
@property (nonatomic, retain) UILabel *favoriteSinLabel;

-(IBAction)refreshFields;

- (IBAction)showInfo:(id)sender;

@end
