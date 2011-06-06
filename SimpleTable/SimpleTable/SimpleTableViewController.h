//
//  SimpleTableViewController.h
//  SimpleTable
//
//  Created by Elias Wald on 6/6/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    NSArray *listData;
}
@property (nonatomic, retain) NSArray *listData;

@end
