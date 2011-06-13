//
//  SettingsViewController.m
//  Periscope-v1
//
//  Created by Elias Wald on 6/13/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import "SettingsViewController.h"
#import "Periscope_v1ViewController.h"


@implementation SettingsViewController
@synthesize signUpTable, signInTable, saveButton, cancelButton, signUpLabels, textFieldBeingEdited, navigationBar, signInLabels;

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
    [signUpLabels release];
    [textFieldBeingEdited release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - Sign-in Button Methods
- (IBAction)signIn
{
    [self.view insertSubview:signInTable aboveSubview:signUpTable];
    [textFieldBeingEdited resignFirstResponder];
    textFieldBeingEdited = nil;
    Periscope_v1ViewController *parentController = (Periscope_v1ViewController *)self.parentViewController;
    navigationBar.frame = CGRectMake(0, 210, 624, 44);
    signUpTable.hidden = YES;
    [parentController resizeSettingsOnSignIn];
}
- (IBAction)signUp
{
    signUpTable.hidden = NO;
    navigationBar.frame = CGRectMake(0, 298, 624, 44);
    [self.view insertSubview:signUpTable aboveSubview:signInTable];
    [textFieldBeingEdited resignFirstResponder];
    Periscope_v1ViewController *parentController = (Periscope_v1ViewController *)self.parentViewController;
    [parentController resizeSettingsOnSignUp];
}

#pragma mark - Navigation Bar Button Methods
- (IBAction)cancel
{
    
}

- (IBAction)save
{
    
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
    
    NSArray *arraySignIn = [[NSArray alloc] initWithObjects:@"Email:", @"Password:", nil];
    self.signInLabels = arraySignIn;
    [arraySignIn release];
    
    NSArray *array = [[NSArray alloc] initWithObjects:@"First Name:", @"Last Name:", @"Email:", @"Password:", nil];
    self.signUpLabels = array;
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
	return YES;
}

#pragma mark - Table Datasource Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView == signInTable)
        return 2;
    else
        return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //If the table requesting cell is the sign-up table:
    if(tableView == signUpTable){
        static NSString *SettingsCellIdentifier = @"SettingsCellIdentifier";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SettingsCellIdentifier];
        if (cell == nil) {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SettingsCellIdentifier] autorelease];
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 90, 25)];
            label.textAlignment = UITextAlignmentRight;
            label.tag = 4096;
            label.font = [UIFont boldSystemFontOfSize:14];
            [cell.contentView addSubview:label];
            [label release];
            
            UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(105, 12, 200, 25)];
            textField.clearsOnBeginEditing = NO;
            [textField setDelegate:self];
            textField.returnKeyType = UIReturnKeyDone;
            [textField addTarget:self action:@selector(textFieldDidEndEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
            [cell.contentView addSubview:textField];
        }
        NSUInteger row = [indexPath row];
        
        UILabel *label = (UILabel *)[cell viewWithTag:4096];
        UITextField *textField = nil;
        for (UIView *oneView in cell.contentView.subviews) {
            if ([oneView isMemberOfClass:[UITextField class]])
                textField = (UITextField *)oneView;
        }
        label.text = [signUpLabels objectAtIndex:row];
        label.textColor = [UIColor grayColor];
        if (label.text == @"Password:")
            textField.secureTextEntry = YES;
        
        NSNumber *rowAsNum = [[NSNumber alloc] initWithInt:row];
#warning implement filling in default row values
        switch (row) {
            case 0:
                break;
            case 1:
                break;
            case 2:
                break;
            case 3:
                break;
            default:
                break;
        }
        
        if (textFieldBeingEdited == textField)
            textFieldBeingEdited = nil;
        
        textField.tag = row;
        [rowAsNum release];
        return cell;
    }
    
    //If the table requesting cells is the sign-in table:
    else {
        static NSString *SignInCellIdentifier = @"SignInCellIdentifier";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SignInCellIdentifier];
        if (cell == nil) {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SignInCellIdentifier] autorelease];
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 90, 25)];
            label.textAlignment = UITextAlignmentRight;
            label.tag = 4096;
            label.font = [UIFont boldSystemFontOfSize:14];
            [cell.contentView addSubview:label];
            [label release];
            
            UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(105, 12, 200, 25)];
            textField.clearsOnBeginEditing = NO;
            [textField setDelegate:self];
            textField.returnKeyType = UIReturnKeyDone;
            [textField addTarget:self action:@selector(textFieldDidEndEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
            [cell.contentView addSubview:textField];
        }
        NSUInteger row = [indexPath row];
        
        UILabel *label = (UILabel *)[cell viewWithTag:4096];
        UITextField *textField = nil;
        for (UIView *oneView in cell.contentView.subviews) {
            if ([oneView isMemberOfClass:[UITextField class]])
                textField = (UITextField *)oneView;
        }
        label.text = [signInLabels objectAtIndex:row];
        label.textColor = [UIColor grayColor];
        if (label.text == @"Password:")
            textField.secureTextEntry = YES;
        
        NSNumber *rowAsNum = [[NSNumber alloc] initWithInt:row];
#warning implement filling in default row values
        switch (row) {
            case 0:
                break;
            case 1:
                break;
            default:
                break;
        }
        
        if (textFieldBeingEdited == textField)
            textFieldBeingEdited = nil;
        
        textField.tag = row;
        [rowAsNum release];
        return cell;
    }
}
#pragma mark - Table Delegate Methods
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

#pragma mark - TextField Delegate Methods
- (void)textFieldDidEndEditing:(UITextField *)textField
{
#warning implement saving entered values
    [textField resignFirstResponder];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.textFieldBeingEdited = textField;
}

@end
