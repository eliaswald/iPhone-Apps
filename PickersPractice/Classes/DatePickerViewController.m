    //
//  DatePickerViewController.m
//  PickersPractice
//
//  Created by Elias Wald on 6/3/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import "DatePickerViewController.h"


@implementation DatePickerViewController
@synthesize datePicker;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    NSDate *now = [[NSDate alloc] init];
    [datePicker setDate:now animated:YES];
    [now release];
    [super viewDidLoad];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

-(IBAction)buttonPressed:(id)sender
{
    NSDate *selected = [datePicker date];
    NSString *message = [[NSString alloc] initWithFormat:@"The date and time you selected is: %@", selected];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Date and Time Selected" message:message delegate:nil cancelButtonTitle:@"Done" otherButtonTitles:nil];
    [alert show];
    [alert release];
    [message release];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [datePicker release];
    [super dealloc];
}


@end
