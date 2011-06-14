//
//  Periscope_v1ViewController.m
//  Periscope-v1
//
//  Created by Elias Wald on 6/10/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import "Periscope_v1ViewController.h"

@implementation Periscope_v1ViewController
@synthesize map, mainImage, description, thumbnails, settingsViewController, settingsViewContainer;

- (void)dealloc
{
    //[settingsViewController release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - Background Button
- (IBAction)backgroundClick
{
    if ([settingsViewContainer.subviews count] != 0){
        if (settingsViewController.textFieldBeingEdited == nil){
            [self.view exchangeSubviewAtIndex:1 withSubviewAtIndex:7];
            [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:6];
            [settingsViewController.view removeFromSuperview];
        }
        else{
            [settingsViewController.textFieldBeingEdited resignFirstResponder];
            settingsViewController.textFieldBeingEdited = nil;
        }
    }
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    MKUserLocation *location = map.userLocation;
    CLLocationCoordinate2D userCoord = location.location.coordinate;
    MKCoordinateSpan span = MKCoordinateSpanMake(.1, .1);
    [map setRegion:MKCoordinateRegionMake(userCoord, span) animated:YES];
    map.zoomEnabled = YES;
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
    return YES;
}

#pragma mark - Navigation Bar Button Methods
#pragma mark Settings Methods
- (IBAction)settingsButtonPressed:(id)sender
{
    if(settingsViewController == nil) {
        SettingsViewController *settingsView = [[SettingsViewController alloc] initWithNibName:@"SettingsView" bundle:nil];
        self.settingsViewController = settingsView;
        [settingsView release];
    }
    
    if([settingsViewContainer.subviews count] == 0) {
        [self.settingsViewContainer insertSubview:settingsViewController.view atIndex:0];
        [self.view exchangeSubviewAtIndex:1 withSubviewAtIndex:7];
        [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:6];
    }
    else{
        [self.view exchangeSubviewAtIndex:1 withSubviewAtIndex:7];
        [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:6];
        [settingsViewController.view removeFromSuperview];
    }
}

- (void)resizeSettingsOnSignIn
{
    settingsViewContainer.frame = CGRectMake(72, 97, 624, 254);
}

- (void)resizeSettingsOnSignUp
{
    settingsViewContainer.frame = CGRectMake(72, 97, 624, 342);
}

- (IBAction)friendsButtonPressed:(id)sender
{
    
}

- (IBAction)locateMeButtonPressed:(id)sender
{
    MKUserLocation *location = map.userLocation;
    CLLocationCoordinate2D userCoord = location.location.coordinate;
    MKCoordinateSpan spanZoomOut = MKCoordinateSpanMake(1, 1);
    MKCoordinateSpan spanZoomIn = MKCoordinateSpanMake(.1, .1);
    while (location.updating)
        [map setRegion:MKCoordinateRegionMake(userCoord, spanZoomOut) animated:YES];
    [map setRegion:MKCoordinateRegionMake(userCoord, spanZoomIn) animated:YES];
}


#pragma mark - Bottom Button Methods
- (IBAction)popularFilterPressed:(id)sender
{
    
}

- (IBAction)haveBeenFilterPressed:(id)sender
{
    
}

- (IBAction)wantToGoFilterPressed:(id)sender
{
    
}

- (IBAction)locationButtonPressed:(id)sender
{
    
}

#pragma mark - Tag Button Methods
- (IBAction)beenHereButtonPressed:(id)sender
{
    if (!kSignedIn) {
        if(settingsViewController == nil) {
            SettingsViewController *settingsView = [[SettingsViewController alloc] initWithNibName:@"SettingsView" bundle:nil];
            self.settingsViewController = settingsView;
            [settingsView release];
        }
        
        if([settingsViewContainer.subviews count] == 0) {
            [self.settingsViewContainer insertSubview:settingsViewController.view atIndex:0];
            [self.view exchangeSubviewAtIndex:1 withSubviewAtIndex:7];
            [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:6];
        }
        else{
            [self.view exchangeSubviewAtIndex:1 withSubviewAtIndex:7];
            [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:6];
            [settingsViewController.view removeFromSuperview];
        }
    }
    
}

- (IBAction)wantToGoButtonPressed:(id)sender
{
    if (!kSignedIn) {
        if(settingsViewController == nil) {
            SettingsViewController *settingsView = [[SettingsViewController alloc] initWithNibName:@"SettingsView" bundle:nil];
            self.settingsViewController = settingsView;
            [settingsView release];
        }
        
        if([settingsViewContainer.subviews count] == 0) {
            [self.settingsViewContainer insertSubview:settingsViewController.view atIndex:0];
            [self.view exchangeSubviewAtIndex:1 withSubviewAtIndex:7];
            [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:6];
        }
        else{
            [self.view exchangeSubviewAtIndex:1 withSubviewAtIndex:7];
            [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:6];
            [settingsViewController.view removeFromSuperview];
        }
    }
}

@end
