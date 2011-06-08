//
//  SectionsViewController.m
//  Sections
//
//  Created by Elias Wald on 6/7/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import "SectionsViewController.h"
#import "NSDictionary-MutableDeepCopy.h"

@implementation SectionsViewController
@synthesize keys, names, allNames, table, search;

#pragma mark -
#pragma mark Custom Methods
-(void)resetSearch
{
    self.names = [self.allNames mutableDeepCopy];
    NSMutableArray *keyArray = [[NSMutableArray alloc] init];
    [keyArray addObjectsFromArray:[[self.allNames allKeys] sortedArrayUsingSelector:@selector(compare:)]];
    self.keys = keyArray;
    [keyArray release];
}
- (void)handleSearchForTerm:(NSString *)searchTerm
{
    NSMutableArray *sectionsToRemove = [[NSMutableArray alloc] init];
    [self resetSearch];
    
    for (NSString *key in self.keys){
        NSMutableArray *array = [names valueForKey:key];
        NSMutableArray *toRemove = [[NSMutableArray alloc] init];
        for (NSString *name in array){
            if ([name rangeOfString:searchTerm options:NSCaseInsensitiveSearch].location == NSNotFound) {
                [toRemove addObject:name];
            }
        }
        
        if ([array count] == [toRemove count]) {
            [sectionsToRemove addObject:key];
        }
        
        [array removeObjectsInArray:toRemove];
        [toRemove release];
    }
    
    [self.keys removeObjectsInArray:sectionsToRemove];
    [sectionsToRemove release];
    [table reloadData];
}

#pragma mark -
#pragma mark UIViewControllerMethods

- (void)dealloc
{
    [allNames release];
    [table release];
    [search release];
    [names release];
    [keys release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"sortedNames" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    self.allNames = dict;
    [dict release];
    
    [self resetSearch];
    search.autocapitalizationType = UITextAutocapitalizationTypeNone;
    search.autocorrectionType = UITextAutocorrectionTypeNo;
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
#pragma mark TableView Datasource Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return ([keys count] > 0) ? [keys count] : 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([keys count] == 0)
        return 1;
    NSString *key = [keys objectAtIndex:section];
    NSArray *nameSection = [names objectForKey:key];
    return [nameSection count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([keys count] > 0) {
        NSUInteger section = [indexPath section];
        NSUInteger row = [indexPath row];
        
        NSString *key = [keys objectAtIndex:section];
        NSArray *nameSection = [names objectForKey:key];
        
        static NSString *SectionsTableIdentifier = @"SectionsTableIdentifier";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SectionsTableIdentifier];
        if(cell == nil){
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SectionsTableIdentifier] autorelease];
        }
        
        cell.textLabel.text = [nameSection objectAtIndex:row];
        return cell;
    }
    else
        return [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil] autorelease];
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if ([keys count] ==0)
        return @"";
    NSString *key = [keys objectAtIndex:section];
    return key;
}


- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return keys;
}

#pragma mark -
#pragma mark Tableview Delegate Methods

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [search resignFirstResponder];
    return indexPath;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [search resignFirstResponder];
}


#pragma mark -
#pragma mark Search Bar Delegate Methods
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSString *searchTerm = [searchBar text];
    [self handleSearchForTerm:searchTerm];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if ([searchText length] == 0){
        [self resetSearch];
        [table reloadData];
        return;
    }
    [self handleSearchForTerm:searchText];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    search.text = @"";
    [self resetSearch];
    [table reloadData];
    [searchBar resignFirstResponder];
}

@end
