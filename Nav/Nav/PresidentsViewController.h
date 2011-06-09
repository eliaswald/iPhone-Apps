//
//  PresidentsViewController.h
//  Nav
//
//  Created by Elias Wald on 6/9/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondLevelViewController.h"

@interface PresidentsViewController : SecondLevelViewController <UITableViewDelegate, UITableViewDataSource> {
    NSMutableArray *list;
}
@property (nonatomic, retain) NSMutableArray *list;

@end
