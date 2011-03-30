    //
//  FourthViewController.m
//  Free RX iCard
//
//  Created by J Brian Oliver on 12/14/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "FourthViewController.h"


@implementation FourthViewController

-(IBAction)sendMail {
	
	MFMailComposeViewController *mailComposer = [[[MFMailComposeViewController alloc] init] autorelease] ;
	mailComposer.mailComposeDelegate = self;
	
	if ([MFMailComposeViewController canSendMail]) {
		
		[mailComposer setToRecipients:nil];
		[mailComposer setSubject:@"Check out this Free Discount Prescription Card app!"];
		[mailComposer setMessageBody:@"Check out FREE RX iCard in the AppStore. This app can start saving you money on your prescription drugs immediately!" isHTML:NO];
		
		[self presentModalViewController:mailComposer animated:YES];
		
	}
	
	
}


- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
	[self becomeFirstResponder];
	[self dismissModalViewControllerAnimated:YES];
}

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

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
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
