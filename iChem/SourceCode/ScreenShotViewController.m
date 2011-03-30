//
//  ScreenShotViewController.m
//  DemoProject
//
//  Created by CHROME INFOTECH  on 03/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ScreenShotViewController.h"

@implementation UINavigationBar (UINavigationBarCategory)


//////////////////////////////////////
//////To set background of navigation bar




- (void)drawRect:(CGRect)rect {
	
	    UIImage *image = [UIImage imageNamed: @"top-background.png"];
		[image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
		[image release];
}

@end

/*#define NAVIGATION_BAR_COLOR [[UIColor alloc] initWithRed:0.40 green:0.42 blue:0.48 alpha:1.0]*/
@implementation ScreenShotViewController


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
- (void)viewDidLoad 
{   
	
		
	[self.navigationController.view addSubview:tabbarController.view];
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
    [super dealloc];
}


@end
