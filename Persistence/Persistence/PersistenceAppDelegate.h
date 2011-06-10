//
//  PersistenceAppDelegate.h
//  Persistence
//
//  Created by Elias Wald on 6/10/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PersistenceViewController;

@interface PersistenceAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet PersistenceViewController *viewController;

@end
