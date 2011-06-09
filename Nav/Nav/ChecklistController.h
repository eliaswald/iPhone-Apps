//
//  ChecklistController.h
//  Nav
//
//  Created by Elias Wald on 6/8/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondLevelViewController.h"

@interface ChecklistController : SecondLevelViewController <UITableViewDelegate, UITableViewDataSource> {
    NSArray *list;
    NSIndexPath *lastIndexPath;
}
@property (nonatomic, retain) NSIndexPath *lastIndexPath;
@property (nonatomic, retain) NSArray *list;

@end
