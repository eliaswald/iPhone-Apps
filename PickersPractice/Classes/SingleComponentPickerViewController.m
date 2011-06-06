    //
//  SingleComponentPickerViewController.m
//  PickersPractice
//
//  Created by Elias Wald on 6/3/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import "SingleComponentPickerViewController.h"


@implementation SingleComponentPickerViewController
@synthesize singlePicker, pickerData;

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
    NSArray *array = [[NSArray alloc] initWithObjects:@"Luke",@"Leia",@"Han",@"Chewbacca", nil];
    self.pickerData = array;
    [array release];
    [super viewDidLoad];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (IBAction)buttonPressed
{
    NSInteger row = [singlePicker selectedRowInComponent:0];
    NSString *selected = [pickerData objectAtIndex:row];
    NSString *title = [[NSString alloc] initWithFormat:@"You selected %@!", selected];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:@"Thanks for choosing" delegate:nil cancelButtonTitle:@"Done" otherButtonTitles: nil];
    [alert show];
    [alert release];
    [title release];
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
    [singlePicker release];
    [pickerData release];
    [super dealloc];
}
#pragma mark -
#pragma mark Picker Data Source Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [pickerData count];
}
#pragma mark Picker Delegate Method
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [pickerData objectAtIndex:row];
}

@end
