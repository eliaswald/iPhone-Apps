    //
//  DependentComponentPickerViewController.m
//  PickersPractice
//
//  Created by Elias Wald on 6/3/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import "DependentComponentPickerViewController.h"


@implementation DependentComponentPickerViewController
@synthesize picker, stateZips, states, curZips;

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
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"statedictionary" ofType:@"plist"];
    
    NSDictionary *dictionary = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    self.stateZips = dictionary;
    [dictionary release];
    
    NSArray *components = [self.stateZips allKeys];
    NSArray *sorted = [components sortedArrayUsingSelector:@selector(compare:)];
    self.states = sorted;
    
    NSString *selectedState = [self.states objectAtIndex:0];
    NSArray *array = [stateZips objectForKey:selectedState];
    self.curZips = array;
    
    [super viewDidLoad];
}

- (IBAction)buttonPressed
{
    NSInteger stateRow = [picker selectedRowInComponent:kStateComponent];
    NSInteger zipRow = [picker selectedRowInComponent:kZipComponent];
    
    NSString *state = [self.states objectAtIndex:stateRow];
    NSString *zip = [self.curZips objectAtIndex:zipRow];
    
    NSString *title = [[NSString alloc] initWithFormat:@"You selected zip code: %@", zip];
    NSString *message = [[NSString alloc] initWithFormat:@"%@ is in %@", zip, state];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"Done" otherButtonTitles: nil];
    
    [alert show];
    [alert release];
    [title release];
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
    [picker release];
    [stateZips release];
    [states release];
    [curZips release];
    [super dealloc];
}

#pragma mark -
#pragma mark Picker Datasource Methods

- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == kStateComponent) {
        return [self.states count];
    }
    
    return [self.curZips count];
}

#pragma mark Picker Delegate Methods
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == kStateComponent) {
        return [self.states objectAtIndex:row];
    }
    return [self.curZips objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == kStateComponent){
        NSString *selectedState = [self.states objectAtIndex:row];
        NSArray *array = [stateZips objectForKey:selectedState];
        self.curZips = array;
        [picker selectRow:0 inComponent:kZipComponent animated:YES];
        [picker reloadComponent:kZipComponent];
    }
}

-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    if (component == kZipComponent)
        return 90;
    return 200;
}


@end
