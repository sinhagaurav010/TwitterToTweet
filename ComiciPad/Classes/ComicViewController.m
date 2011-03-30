    //
//  ComicViewController.m
//  ComiciPad
//
//  Created by CHROME INFOTECH  on 06/09/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ComicViewController.h"
#import "ComicissueViewController.h"
#import "VideoViewController.h"
#import "MoreViewController.h"
@implementation ComicViewController

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

- (void)viewWillAppear:(BOOL)animated    // Called when the view is about to made visible. Default does nothing
{
	[[UIDevice currentDevice] setOrientation:UIInterfaceOrientationPortrait];
	//[ [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight]
}
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{
	
		[self.navigationController setNavigationBarHidden:YES];
	/*CGRect frameOfbackGroundimage			=   CGRectMake(0, 0, 768, 1024);
	UIImageView *backGroundimage			=	[[UIImageView alloc] initWithFrame:frameOfbackGroundimage];
	backGroundimage.image                   =  [UIImage imageNamed:@"mainscreen.png"];
	backGroundimage.backgroundColor			=	[UIColor blackColor];
    [self.view addSubview:backGroundimage];
	*/
	
	[super viewDidLoad];
}

///////////////////////////////////////////////
//On pressing the comic button
////////////////////////////////////////////
-(IBAction)Presscomicbutton:(id)argName
{
	
	ComicissueViewController  *comicissueViewControllerobj	=	[ComicissueViewController new];
	[self.navigationController pushViewController:comicissueViewControllerobj animated:YES];
	if(comicissueViewControllerobj!=nil)
	{
		[comicissueViewControllerobj release];
		comicissueViewControllerobj=nil;
	}
	
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
	/*if (interfaceOrientation == UIDeviceOrientationPortrait)// || (interfaceOrientation == UIInterfaceOrientationLandscapeRight)||(interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown))
	{
		return YES;
	}
	else 
	{
		 return NO;
		
	}*/
	
	return (interfaceOrientation == UIDeviceOrientationPortrait);
   
}


///////////////////////////////////////////////
//On pressing the press button
////////////////////////////////////////////
-(IBAction)Pressgamebutton:(id)argName
{
	UIAlertView *alert						= [[UIAlertView alloc] initWithTitle:nil message:@"Coming Soon!"delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles: nil];
	[alert show];
	if(alert!=nil)
	{
		[alert release];
		alert=nil;
	}
}


///////////////////////////////////////////////
//On pressing the video button
////////////////////////////////////////////
-(IBAction)Pressvideobutton:(id)argName
{
	VideoViewController *videoViewControllerobj		=	[VideoViewController new];
	[self.navigationController pushViewController:videoViewControllerobj animated:YES];
	if(videoViewControllerobj!=nil)
	{
		[videoViewControllerobj release];
		videoViewControllerobj=nil;
	}
}


///////////////////////////////////////////////
//On pressing the more button
////////////////////////////////////////////
-(IBAction)Pressmorebutton:(id)argName
{
	MoreViewController *moreViewControllerobj		=		[MoreViewController new];
	[self.navigationController  pushViewController:moreViewControllerobj animated:YES];
	if(moreViewControllerobj!=nil)
	{
	[moreViewControllerobj release];
	moreViewControllerobj=nil;
	}
}


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


- (void)dealloc 
{
	if(comic_Button!=nil)
	{
		[comic_Button  release];
		comic_Button=nil;
	}
	
	if(video_Button!=nil)
	{
		[video_Button  release];
		video_Button=nil;
	}
	
	if(game_Button!=nil)
	{
		[game_Button  release];
		game_Button=nil;
	}
	
	if(more_Button!=nil)
	{
	[more_Button release];
	more_Button=nil;
	}
		
	[super dealloc];
}


@end
