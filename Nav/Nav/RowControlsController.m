//
//  RowControlsController.m
//  Nav
//
//  Created by Elias Wald on 6/8/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import "RowControlsController.h"
#import "SecondLevelViewController.h"

@implementation RowControlsController
@synthesize list;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [list release];
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
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    NSArray *array = [[NSArray alloc] initWithObjects:@"R2-D2", @"C3PO", @"Tik-Tok", @"Robby", @"Rosie", @"Uniblab", @"Bender", nil];
    self.list = array;
    [array release];
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

#pragma mark -
#pragma mark Table Datasource Methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [list count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *RowCellIdentifier = @"RowCellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:RowCellIdentifier];
    if (cell == nil){
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:RowCellIdentifier] autorelease];
        UISwitch *switchView = [[UISwitch alloc] init];
        switchView.tag = kSwitchTag;
        cell.accessoryView = switchView;
        [switchView release];
    }
    
    NSUInteger row = [indexPath row];
    
    cell.textLabel.text = [list objectAtIndex:row];
    return cell;
}

#pragma mark -
#pragma mark Table Delegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row = [indexPath row];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    UISwitch *switchView = (UISwitch *)[cell viewWithTag:kSwitchTag];
    
    NSString *baseString = @"%@ %@.";
    NSString *onString = (switchView.on) ? @"IS on" : @"IS NOT on";
    NSString *robot = [list objectAtIndex:row];
    NSString *messageString = [[NSString alloc] initWithFormat:baseString, robot, onString];
    NSString *title = [[NSString alloc] initWithFormat:@"You clicked row %d.", row+1];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:messageString delegate:nil cancelButtonTitle:@"Done" otherButtonTitles: nil];
    
    [alert show];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [alert release];
    [title release];
    [messageString release];
}

@end
