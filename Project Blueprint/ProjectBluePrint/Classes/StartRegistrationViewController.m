    //
//  StartRegistrationViewController.m
//  ProjectBluePrint
//
//  Created by gaurav sinha on 02/02/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "StartRegistrationViewController.h"
#import "Global.h"
#import "MBProgressHUD.h"

@implementation StartRegistrationViewController

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
    [super viewDidLoad];
}

- (void)myTask 
{
	NSURL *url = [NSURL  URLWithString:URLFOR];
	getDeviceSessionRequest = [ASIHTTPRequest requestWithURL:url];
	getDeviceSessionRequest.delegate = self;
	
	[getDeviceSessionRequest addRequestHeader:CONTENT value:APP];
	[getDeviceSessionRequest addRequestHeader:ACCEPT value:APP];
	NSString *postString = [NSString stringWithFormat:@"{\"email\":\"%@\",\"password\":\"%@\"}",textFieldUserName.text,textFieldPassword.text];
	if(LOG)
		NSLog(@"Poststring-----%@",postString);
	NSMutableData *postData = (NSMutableData *)[postString dataUsingEncoding:NSUTF8StringEncoding];
	[getDeviceSessionRequest setPostBody:postData];
	[getDeviceSessionRequest setDidFinishSelector:@selector(topSecretFetchComplete:)];
	[getDeviceSessionRequest setDidFailSelector:@selector(topSecretFetchFailed:)];
	
	////To start the activity indicator while loading
	spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
	[spinner setCenter:CGPointMake(kScreenWidthPortrait/2.0, kScreenHeightPortrait/2.0)]; // I do this because I'm in landscape mode
	[self.view addSubview:spinner]; // spinner is not visible until started
	[spinner startAnimating];
	[getDeviceSessionRequest startAsynchronous];
}

-(IBAction)PressToLogin:(id)sender
{
	if([textFieldUserName.text length]>0)
	{
		if([textFieldPassword.text length]>0)
		{
			/////////////////////
			[self myTask];
	
			////////////////////
		}
		else
		{
			[self alertView:@"Password"];
		}
	}
	else 
	{
		[self alertView:@"Username"];
	}
}

//////////Function to show if either user name or password or both is empty
-(void)alertView:(NSString*)string
{
	NSString *message = [NSString stringWithFormat:@"%@ field can'nt be empty",string];
	UIAlertView *alert  = [[UIAlertView alloc]initWithTitle:@"Info" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alert   show];
	[alert  release];
}
///////////////////////////////////////
//In the case request failed
- (IBAction)topSecretFetchFailed:(ASIHTTPRequest *)theRequest
{
	[spinner stopAnimating];
	if(LOG)
		NSLog(@"theRequest  ---%@",[theRequest responseString]);
	UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Info" message:@"Error Error" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alert  show];
	[alert  release];
}
///////////////////////////////////////

///////////////////////////////////////
//In the case of request complete 
- (IBAction)topSecretFetchComplete:(ASIHTTPRequest *)theRequest
{
	[spinner stopAnimating];
	if(LOG)
	NSLog(@"theRequest  ---%@",[theRequest responseString]);
	
	NSString  *stringSession = [SaveTheFieldController parseTheJSON:[theRequest responseString]];
	if(LOG)
		NSLog(@"theString---%@",stringSession);
	[SaveTheFieldController saveTheSessionId:stringSession];
	if(LOG)
		NSLog(@"SessionId ----%@",[SaveTheFieldController getTheSessionId]);
	
	/////To go to Signing list
	SigningListViewController *objSigningListViewController = [SigningListViewController new];
	[self.navigationController pushViewController:objSigningListViewController animated:YES];
	if(objSigningListViewController)
	{
		[objSigningListViewController release];
		objSigningListViewController = nil;
	}
}
///////////////////////////////////////

/*- (void)requestFinished:(ASIHTTPRequest *)request {
	NSLog(@"-----%@", [request responseString]);
	
}*/

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
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
