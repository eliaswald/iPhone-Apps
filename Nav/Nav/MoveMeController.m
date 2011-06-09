//
//  MoveMeController.m
//  Nav
//
//  Created by Elias Wald on 6/9/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import "MoveMeController.h"


@implementation MoveMeController
@synthesize list;

#pragma mark - Action Methods

- (IBAction)toggleMove
{
    [self.tableView setEditing:!self.tableView.editing animated:YES];
}

#pragma mark - Initialization and Deallocation

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
    NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:@"Eeny", @"Meeny", @"Miney", @"Moe", @"Catch", @"A", @"Tiger", @"By", @"The", @"Toe", nil];
    self.list = array;
    [array release];
    
    UIBarButtonItem *moveButton = [[UIBarButtonItem alloc] initWithTitle:@"Move" style:UIBarButtonItemStyleBordered target:self action:@selector(toggleMove)];
    self.navigationItem.rightBarButtonItem = moveButton;
    [moveButton release];
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

#pragma mark - Table Datasource Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [list count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MoveMeCellIdentifier = @"MoveMeCellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MoveMeCellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MoveMeCellIdentifier] autorelease];
        cell.showsReorderControl = YES;
    }
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [list objectAtIndex:row];
    return cell;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleNone;
}
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    NSUInteger fromRow = [sourceIndexPath row];
    NSUInteger toRow = [destinationIndexPath row];
    
    id object = [[list objectAtIndex:fromRow] retain];
    [list removeObjectAtIndex:fromRow];
    [list insertObject:object atIndex:toRow];
    [object release];
}

@end
