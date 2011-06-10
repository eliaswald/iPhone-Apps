//
//  MainViewController.m
//  AppSettings
//
//  Created by Elias Wald on 6/9/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController
@synthesize usernameLabel, passwordLabel, protocolLabel, warpDriveLabel, warpFactorLabel, favoriteSinLabel, favoriteTeaLabel, favoriteGameLabel, favoriteCandyLabel, favoriteExcuseLabel;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [self refreshFields];
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
    [self refreshFields];
    [super viewDidAppear:animated];
}


- (void) refreshFields
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    usernameLabel.text = [defaults objectForKey:@"username"];
    passwordLabel.text = [defaults objectForKey:@"password"];
    protocolLabel.text = [defaults objectForKey:@"protocol"];
    warpDriveLabel.text = [defaults objectForKey:@"warp"];
    warpFactorLabel.text = [[defaults objectForKey:@"warpfactor"] stringValue];
    favoriteTeaLabel.text = [defaults objectForKey:@"favoriteTea"];
    favoriteSinLabel.text = [defaults objectForKey:@"favoriteSin"];
    favoriteGameLabel.text = [defaults objectForKey:@"favoriteGame"];
    favoriteExcuseLabel.text = [defaults objectForKey:@"favoriteExcuse"];
    favoriteCandyLabel.text = [defaults objectForKey:@"favoriteCandy"];
}

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)showInfo:(id)sender
{    
    FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
    controller.delegate = self;
    
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:controller animated:YES];
    
    [controller release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc
{
    [usernameLabel release];
    [passwordLabel release];
    [protocolLabel release];
    [warpFactorLabel release];
    [warpDriveLabel release];
    [favoriteCandyLabel release];
    [favoriteExcuseLabel release];
    [favoriteGameLabel release];
    [favoriteSinLabel release];
    [favoriteTeaLabel release];
    [super dealloc];
}

@end
