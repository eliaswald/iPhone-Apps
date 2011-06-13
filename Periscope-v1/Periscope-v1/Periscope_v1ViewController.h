//
//  Periscope_v1ViewController.h
//  Periscope-v1
//
//  Created by Elias Wald on 6/10/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "SettingsViewController.h"


@interface Periscope_v1ViewController : UIViewController <MKMapViewDelegate, UIScrollViewDelegate, UITextViewDelegate> {
    
    IBOutlet MKMapView *map;
    IBOutlet UIImageView *mainImage;
    IBOutlet UIScrollView *thumbnails;
    IBOutlet UITextView *description;
    SettingsViewController *settingsViewController;
    
}
@property (nonatomic, retain) MKMapView *map;
@property (nonatomic, retain) UIImageView *mainImage;
@property (nonatomic, retain) UIScrollView *thumbnails;
@property (nonatomic, retain) UITextView *description;
@property (nonatomic, retain) SettingsViewController *settingsViewController;

- (IBAction)popularFilterPressed:(id)sender;
- (IBAction)haveBeenFilterPressed:(id)sender;
- (IBAction)wantToGoFilterPressed:(id)sender;
- (IBAction)beenHereButtonPressed:(id)sender;
- (IBAction)wantToGoButtonPressed:(id)sender;
- (IBAction)locationButtonPressed:(id)sender;
- (IBAction)settingsButtonPressed:(id)sender;
- (IBAction)friendsButtonPressed:(id)sender;
- (IBAction)locateMeButtonPressed:(id)sender;

@end
