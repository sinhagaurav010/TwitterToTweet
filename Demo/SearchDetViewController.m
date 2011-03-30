//
//  SearchDetViewController.m
//  RetailStore
//
//  Created by gaurav sinha on 03/01/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SearchDetViewController.h"
#import  "Global.h"
#import  "DetailSrrchViewController.h"
@implementation SearchDetViewController

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


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
-(void)viewDidLoad 
{
	if([arry_search  count]==0)
	{
		UIAlertView  *alert  =  [[UIAlertView  alloc]initWithTitle:@"Info" message:@"No item searched" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	    [alert  show];
	    [alert  release];
	}
    [super viewDidLoad];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	//if(section != 0)
	return [arry_search count];
	//else
	//	return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView              // Default is 1 if not implemented
{
	return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
	//if(indexPath.row!=0)
	/*if(indexPath.section == 0)
	 return 30;
	 else {*/
	return 70;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *CellIdentifier = @"Cell";
	UITableViewCell *cell;// = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	//if (cell == nil) {
	cell				= [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:nil] autorelease];
	
	UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(cell.frame.origin.x+12, cell.frame.origin.y-30, 120, 100)];
	CGRect frm = cell.frame;
    UIImageView *viewtable = [[UIImageView alloc]initWithFrame:CGRectMake(frm.origin.x, frm.origin.y+0,frm.size.width,frm.size.height+30)];//<#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)];
	viewtable.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cellcolor.png"]];
	[cell addSubview:viewtable];
	label = [[UILabel alloc]initWithFrame:CGRectMake(cell.frame.origin.x+10, cell.frame.origin.y-30,120, 100)];
	
	label.text = [[arry_search objectAtIndex:indexPath.row ] objectForKey:@"title"];
	label.font = [UIFont systemFontOfSize:10];
	
	label.backgroundColor = [UIColor clearColor];
	//cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cellcolor.png"]];
	
	//textSize = [title sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:limitSize lineBreakMode:UILineBreakModeWordWrap];
	label.textAlignment = UITextAlignmentLeft;
	label.lineBreakMode = UILineBreakModeWordWrap;
	label.numberOfLines = 2;
	[cell addSubview:label];
	
	cell.accessoryType  =  2;
  	
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSLog(@"hihihihihih");

	_which_cell   = indexPath.row;
	DetailSrrchViewController   *obj   =  [DetailSrrchViewController   new];
	[self.navigationController  pushViewController:obj animated:YES];
}
/*
 _which_cell
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
    [super dealloc];
}


@end
