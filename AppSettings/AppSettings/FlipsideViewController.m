//
//  FlipsideViewController.m
//  AppSettings
//
//  Created by Elias Wald on 6/9/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import "FlipsideViewController.h"


@implementation FlipsideViewController
@synthesize engineSwitch, warpFactorSlider;

@synthesize delegate=_delegate;

- (void)dealloc
{
    [engineSwitch release];
    [warpFactorSlider release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    engineSwitch.on = ([[defaults objectForKey:@"warp"] isEqualToString:@"Engaged"]) ? YES : NO;
    warpFactorSlider.value = [defaults floatForKey:@"warpfactor"];
    [super viewDidLoad];
}

- (void)viewWillDisappear:(BOOL)animated
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *prefValue = (engineSwitch.on) ? @"Engaged" : @"Disabled";
    [defaults setObject:prefValue forKey:@"warp"];
    [defaults setFloat:warpFactorSlider.value forKey:@"warpfactor"];
    [super viewWillDisappear:animated];
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

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}

@end
