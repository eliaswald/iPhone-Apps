//
//  SectionsViewController.h
//  Sections
//
//  Created by Elias Wald on 6/7/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SectionsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate> {
    IBOutlet UITableView *table;
    IBOutlet UISearchBar *search;
    NSDictionary *allNames;
    NSMutableDictionary *names;
    NSMutableArray *keys;
}
@property (nonatomic, retain) NSMutableDictionary *names;
@property (nonatomic, retain) NSMutableArray *keys;
@property (nonatomic, retain) UITableView *table;
@property (nonatomic, retain) UISearchBar *search;
@property (nonatomic, retain) NSDictionary *allNames;
- (void)resetSearch;
- (void)handleSearchForTerm:(NSString *)searchTerm;

@end
