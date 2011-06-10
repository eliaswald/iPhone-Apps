//
//  FlipsideViewController.h
//  AppSettings
//
//  Created by Elias Wald on 6/9/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FlipsideViewControllerDelegate;

@interface FlipsideViewController : UIViewController {
    IBOutlet UISwitch *engineSwitch;
    IBOutlet UISlider *warpFactorSlider;

}

@property (nonatomic, assign) id <FlipsideViewControllerDelegate> delegate;
@property (nonatomic, retain) UISwitch *engineSwitch;
@property (nonatomic, retain) UISlider *warpFactorSlider;

- (IBAction)done:(id)sender;

@end


@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end
