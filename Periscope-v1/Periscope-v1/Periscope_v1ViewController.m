//
//  Periscope_v1ViewController.m
//  Periscope-v1
//
//  Created by Elias Wald on 6/10/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import "Periscope_v1ViewController.h"

@implementation Periscope_v1ViewController
@synthesize map, mainImage, description, thumbnails, settingsViewController;

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

#pragma mark - View lifecycle

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

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
- (IBAction)settingsButtonPressed:(id)sender
{
    if(settingsViewController == nil) {
        SettingsViewController *settingsView = [[SettingsViewController alloc] initWithNibName:@"SettingsView" bundle:nil];
        self.settingsViewController = settingsView;
        [settingsView release];
    }
    
    if(settingsViewController.view.superview == nil) {
        [self.view insertSubview:settingsViewController.view atIndex:8];
    }
    else{
        [settingsViewController.view removeFromSuperview];
    }
}

- (IBAction)friendsButtonPressed:(id)sender
{
    
}

- (IBAction)locateMeButtonPressed:(id)sender
{
    
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
    
}

- (IBAction)wantToGoButtonPressed:(id)sender
{
    
}

@end
