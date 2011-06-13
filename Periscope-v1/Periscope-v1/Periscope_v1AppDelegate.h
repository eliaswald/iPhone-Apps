//
//  Periscope_v1AppDelegate.h
//  Periscope-v1
//
//  Created by Elias Wald on 6/10/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Periscope_v1ViewController;

@interface Periscope_v1AppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet Periscope_v1ViewController *viewController;

@end
