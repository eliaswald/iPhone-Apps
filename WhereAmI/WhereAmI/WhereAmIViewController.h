//
//  WhereAmIViewController.h
//  WhereAmI
//
//  Created by Elias Wald on 6/10/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface WhereAmIViewController : UIViewController <CLLocationManagerDelegate> {
    CLLocationManager *locationManager;
    
    CLLocation *startingPoint;
    
    IBOutlet UILabel *lat;
    IBOutlet UILabel *longit;
    IBOutlet UILabel *horizAcc;
    IBOutlet UILabel *alt;
    IBOutlet UILabel *vertAcc;
    IBOutlet UILabel *dist;
}
@property (nonatomic, retain) CLLocationManager *locationManager;
@property (nonatomic, retain) CLLocation *startingPoint;
@property (nonatomic, retain) UILabel *lat;
@property (nonatomic, retain) UILabel *longit;
@property (nonatomic, retain) UILabel *horizAcc;
@property (nonatomic, retain) UILabel *alt;
@property (nonatomic, retain) UILabel *vertAcc;
@property (nonatomic, retain) UILabel *dist;

@end
