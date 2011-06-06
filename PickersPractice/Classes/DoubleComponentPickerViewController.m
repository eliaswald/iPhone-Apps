    //
//  DoubleComponentPickerViewController.m
//  PickersPractice
//
//  Created by Elias Wald on 6/3/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import "DoubleComponentPickerViewController.h"


@implementation DoubleComponentPickerViewController
@synthesize doublePicker, fillingTypes, breadTypes;

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
    NSArray *breadArray = [[NSArray alloc] initWithObjects:@"White", @"Whole", @"Rye", @"Sourdough", nil];
    self.breadTypes = breadArray;
    [breadArray release];
    
    NSArray *fillerArray = [[NSArray alloc] initWithObjects:@"Ham", @"PB", @"Turkey", @"Lettuce", nil];
    self.fillingTypes = fillerArray;
    [fillerArray release];
    [super viewDidLoad];
}

- (IBAction)buttonPressed
{
    NSInteger breadRow = [doublePicker selectedRowInComponent:kBreadComponent];
    NSInteger fillerRow = [doublePicker selectedRowInComponent:kFillingComponent];
    
    NSString *bread = [breadTypes objectAtIndex:breadRow];
    NSString *filler = [fillingTypes objectAtIndex:fillerRow];
    
    NSString *message = [[NSString alloc] initWithFormat:@"Your %@ on %@ bread will be right up.", filler, bread];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Thanks for ordering." message:message delegate:nil cancelButtonTitle:@"Done" otherButtonTitles: nil];
    [alert show];
    [alert release];
    [message release];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

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
    [doublePicker release];
    [breadTypes release];
    [fillingTypes release];
    [super dealloc];
}

#pragma mark -
#pragma mark Picker Datasource Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == kBreadComponent) {
        return [self.breadTypes count];
    }
    else {
        return [self.fillingTypes count];
    }
}
#pragma mark Picker Delegate Methods
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == kBreadComponent) {
        return [self.breadTypes objectAtIndex:row];
    }
    return [self.fillingTypes objectAtIndex:row];
}

@end
