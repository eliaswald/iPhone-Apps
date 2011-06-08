//
//  RootViewController.h
//  Nav
//
//  Created by Elias Wald on 6/8/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RootViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource> {
    NSArray *controllers;
}
@property (nonatomic, retain) NSArray *controllers;

@end
