//
//  ViewController.m
//  CountryStateDemo
//
//  Created by Mohd Iftekhar Qurashi on 23/06/13.

#import "ViewController.h"
#import "IQCountryStateHandler.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [tableViewCountry setRowHeight:[UIScreen mainScreen].bounds.size.height/20.0];
    [tableViewStates setRowHeight:[UIScreen mainScreen].bounds.size.height/20.0];
    
    countriesList = [IQCountryStateHandler countries];
    if ([countriesList count])
    {
        statesForCurrentCountry = [IQCountryStateHandler statesForCountry:[countriesList objectAtIndex:0]];
        [tableViewCountry selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionNone];
    }
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (tableView == tableViewCountry)      return @"Country";
    else if (tableView == tableViewStates)  return @"State";
    else                                    return @"";
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == tableViewCountry)      return [countriesList count];
    else if(tableView == tableViewStates)   return [statesForCurrentCountry count];
    else                                    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    if (tableView == tableViewCountry)
    {
        static NSString *countryCell = @"CountryCell";
        cell = [tableView dequeueReusableCellWithIdentifier:countryCell];
        
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:countryCell];
            [cell.textLabel setFont:[UIFont boldSystemFontOfSize:tableView.rowHeight/2]];
        }
        
        [cell.textLabel setText:[countriesList objectAtIndex:indexPath.row]];
    }
    else if (tableView == tableViewStates)
    {
        static NSString *countryCell = @"StateCell";
        cell = [tableView dequeueReusableCellWithIdentifier:countryCell];
        
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:countryCell];
            [cell.textLabel setFont:[UIFont boldSystemFontOfSize:tableView.rowHeight/2]];
        }
        
        [cell.textLabel setText:[statesForCurrentCountry objectAtIndex:indexPath.row]];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == tableViewCountry)
    {
        statesForCurrentCountry = [IQCountryStateHandler statesForCountry:[countriesList objectAtIndex:indexPath.row]];
        [tableViewStates reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if(tableView == tableViewStates)
    {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

@end
