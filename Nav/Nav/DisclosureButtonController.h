//
//  DisclosureButtonController.h
//  Nav
//
//  Created by Elias Wald on 6/8/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondLevelViewController.h"

@class DisclosureDetailController;

@interface DisclosureButtonController : SecondLevelViewController <UITableViewDelegate, UITableViewDataSource> {
    NSArray *list;
    DisclosureDetailController *childController;
}
@property (nonatomic, retain) NSArray *list;

@end
