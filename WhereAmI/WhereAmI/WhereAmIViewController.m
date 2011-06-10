//
//  WhereAmIViewController.m
//  WhereAmI
//
//  Created by Elias Wald on 6/10/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import "WhereAmIViewController.h"

@implementation WhereAmIViewController
@synthesize lat, longit, locationManager, startingPoint, horizAcc, alt, dist, vertAcc;

- (void)dealloc
{
    [locationManager release];
    [startingPoint release];
    [lat release];
    [longit release];
    [dist release];
    [alt release];
    [vertAcc release];
    [horizAcc release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    self.locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
    [super viewDidLoad];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - CLLocationManagerDelegate Methods

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    if (startingPoint == nil)
        self.startingPoint = newLocation;
    NSString *latitudeString = [[NSString alloc] initWithFormat:@"%g°", newLocation.coordinate.latitude];
    lat.text = latitudeString;
    [latitudeString release];
    
    NSString *longitString = [[NSString alloc] initWithFormat:@"%g°", newLocation.coordinate.longitude];
    longit.text = longitString;
    [longitString release];
    
    NSString *horizAccur = [[NSString alloc] initWithFormat:@"%gm", newLocation.horizontalAccuracy];
    horizAcc.text = horizAccur;
    [horizAccur release];
    
    NSString *altitude = [[NSString alloc] initWithFormat:@"%gm", newLocation.altitude];
    alt.text = altitude;
    [altitude release];
    
    NSString *verticalAccString = [[NSString alloc] initWithFormat:@"%gm", newLocation.verticalAccuracy];
    vertAcc.text = verticalAccString;
    [verticalAccString release];
    
    CLLocationDistance distance = [newLocation distanceFromLocation:startingPoint];
    NSString *distanceString = [[NSString alloc] initWithFormat:@"%gm", distance];
    dist.text = distanceString;
    [distanceString release];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSString *errorType = (error.code == kCLErrorDenied) ? @"Access Denided" : @"Unknown Error";
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error getting Location" message:errorType delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil];
    [alert show];
    [alert release];
}
@end
