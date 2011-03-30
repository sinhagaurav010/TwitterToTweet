    //
//  InsidecomicsViewController.m
//  ComiciPad
//
//  Created by CHROME INFOTECH  on 07/09/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "InsidecomicsViewController.h"
#import "ComicViewController.h"
#define  LOGFLAG  0
@implementation InsidecomicsViewController

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/
/////////////////////////////////////////////////////////////////////////
//This function is to take the uiview up in animating way
/////////////////////////////////////////////////////////////////////////
/*-(void)animationtoup
{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1];
	[UIView commitAnimations];
	frameOfAnimation						=   CGRectMake(0, -60, 768, 45);
	viewForPages.frame							=  frameOfAnimation;	
	//[timerFade invalidate];
}
*/
////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////
-(void)updateCounter:(id)sender
{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1];
	if(LOGFLAG==1)
		NSLog(@"timer startedViewtoDownupdateCounter");
	
	frameOfAnimation						=   CGRectMake(0, -60, 768, 45);
	viewForPages.frame							=  frameOfAnimation;	
	[UIView commitAnimations];
	click=0;
	//timerFade=nil;
	//[timerFade invalidate];
}


/////////////////////////////////////////////////////////////////////////
//This function is to take the uiview down in animating way
/////////////////////////////////////////////////////////////////////////
/*-(void)ViewtoDown
{
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1];
	if(LOGFLAG==1)
		NSLog(@"timer startedViewtoDown");
	frameOfAnimation						=   CGRectMake(0, 0, 768, 45);
	viewForPages.frame							=  frameOfAnimation;	
		[UIView commitAnimations];
	//[timerFade invalidate];
}
*/

/////////////////////////////////////////////////////////////////////////
//This functon is to add bookmark and home button on the screen in animated way
/////////////////////////////////////////////////////////////////////////
-(void)functionForBookmarkAndHome
{
	if(click==0)
	{
		click=1;
	  if(LOGFLAG==1)
		  NSLog(@"functionfobookmark");

		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:1];
		
		frameOfAnimation						=   CGRectMake(0, 0, 768, 45);
		viewForPages.frame							=  frameOfAnimation;
		
		[UIView commitAnimations];	
		
		if(timerFade!=nil)
		timerFade=nil;
	   if(LOGFLAG==1)
			NSLog(@"timer started");
	
		timerFade								=	[NSTimer scheduledTimerWithTimeInterval:15.0f target:self selector:@selector(updateCounter:) userInfo:nil repeats:NO];
		if(LOGFLAG==1)
		NSLog(@"timer finished");		
	}

	
}
//////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	click=0;
	pageNumForBookmark						=	0;
	
	
	arrayForStorypages=	[NSMutableArray new];
	CGRect frameOfbackGroundimage			=   CGRectMake(0, 0, 768, 1024);
	UIImageView *backGroundimage			=	[[UIImageView alloc] initWithFrame:frameOfbackGroundimage];
	backGroundimage.backgroundColor			=	[UIColor blackColor];
    [self.view addSubview:backGroundimage];
	
	
	CGRect frameOfPages						=   CGRectMake(0, 0, 768, 1024);
	imageview2								=	[[UIImageView alloc] initWithFrame:frameOfPages];
	NSString    *imageNameadvpage					=	[[arrayOfDictionary objectAtIndex:comicsNum]objectForKey:@"advpage"];
	NSLog(@"imageNameadvpageimageNameadvpage---->%@",imageNameadvpage);
	imageview1								=	[[UIImageView alloc] initWithFrame:frameOfPages];
	NSString    *imageNameforcoverpage		=	[[arrayOfDictionary objectAtIndex:comicsNum]objectForKey:@"coverpage"];
	
	comicComponent							=	[NSArray new];
	comicComponent							= [[[arrayOfDictionary objectAtIndex:comicsNum]objectForKey:@"storypages"] componentsSeparatedByString:@","];
	
	
	[arrayForStorypages addObject:imageNameforcoverpage	];
	if(![imageNameadvpage isEqualToString:@"NA"])
	{
	[arrayForStorypages addObject:imageNameadvpage];
	}
		for(int k=0;k<[comicComponent count];k++)
	[arrayForStorypages addObject:[comicComponent objectAtIndex:k]];
	
	comicComponent  = nil;
		
	CGRect frameOfMainSubview				=   CGRectMake(0, 0, 768, 1024);
    subView									=	[[UIView alloc]initWithFrame:frameOfMainSubview];
	[self.view addSubview:subView];
   [subView addSubview:backGroundimage];
	
	if(resume==0){
		touch=0;
		imageview1.image					= [UIImage imageNamed:imageNameforcoverpage];
	}
	else {
		if (LOGFLAG==1) 
			NSLog(@"resume selected bookmark%i",selectBookmark);
		imageview1.image					=	 [UIImage imageNamed:[arrayForStorypages objectAtIndex:selectBookmark]];
		touch								=	selectBookmark;
	}
	
	
	[subView addSubview:imageview1];
	
	frameOfAnimation						=   CGRectMake(0,-60, 768, 42);
	viewForPages									=	[[UIImageView alloc] initWithFrame:frameOfAnimation];
	viewForPages.backgroundColor					=[UIColor blackColor];
	
	homeButton								= [[UIButton alloc]initWithFrame:CGRectMake(670, 0.0, 103, 42)];
	[homeButton addTarget:self action:@selector(homeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
	[homeButton setTitle:@"HOME"  forState:(UIControlState)UIControlStateNormal];
	homeButton.font							= [UIFont boldSystemFontOfSize:25];
   
	bookMark								= [[UIButton alloc]initWithFrame:CGRectMake(0.0, 0.0, 300, 42)];
	[bookMark addTarget:self action:@selector(bookMarkClick:) forControlEvents:UIControlEventTouchUpInside];
	[bookMark setTitle:@"ADD TO BOOKMARK"  forState:(UIControlState)UIControlStateNormal];
	bookMark.font							= [UIFont boldSystemFontOfSize:25];
	
    
	[viewForPages addSubview:bookMark];	
    [viewForPages addSubview:homeButton];
	viewForPages.userInteractionEnabled=YES;
	
	
	[self.view addSubview:viewForPages];
	 
	timerFade							   	=	[NSTimer new];
	if(backGroundimage)
	{
		[backGroundimage release];
		backGroundimage=nil;
	}
    [super viewDidLoad];
}
/////////////////////////////////////////////////////////////////////////




/////////////////////////////////////////////////////////////////////////
//THis function is to starting with safe page
/////////////////////////////////////////////////////////////////////////
-(void)functionToResume
{
	if ([[NSUserDefaults standardUserDefaults]objectForKey:[NSString stringWithFormat:@"%i",comicsNum]])
	{
		selectBookmark = [[NSUserDefaults standardUserDefaults] integerForKey:[NSString stringWithFormat:@"%i",comicsNum]];
		resume		   = 1;
		if(LOGFLAG == 1)
		NSLog(@"selectBookmark-->%i",selectBookmark);
		//touch=selectBookmark;
	}
	
	else
	{
	resume	=	0;
	}
	NSString    *imageNameforcoverpage		=	[[arrayOfDictionary objectAtIndex:comicsNum]objectForKey:@"coverpage"];
	if(resume == 0)
	{
		touch = 0;
		imageview1.image					= [UIImage imageNamed:imageNameforcoverpage];
	}
	else
	{
		imageview1.image					=	 [UIImage imageNamed:[arrayForStorypages objectAtIndex:selectBookmark]];
		touch								=	selectBookmark;
	}
}
/////////////////////////////////////////////////////////////////




/////////////////////////////////////////////////////////////////////////
//On clicking this button View controller will be ComicViewController
/////////////////////////////////////////////////////////////////////////
-(IBAction)homeButtonClick:(id)sender
{
	//ComicViewController *obj			=	[ComicViewController new];
	//[self.navigationController pushViewController:obj animated:YES];
[self.navigationController popViewControllerAnimated:YES];
}
////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////
//On clicking this button page save as bookmark
/////////////////////////////////////////////////////////////////////////
-(IBAction)bookMarkClick:(id)sender
{
	if ([[NSUserDefaults standardUserDefaults]objectForKey:[NSString stringWithFormat:@"%i",comicsNum]])
	{
		[[NSUserDefaults standardUserDefaults] removeObjectForKey:[NSString stringWithFormat:@"%i",comicsNum]]; 
		
		if(LOGFLAG==1)
		NSLog(@"Key Deleted");
	}
	
	//- (void)setInteger:(NSInteger)value forKey:(NSString *)defaultName;
	[[NSUserDefaults standardUserDefaults]setInteger:pageNumForBookmark forKey:[NSString stringWithFormat:@"%i",comicsNum]];	
	
	UIAlertView *alert						= [[UIAlertView alloc] initWithTitle:@"info" message:@"Bookmark saved"delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles: nil];
	[alert show];
	if(alert!=nil)
	{
		[alert release];
		alert=nil;
	}
}
////////////////////////////////////////////////////////////////



/////////////////////////////////////////////////////////////////////////
//This function is for the curling effect of the page
/////////////////////////////////////////////////////////////////////////
-(void)functionToStartcurling
{
	transitionUncurling				= [CATransition animation];
		// Animate over 0.7 of a second
	transitionUncurling.duration						= 0.7f;
	transitionUncurling.delegate						= self;
	transitionUncurling.subtype						= kCATransitionFromRight;
	transitionUncurling.type							= @"pageCurl";
	
	[subView.layer addAnimation:transitionUncurling forKey:nil];
	imageview1.image						= [UIImage imageNamed:[arrayForStorypages objectAtIndex:touch]];
	
	pageNumForBookmark						=	touch;	 
	
	if(LOGFLAG==1)
		NSLog(@"pageNumForBookmark--%i",pageNumForBookmark);
}	
////////////////////////////////////////////////////////////////



/////////////////////////////////////////////////////////////////////////
//This function is for the uncurling effect of the page
/////////////////////////////////////////////////////////////////////////
-(void)functionToStartUncurling
{
	transitionCurling				= [CATransition animation];
	// Animate over 3/4 of a second
	transitionCurling.duration						= 0.7f;
	transitionCurling.delegate						= self;
	transitionCurling.subtype						= kCATransitionFromRight;
	transitionCurling.type							= @"pageUnCurl";
	
	[subView.layer addAnimation:transitionCurling forKey:nil];
	
	imageview1.image						= [UIImage imageNamed:[arrayForStorypages objectAtIndex:touch]];
	
	pageNumForBookmark						=	touch;
	if(LOGFLAG==1)
		NSLog(@"pageNumForBookmark--%i",pageNumForBookmark);
}	
////////////////////////////////////////////////////////////////////////



/////////////////////////////////////////////////////////////////////////
//on touching event began
/////////////////////////////////////////////////////////////////////////
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	
	UITouch *touchpoints					= [touches anyObject];
    currentPosition							= [touchpoints locationInView:subView];
	
	if (currentPosition.x>300  && currentPosition.x<500 ) {
		if (currentPosition.y>400  && currentPosition.y<600) {
			if(LOGFLAG==1)
				NSLog(@"touches began");
		 [self functionForBookmarkAndHome];
		}
	}
}
////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////
//on touching event ended
/////////////////////////////////////////////////////////////////////////
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touchpoints				= [touches anyObject];
	finalPosition						= [touchpoints locationInView:subView];

	
	if (finalPosition.x<currentPosition.x-10) {
		if(touch<([arrayForStorypages count]-1))
		{
		touch++;	
		[self functionToStartcurling];
			
		}
		if (frameOfAnimation.origin.y==0){
			
		
			if (timerFade!=nil)
			{
			 [timerFade invalidate];
			 timerFade=nil;
			}
			
			[UIView beginAnimations:nil context:nil];
			[UIView setAnimationDuration:1];
			
			frameOfAnimation					=   CGRectMake(0, -60, 768, 45);
			viewForPages.frame						=  frameOfAnimation;	
			[UIView commitAnimations];
			click=0;
		}
	}
	
	if (finalPosition.x>currentPosition.x+10) {
		if(touch>0)
		{
			touch--;
			[self functionToStartUncurling];
		}
		
		if (frameOfAnimation.origin.y==0){
			if (timerFade!=nil)
			{
				[timerFade invalidate];
				timerFade=nil;
			}
		
			click=0;

			[UIView beginAnimations:nil context:nil];
			[UIView setAnimationDuration:1];
			
			frameOfAnimation						=   CGRectMake(0, -60, 768, 45);
			viewForPages.frame							=  frameOfAnimation;	
			[UIView commitAnimations];
		 }			
	}
	
}
////////////////////////////////////////////////////////////////

	
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return NO;
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


- (void)dealloc {
	if(homeButton)
	{
		[homeButton			release];
		homeButton=nil;
	}
	if(bookMark)
	{
		[bookMark			release];
		bookMark=nil;
	}
	if(timerFade)
	{
		[timerFade			release];
		timerFade=nil;
	}
	if(subView)
	{
		[subView			release];
		subView=nil;
	}
	if(arrayForStorypages)
	{
		[arrayForStorypages	release];
		arrayForStorypages=nil;
	}
	if(imageview1)
	{
		[imageview1			release];
		imageview1=nil;
	}
	if(imageview2)
	{
		[imageview2			release];
		imageview2=nil;
	}
	if(viewForPages)
	{
		[viewForPages				release];
		viewForPages=nil;
	}
	/*if(transitionUncurling)
	{
		[transitionUncurling				release];
		transitionUncurling=nil;
	}
	if(transitionCurling)
	{
		[transitionCurling				release];
		transitionCurling=nil;
	}*/
    [super dealloc];
}


@end
