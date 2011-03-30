//
//  NumberOfitemViewController.m
//  DemoProject
//
//  Created by CHROME INFOTECH  on 12/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "NumberOfitemViewController.h"
#import "Global.h"
#import "SubDiscriptionViewController.h"

@implementation NumberOfitemViewController

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	////////////////////////////////////////
	//to customize the back bar button
	
	self.navigationItem.title				=	@"Gevonden stoffen";
	UIBarButtonItem *backButton				= [[UIBarButtonItem alloc] initWithTitle:@"Terug" style:UIBarButtonItemStylePlain target:nil action:nil];
	self.navigationItem.backBarButtonItem	= backButton;
	[self navigationController].navigationBar.tintColor = [UIColor blackColor];/////////////make the navigation back bar color black
	[backButton release];
	
	listOfItems								= [NSMutableArray new];
	listOfItems								=frsamedata;
	
	
	
    
	[super viewDidLoad];
}

////////////////////////////
/////table to show  same data 


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	
	return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	return [listOfItems count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	//static NSString *CellIdentifier = @"Cell";
	UITableViewCell *cell;// = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	//if (cell == nil) {
	cell									= [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:nil] autorelease];
	// Set up the cell...
	[cell.textLabel setFont:[UIFont boldSystemFontOfSize:13.0]];
	NSString *cellvalue	=	[NSString new];
	

	cellvalue = [listOfItems objectAtIndex:indexPath.row];
	cell.textLabel.text = [NSString stringWithFormat:@"%@",cellvalue];
	return cell;
}
///////////////////////////////////
//
//dealloc method declared in RootViewController.m

/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	searchdt									=	[datafrgevi objectAtIndex:indexPath.row];
	stofdata									=	[frsamedata objectAtIndex:indexPath.row];
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////////
	////////after getting the data for search viewContrller will go to SubdiscriptionView Controller
	
	SubDiscriptionViewController *dvController  = [[SubDiscriptionViewController alloc] init];//WithNibName:@"DetailView" bundle:[NSBundle mainBundle]];
	[self.navigationController pushViewController:dvController animated:YES];
	[dvController release];
	dvController								= nil;
}

- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath {
	
	//return UITableViewCellAccessoryDetailDisclosureButton;
	return UITableViewCellAccessoryDisclosureIndicator;
}



//RootViewController.m
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
	
	[self tableView:tableView didSelectRowAtIndexPath:indexPath];
	
}

//////////////////////////////////////////////////
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/
////////////////////////////////////////////////////////


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	[myTable release];
	
	[listOfItems release];
	
    [super viewDidUnload];
	
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
