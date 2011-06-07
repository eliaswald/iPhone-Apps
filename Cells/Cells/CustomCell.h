//
//  CustomCell.h
//  Cells
//
//  Created by Elias Wald on 6/7/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kTbleViewRowHeight 66


@interface CustomCell : UITableViewCell {
    IBOutlet UILabel *nameLabel;
    IBOutlet UILabel *colorLabel;
}
@property (nonatomic, retain) UILabel *nameLabel;
@property (nonatomic, retain) UILabel *colorLabel;

@end
