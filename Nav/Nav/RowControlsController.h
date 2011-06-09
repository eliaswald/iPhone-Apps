//
//  RowControlsController.h
//  Nav
//
//  Created by Elias Wald on 6/8/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondLevelViewController.h"

#define kSwitchTag 100

@interface RowControlsController : SecondLevelViewController <UITableViewDelegate, UITableViewDataSource> {
    NSArray *list;
}
@property (nonatomic, retain) NSArray *list;

@end
