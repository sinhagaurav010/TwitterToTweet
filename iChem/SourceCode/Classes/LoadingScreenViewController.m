//
//  LoadingScreenViewController.m
//  DemoProject
//
//  Created by CHROME INFOTECH  on 04/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "LoadingScreenViewController.h"
#import "ScreenShotViewController.h"
#import "SearchTableViewController.h"

@implementation LoadingScreenViewController

-(IBAction)myCodeToCallTheView:(id)sender
{
	ScreenShotViewController *obj	=	[ScreenShotViewController new];
	[self.navigationController pushViewController:obj animated:YES];
}	

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
	
	
	   [self.navigationController setNavigationBarHidden:YES];
		[activeindicator startAnimating];
		[self performSelector:@selector(myCodeToCallTheView:) withObject:nil afterDelay:2];
    	[super viewDidLoad];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[activeindicator release];
    [super dealloc];
}


@end
