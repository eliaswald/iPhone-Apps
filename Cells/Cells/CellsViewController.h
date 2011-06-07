//
//  CellsViewController.h
//  Cells
//
//  Created by Elias Wald on 6/7/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kNameValueTag 1
#define kColorValueTag 2

@interface CellsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    NSArray *computers;
}
@property (nonatomic, retain) NSArray *computers;

@end
