//
//  DetailSrrchViewController.m
//  RetailStore
//
//  Created by gaurav sinha on 03/01/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailSrrchViewController.h"
#import "Global.h"
#import "BuyViewController.h"

@implementation DetailSrrchViewController

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
- (void)viewDidLoad 
{
	NSLog(@"_which_cell%i",_which_cell);
	if(_which_cell  == 0)
	string_Url =  [[[arrayforBuy objectAtIndex:_which_cell]objectAtIndex:4] objectForKey:@"href"];
	
	else {
		string_Url =  [[[arrayforBuy objectAtIndex:_which_cell]objectAtIndex:0] objectForKey:@"href"];
	}

	NSLog(@"string_Url");
	des.text   = [[arry_search objectAtIndex:_which_cell ] objectForKey:@"content"];
     /*
	 g:image_link
	 title
	 g:expiration_date
	 content
	 */
	
	price_label.text  =  [[arry_search objectAtIndex:_which_cell ] objectForKey:@"g:price"];
	lab_title.text   =  [[arry_search objectAtIndex:_which_cell ] objectForKey:@"title"];

	
	/*NSURL *url = [NSURL URLWithString: [[arry_search objectAtIndex:_which_cell] objectForKey:@"g:image_link"]];
	NSData *data = [NSData dataWithContentsOfURL:url];
	
	if (data==nil) 
	{
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Connection Error!" message:@"Unable to retrieve image." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
		[alert show];
	} 
	else 
	{
		image_vi.image = [[UIImage alloc] initWithData:data cache:NO];
	}*/
	
	NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: [[arry_search objectAtIndex:_which_cell] objectForKey:@"g:image_link"]]];
	image_vi.image = [UIImage imageWithData: imageData];
	[imageData release];
	
	
	//image_vi
    [super viewDidLoad];
}

-(IBAction)pressToBuy:(id)sender
{
	BuyViewController  *obj  =  [BuyViewController   new];
	[self.navigationController  pushViewController:obj animated:YES];
	if(obj)
	{
		[obj  release];
		obj  = nil;
	}
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
    [super dealloc];
}


@end
