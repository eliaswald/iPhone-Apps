//
//  DisclosureDetailController.h
//  Nav
//
//  Created by Elias Wald on 6/8/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DisclosureDetailController : UIViewController {
    IBOutlet UILabel *label;
    NSString *message;
}
@property (nonatomic, retain) UILabel *label;
@property (nonatomic, retain) NSString *message;

@end
