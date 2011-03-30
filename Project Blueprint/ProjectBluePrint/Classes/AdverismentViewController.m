    //
//  AdverismentViewController.m
//  ProjectBluePrint
//
//  Created by gaurav sinha on 07/02/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AdverismentViewController.h"


@implementation AdverismentViewController

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
	share = [SharedInstance sharedInstance];
	NSString *stringurl =  [NSString stringWithFormat:@"https://bss_device:bss_password@bluepoint-staging.heroku.com/users/%@/signs/%d/message",[SaveTheFieldController getTheSessionId],[share getFieldValueAtPos:0]];
	webView.delegate = self;
	[self ASIHttpCall:stringurl:nil];
	[super viewDidLoad];
}

-(void)ASIHttpCall:(NSString*)stringurl:(NSMutableData*)postData
{
	NSURL *url = [NSURL  URLWithString:stringurl];
	getDeviceSessionRequest = [ASIHTTPRequest requestWithURL:url];
	getDeviceSessionRequest.delegate = self;
	[getDeviceSessionRequest addRequestHeader:CONTENT value:APP];
	[getDeviceSessionRequest addRequestHeader:ACCEPT value:APP];
	
	if(postData!=nil)
	{
		[getDeviceSessionRequest setRequestMethod:@"PUT"];
		[getDeviceSessionRequest setPostBody:postData];
	}
	[getDeviceSessionRequest setDidFinishSelector:@selector(topSecretFetchComplete:)];
	[getDeviceSessionRequest setDidFailSelector:@selector(topSecretFetchFailed:)];
	/////Start the activity indicator
	spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
	[spinner setCenter:CGPointMake(kScreenWidthPortrait/2.0, kScreenHeightPortrait/2.0)]; // I do this because I'm in landscape mode
	[self.view addSubview:spinner]; // spinner is not visible until started
	[spinner startAnimating];
	
	[getDeviceSessionRequest startAsynchronous];
}

////////////landing_page
-(void)webViewLoad
{
	NSMutableDictionary  *dictionaryParse = [NSMutableDictionary new];
	dictionaryParse = [SaveTheFieldController parseTheJSN:stringUrlWeb];
    [webView loadRequest:[SaveTheFieldController ReturnNSURL:[dictionaryParse objectForKey:@"landing_page"]]];
}
/////When webView start load activity indicator start animating
-(void)webViewstartloading:(BOOL)mode
{
	spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
	if(mode == 1)
		[spinner setCenter:CGPointMake(kScreenWidthPortrait/2.0, kScreenHeightPortrait/2.0)];
	else 
		[spinner setCenter:CGPointMake(kScreenWidthLandscape/2.0, kScreenHeightLandscape/2.0)]; 
	
	[self.view addSubview:spinner]; // spinner is not visible until started
	[spinner startAnimating];
}
//////////////////////

////Set the mode(landscape=0 or portrait=1) according to field
-(void)SetMode:(BOOL)mode
{
	if(mode == 1)
		[[UIDevice currentDevice]setOrientation:UIInterfaceOrientationPortrait];
	else 
		[[UIDevice currentDevice]setOrientation:UIInterfaceOrientationLandscapeLeft];
	
}
/*{"landing_page":"http://darthsid.com/blog","touchscreen_enabled":true,"orientation":"portrait","active_mode":"remote","trusted_urls_array":[]}*/
///////////////////////////////////////
//In the case of request complete 
- (IBAction)topSecretFetchComplete:(ASIHTTPRequest *)theRequest
{
	[spinner stopAnimating];
	stringUrlWeb = [theRequest responseString];
	
	NSMutableDictionary  *dictionaryParse = [NSMutableDictionary new];
	dictionaryParse = [SaveTheFieldController parseTheJSN:stringUrlWeb];
	
	//////////If the userenable fied is true than user will be enabled
	if([[dictionaryParse objectForKey:@"touchscreen_enabled"] boolValue]==1)
		webView.userInteractionEnabled = YES;
	else 
		webView.userInteractionEnabled  = NO;
	
    	
    ///////To check whether mode will be landscape or portrait
	
	if([[dictionaryParse objectForKey:@"orientation"] isEqualToString:@"portrait"])
	{
		modeForWeb = 1;
	}
	else 
	{
		modeForWeb = 0;
	}
	[self SetMode:modeForWeb];
	
	[webView loadRequest:[SaveTheFieldController ReturnNSURL:[dictionaryParse objectForKey:@"landing_page"]]];
	
    [self webViewstartloading:modeForWeb];
}
//////////CGSize returns accoding to the mode
-(CGSize)sizeAccordingToMode
{
	if(modeForWeb == 1)
		return CGSizeMake(kScreenWidthPortrait, kScreenHeightPortrait);
	else 
		return CGSizeMake(kScreenWidthLandscape, kScreenHeightLandscape);
}
////////When the webview will load
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
	[spinner stopAnimating];
	
	/*UIGraphicsBeginImageContext(CGSizeMake(320, 376) );
	[self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
	UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();*/
	//iPad_BLG_Vision_0001.mp4
	
	UIImageWriteToSavedPhotosAlbum([AdverismentViewController captureView:self.view inSize:[self sizeAccordingToMode]], self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}
////////////////////////////////////
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
	UIAlertView *alert;
	if (error)
		alert = [[UIAlertView alloc] initWithTitle:@"Error" 
										   message:@"Unable to save image to Photo Album." 
										  delegate:self cancelButtonTitle:@"Ok" 
								 otherButtonTitles:nil];
	else // All is well
		alert = [[UIAlertView alloc] initWithTitle:@"Success" 
										   message:@"Image saved to Photo Album." 
										  delegate:self cancelButtonTitle:@"Ok" 
								 otherButtonTitles:nil];
	[alert show];
	
	if(alert)
	{
		[alert release];
		alert = nil;
	}
}
/////////////////////////////////////
+ (UIImage *)captureView: (UIView *)view inSize: (CGSize)size
{
    UIGraphicsBeginImageContext(size);
    CGSize viewSize = view.frame.size;
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextScaleCTM( context, size.width/viewSize.width, size.height/viewSize.height);
	
    [view.layer renderInContext: UIGraphicsGetCurrentContext()];
	
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return viewImage;
}

///////////////////
- (void)hudWasHidden:(MBProgressHUD *)hud {
	if(LOG)
	{
	NSLog(@"------");
	NSLog(@"Hud: %@", hud);
    }
	// Remove HUD from screen when the HUD was hidded
    [HUD removeFromSuperview];
    [HUD release];
}

//////////////////////////////////////////////In the case request failed
- (IBAction)topSecretFetchFailed:(ASIHTTPRequest *)theRequest
{
	[spinner stopAnimating];
	UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Info" message:@"Error Error in regisration!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alert  show];
	[alert  release];
}

////////////////////

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
