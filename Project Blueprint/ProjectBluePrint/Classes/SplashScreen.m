    //
//  SplashScreen.m
//  ProjectBluePrint
//
//  Created by gaurav sinha on 28/01/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SplashScreen.h"
#import "LoginViewController.h"
#import "SaveTheFieldController.h"
#import "StartRegistrationViewController.h"
@implementation SplashScreen

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
-(IBAction)theActionMethod:(id)sender
{ 
    if([SaveTheFieldController CheckingTheExistenceOfKey])
	{
	LoginViewController   *ObjLoginViewController = [LoginViewController new];
	[self.navigationController pushViewController:ObjLoginViewController animated:YES];
	if(ObjLoginViewController)
	{
		[ObjLoginViewController release];
		ObjLoginViewController = nil;
	}
	}
	else 
	{
		StartRegistrationViewController  *ObjStartRegistrationViewController = [StartRegistrationViewController new];
		[self.navigationController pushViewController:ObjStartRegistrationViewController animated:YES];
		if(ObjStartRegistrationViewController)
		{
			[ObjStartRegistrationViewController release];
			ObjStartRegistrationViewController = nil;
		}
		
	}

}
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	[self.navigationController setNavigationBarHidden:YES];
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(theActionMethod:) userInfo:nil repeats:NO];

	[super viewDidLoad];
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return YES;
}


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
