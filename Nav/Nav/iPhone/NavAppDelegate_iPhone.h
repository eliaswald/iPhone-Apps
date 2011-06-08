//
//  NavAppDelegate_iPhone.h
//  Nav
//
//  Created by Elias Wald on 6/8/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavAppDelegate.h"

@interface NavAppDelegate_iPhone : NavAppDelegate {
    IBOutlet UINavigationController *navController;
}
@property (nonatomic, retain) UINavigationController *navController;

@end
