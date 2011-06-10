//
//  AppSettingsAppDelegate.h
//  AppSettings
//
//  Created by Elias Wald on 6/9/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController;

@interface AppSettingsAppDelegate : NSObject <UIApplicationDelegate> {
    IBOutlet UIWindow *window;
    IBOutlet MainViewController *mainViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet MainViewController *mainViewController;

@end
