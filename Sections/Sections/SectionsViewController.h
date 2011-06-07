//
//  SectionsViewController.h
//  Sections
//
//  Created by Elias Wald on 6/7/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SectionsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    NSDictionary *names;
    NSArray *keys;
}
@property (nonatomic, retain) NSDictionary *names;
@property (nonatomic, retain) NSArray *keys;

@end
