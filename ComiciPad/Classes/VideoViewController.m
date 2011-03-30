    //
//  VideoViewController.m
//  ComiciPad
//
//  Created by CHROME INFOTECH  on 09/09/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "VideoViewController.h"
#define LOGFLAG 1
#define SENDER   [Sender tag]

@implementation VideoViewController


- (VideoViewController *) initXMLParser {
	
	//arrayForKey					=	[NSMutableArray new];
	[super init];
	//appDelegate				= (ComiciPadAppDelegate *)[[UIApplication sharedApplication] delegate];
	return self;
}


////////////////////////////////////////////////////////////////////////////
/////This function  is used to parse the Xml file
/////////////////////////////////////////////////////////////////
-(void)parsingofComicVideoXmlfile
{
	NSString *filePath					= [[NSBundle mainBundle]pathForResource:@"XmlFileForComicvideo" ofType:@"xml"];
	NSString *fileContents				= [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
	NSData  *comicVideoXmlfileData						= [fileContents dataUsingEncoding:NSUTF8StringEncoding];
	
	NSXMLParser *xmlParser				= [[NSXMLParser alloc] initWithData:comicVideoXmlfileData];
	
	VideoViewController *parser	=	[[VideoViewController alloc] initXMLParser];// Used for ehat purpose
	[xmlParser setDelegate:parser];
	
	
	//	Start parsing the XML file.
	BOOL success						= [xmlParser parse];
	if(success)
		NSLog(@"No Errors");
	else
		NSLog(@"Error Error Error!!!");
	
	
	if (xmlParser)
	{
		[xmlParser release];
		xmlParser = nil;
	}
	
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName 
	attributes:(NSDictionary *)attributeDict {
	
	if([elementName isEqualToString:@"comic"]) {
		
	}
	
	else if([elementName isEqualToString:@"item"]) 
	{
		
	}	
	
	
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string 

{ 
	if(!currentElementValue) {
		
		currentElementValue	= [[NSMutableString alloc] initWithString:string];
	}
	
	
	else{
		
		[currentElementValue appendString:string];
		if(LOGFLAG==1)
		NSLog(@"string%@",string);
	}
	
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
	
	if([elementName isEqualToString:@"comic"]){
		return;
	}
		if([elementName isEqualToString:@"item"]) {
		
		[arrayOfDictionaryforvideo	addObject:dictionayForXmlfilevideo];
		dictionayForXmlfilevideo	=	[NSMutableDictionary new];
		
		}
	
	if([elementName isEqualToString:@"videoname"]){
		
		[dictionayForXmlfilevideo  setObject:[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:elementName];
      if(LOGFLAG==1)
		NSLog(@"comicname------------->>>%@",currentElementValue);
	}
	if([elementName isEqualToString:@"title"]){
		
		[dictionayForXmlfilevideo  setObject:[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:elementName];
    if(LOGFLAG==1)
		NSLog(@"comicname------------->>>%@",currentElementValue);
	}
	if([elementName isEqualToString:@"series"]){
		
		[dictionayForXmlfilevideo  setObject:[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:elementName];
        if(LOGFLAG==1)
		NSLog(@"comicname------------->>>%@",currentElementValue);
	}
	
	if([elementName isEqualToString:@"thumbnail"]){
		
		[dictionayForXmlfilevideo  setObject:[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:elementName];
      if(LOGFLAG==1)
		NSLog(@"comicname------------->>>%@",currentElementValue);
	}
	
	if([elementName isEqualToString:@"videofiletype"]){
		
		[dictionayForXmlfilevideo  setObject:[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:elementName];
       if(LOGFLAG==1)
		NSLog(@"comicname------------->>>%@",currentElementValue);
	}
	
	
	if([elementName isEqualToString:@"episodenumber"]){
		
		[dictionayForXmlfilevideo  setObject:[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:elementName];
		if(LOGFLAG==1)
		NSLog(@"elementname---------->>>%@",currentElementValue);
	}
	
	if([elementName isEqualToString:@"discription"]){
		
		[dictionayForXmlfilevideo  setObject:[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:elementName];
		if(LOGFLAG==1)
		NSLog(@"elementname---------->>%@",currentElementValue);		
	}
	
	else {
	}
	if(currentElementValue)
	{
	[currentElementValue release];
	currentElementValue						= nil;
	}
}
////////////////////////////////////////////////////////////////////////////

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
	
	dictionayForXmlfilevideo					=	[NSMutableDictionary new];
	arrayOfDictionaryforvideo					=	[NSMutableArray new];
		
	//////////////////////Parsing of video Xml file start from here
	[self parsingofComicVideoXmlfile];
	
	/////To set the notification when movie will finish
	//[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(myMovieFinishedCallback:) name:MPMoviePlayerPlaybackDidFinishNotification object:videoPlayer];
	

	if(LOGFLAG==1)
	NSLog(@"-------------------------------------\n");
	if(LOGFLAG==1)
	NSLog(@"bnmnmn%@",arrayOfDictionaryforvideo);
	
	/////To set the background black						
	
	
	/////To set the scroll view
	scrollView									=	[UIScrollView new];
	CGRect frameOfScroll						=	CGRectMake(0,42,768, 960);
	scrollView.frame							=	frameOfScroll;
	[scrollView setContentSize:CGSizeMake(684, 960)];
	[self.view addSubview:scrollView];
	
	/////To set the cancel button
	/*cancelbutton							= [[UIButton alloc]initWithFrame:CGRectMake(640, 0.0, 143, 42)];
	[cancelbutton addTarget:self action:@selector(stopVideo:) forControlEvents:UIControlEventTouchUpInside];
	[cancelbutton setTitle:@"CANCEL"  forState:(UIControlState)UIControlStateNormal];
	cancelbutton.font						= [UIFont boldSystemFontOfSize:25];
	[self.view  addSubview:cancelbutton];
	cancelbutton.hidden						=YES;
	*/
	/////To set the home button
    homeButton									= [[UIButton alloc]initWithFrame:CGRectMake(670, 0.0, 103, 42)];
	[homeButton addTarget:self action:@selector(homeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
	[homeButton setTitle:@"HOME"  forState:(UIControlState)UIControlStateNormal];
	homeButton.font								= [UIFont boldSystemFontOfSize:25];
	[self.view  addSubview:homeButton];

	arrayForText      =    [NSMutableArray new];
	int incIny=0;
	incIny=0.0;
	for(int i=0;i<[arrayOfDictionaryforvideo count];i++)
	{
		/////To set the label for series
	UILabel *label								=	[[UILabel alloc]initWithFrame:CGRectMake(380,incIny, 398, 30)];
	label.text									=	 @"Series:";
	//label.text								=[seriesstrng stringByAppendingFormat:[[arrayOfDictionaryforvideo objectAtIndex:i]objectForKey:@"series"]];	;
	label.textColor								= [UIColor whiteColor];
	label.backgroundColor						= [UIColor clearColor];
	label.font									= [UIFont fontWithName:@"Arial Rounded MT Bold" size:(25.0)];
	[scrollView addSubview:label];
	
	UILabel *labelser							=	[[UILabel alloc]initWithFrame:CGRectMake(480,incIny, 398, 30)];
	labelser.text								=[[arrayOfDictionaryforvideo objectAtIndex:i]objectForKey:@"series"];	
	labelser.textColor							= [UIColor whiteColor];
	labelser.backgroundColor					= [UIColor clearColor];
	labelser.font								= [UIFont fontWithName:@"Arial Rounded MT Bold" size:(21.0)];
	[scrollView addSubview:labelser];
		
		
	/////To set the label for episode
	UILabel *labeleps							=	[[UILabel alloc]initWithFrame:CGRectMake(380,incIny+30, 398, 30)];
	labeleps.text								=	@"Episode:";
	//labeleps.text								=[episodstrng stringByAppendingFormat:[[arrayOfDictionaryforvideo objectAtIndex:i]objectForKey:@"episodenumber"]];	;
	labeleps.textColor							= [UIColor whiteColor];
	labeleps.backgroundColor					= [UIColor clearColor];
	labeleps.font								= [UIFont fontWithName:@"Arial Rounded MT Bold" size:(25.0)];
	[scrollView addSubview:labeleps];
	
		
	UILabel *labelepsdetext						=	[[UILabel alloc]initWithFrame:CGRectMake(510,incIny+30, 398, 30)];
	labelepsdetext.text							=[[arrayOfDictionaryforvideo objectAtIndex:i]objectForKey:@"episodenumber"];	
	labelepsdetext.textColor					= [UIColor whiteColor];
	labelepsdetext.backgroundColor				= [UIColor clearColor];
	labelepsdetext.font							= [UIFont fontWithName:@"Arial Rounded MT Bold" size:(21.0)];
	[scrollView addSubview:labelepsdetext];
		
		
		/////To set the label for title
	UILabel *labeltitle							=	[[UILabel alloc]initWithFrame:CGRectMake(380,incIny+60, 398, 30)];
	labeltitle.text								=	@"Title:";
	//labeltitle.text							=[titlestrng stringByAppendingFormat:[[arrayOfDictionaryforvideo objectAtIndex:i]objectForKey:@"title"]];	;
	labeltitle.textColor						= [UIColor whiteColor];
	labeltitle.backgroundColor					= [UIColor clearColor];
	labeltitle.font								= [UIFont fontWithName:@"Arial Rounded MT Bold" size:(25.0)];
	[scrollView addSubview:labeltitle];
	
		
	UILabel *labeltitletext						=	[[UILabel alloc]initWithFrame:CGRectMake(456,incIny+60, 398, 30)];
	labeltitletext.text							=[[arrayOfDictionaryforvideo objectAtIndex:i]objectForKey:@"title"];	
	labeltitletext.textColor					= [UIColor whiteColor];
	labeltitletext.backgroundColor				= [UIColor clearColor];
	labeltitletext.font							= [UIFont fontWithName:@"Arial Rounded MT Bold" size:(21.0)];
	[scrollView addSubview:labeltitletext];
	
		
	UITextView *textView						= [[UITextView alloc] initWithFrame:CGRectMake(370, incIny+90, 398, 210)];
	textView.textColor							= [UIColor whiteColor];
	textView.font								= [UIFont fontWithName:@"Arial" size:17];
	//textView.delegate = self;
	textView.backgroundColor					= [UIColor clearColor];
	NSString	*discrptionstrng				=	@"Discription:";
	textView.text								=[discrptionstrng stringByAppendingFormat:[[arrayOfDictionaryforvideo objectAtIndex:i]objectForKey:@"discription"]];
	[arrayForText   addObject:textView];
	[scrollView addSubview:textView];
	textView.editable=NO;
	
		/////To set the  video
	UIButton *buttonForVideo					= [[UIButton alloc] initWithFrame: CGRectMake(frameOfScroll.origin.x+12,incIny,336,300)];
	NSString    *imageName						=	[[arrayOfDictionaryforvideo objectAtIndex:i]objectForKey:@"thumbnail"];
	[buttonForVideo setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [buttonForVideo addTarget:self action:@selector(videoplay:) forControlEvents:UIControlEventTouchUpInside];
	[scrollView addSubview:buttonForVideo];
	buttonForVideo.tag=i;
				
	incIny+=330;
	if(buttonForVideo)
	{
		[buttonForVideo		release];
		buttonForVideo =nil;
	}
	if(textView)
	{
		[textView		release];
		textView =nil;
	}
	if(label)
	{
		[label		release];
		label =nil;
	}
	if(labelser)
	{
			[labelser		release];
			labelser =nil;
	}	
	if(labeleps)
	{
		[labeleps		release];
		labeleps =nil;
	}	
	if(labelepsdetext)
	{
		[labelepsdetext		release];
		labelepsdetext =nil;
	}
	if(labeltitletext)
	{
			[labeltitletext		release];
			labeltitletext =nil;
	}	
		
	if(labeltitle)
	{
		[labeltitle		release];
		labeltitle =nil;
    }
}
		
	//overlayFrDoneButton.hidden=YES;
	frameOfAnimation							=   CGRectMake(0,-60, 768, 42);
	myview										=	[[UIImageView alloc] initWithFrame:frameOfAnimation];
	myview.backgroundColor						=	[UIColor blackColor];
	
	CGRect frameOfwindowsfrdonebutton			=   CGRectMake(5, 5, 100, 29);
	overlayFrDoneButton = [[UIButton alloc] initWithFrame:frameOfwindowsfrdonebutton];
	[overlayFrDoneButton setTitle:@"CLOSE"  forState:(UIControlState)UIControlStateNormal];
	overlayFrDoneButton.font							= [UIFont boldSystemFontOfSize:25];

		// We want to get notified whenever the overlay control is touched
	
	[overlayFrDoneButton addTarget:self action:@selector(windowsfrdonebuttonTouched:)  forControlEvents:UIControlEventTouchUpInside];
	
	// Add the overlay to the window's subviews
		
	[myview addSubview:overlayFrDoneButton];
	timerFade								=	[NSTimer new];
	[super viewDidLoad];
	
	//	[scrollView release];
	
		
}


//////////////////////////////////////
//When home button is clicked
////////////////////////////////////
-(IBAction)homeButtonClick:(id)sender
{
	[self.navigationController popToRootViewControllerAnimated:YES];

}


///////////////////////////////////////////////
//This function is called when movie is finished
///////////////////////////////////////////////
-(void)myMovieFinishedCallback:(NSNotification*)aNotification{
	
	videoPlayer = [aNotification object];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:videoPlayer];
	[videoPlayer stop];
	[videoPlayer.view removeFromSuperview];
	if(timerFade!=nil)
	{
		
		timerFade=nil;
		
	}
	[myview removeFromSuperview];
	
	
	touch=0;
	
	
}


////////////////////////////////////////////////////////////////////////////
//To set notification for video
////////////////////////////////////////////////////////////////////////////
-(void)notificationFunction
{
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(myMovieFinishedCallback:) name:MPMoviePlayerPlaybackDidFinishNotification object:videoPlayer];
	
	[[NSNotificationCenter defaultCenter]  addObserver:self	 selector:@selector(playerWillFromFullScreen:) name:MPMoviePlayerWillExitFullscreenNotification object:videoPlayer];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playerWillEnterToFullScreen:) name:MPMoviePlayerDidEnterFullscreenNotification object:videoPlayer];
	
}


/////////////////////////////////////////////////////////////////
//This function is to play video 
///////////////////////////////////////////////////////////////
-(void)functiontosetvideo
{
	NSString *videoname							=	[[arrayOfDictionaryforvideo objectAtIndex:videoNum]objectForKey:@"videoname"];
	NSString *videotype							=	[[arrayOfDictionaryforvideo objectAtIndex:videoNum]objectForKey:@"videofiletype"];
	
	NSString *urlStr							= [[NSBundle mainBundle] pathForResource:videoname ofType:videotype];
    NSURL *url									= [NSURL fileURLWithPath:urlStr];
	
	videoPlayer									= [[MPMoviePlayerController alloc] initWithContentURL:url];
	//[videoPlayer setMovieControlMode:MPMovieControlModeHidden];
	
	//videoPlayer.movieControlMode.
   // videoPlayer.view.frame						= CGRectMake(0,0,768, 1004);
	//videoPlayer.scalingMode						=MPMovieScalingModeAspectFill;
	//videoPlayer.controlStyle = MPMovieControlStyleFullscreen;
	
	[self.view	 addSubview:videoPlayer.view];
	  
	if(landmode == 0)
	videoPlayer.view.frame = CGRectMake(0, 0,768, 1000); 
	else
	videoPlayer.view.frame = CGRectMake(0, 0,1024, 748);
	
	[videoPlayer play];
	//[videoPlayer play];
}

//////////////////////////////////////
//When click on the images to play
////////////////////////////////////
-(IBAction)videoplay:(id)sender	
{
	videoNum=[sender tag];
	[self notificationFunction];
	[self functiontosetvideo];
}

//////////////////////////////////////////////////////////////
/*
- (void) handle_iPodLibraryChanged:(NSNotification*) aNotification {
	videoPlayer = [aNotification object];
    [[NSNotificationCenter defaultCenter] 
	 removeObserver:self
	 name:MPMediaLibraryDidChangeNotification
	 object:videoPlayer];
	
	NSLog(@"dcds");
}

- (void) handle_PlaybackStateChanged:(NSNotification*) aNotification {
	videoPlayer = [aNotification object];
    [[NSNotificationCenter defaultCenter] 
	 removeObserver:self
	 name:MPMusicPlayerControllerPlaybackStateDidChangeNotification
	 object:videoPlayer];
	
		NSLog(@"dcds");
	}
- (void) handle_NowPlayingItemChanged:(NSNotification*) aNotification {
	videoPlayer = [aNotification object];
    [[NSNotificationCenter defaultCenter] 
	 removeObserver:self
	 name:MPMusicPlayerControllerPlaybackStateDidChangeNotification
	 object:videoPlayer];
	
	NSLog(@"handle_NowPlayingItemChanged");
}*/
/*- (void)remoteControlReceivedWithEvent:(UIEvent *)event {
	
    if( event.subtype == 104) {
        NSLog(@"sub type: %d", event.subtype);
    }
}*/
-(void)functiontosetframeOfAnimation
{
	if(landmode   ==   0)
	{
	    frameOfAnimation						=   CGRectMake(0, -60, 768, 45);
	    myview.frame							=  frameOfAnimation;
	}
	else 
	{
		frameOfAnimation						=   CGRectMake(0, -60, 1024, 45);
		myview.frame							=  frameOfAnimation;
	}

}
//////////////////////////////////////////////////////////////////////////////
//When fadetimer will finish
////////////////////////////////////////////////////////////////////////////
-(void)updateCounter:(id)sender
{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1];
	
	[self  functiontosetframeOfAnimation];	
	[UIView commitAnimations];	
	NSLog(@"vcdv cd");
}
//////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////
//When user touches the screen 
////////////////////////////////////////////////////////////////////////////
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	if(frameOfAnimation.origin.y==0)
	{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1];
	
		[self  functiontosetframeOfAnimation];	

	
	[UIView commitAnimations];
		[timerFade invalidate];
		timerFade=nil;

	}
}	
////////////////////////////////////////////////////////////////////////////

	/*NSLog(@"dfv");
	if(ply==1)
	{
		NSLog(@"dfv");
		[videoPlayer setMovieControlMode:MPMovieControlModeDefault];
				/*frameOfAnimation							=   CGRectMake(0,0, 768, 42);
		 myview										=	[[UIImageView alloc] initWithFrame:frameOfAnimation];
		 //myview.backgroundColor						=	[UIColor blackColor];*/
	/*	if(clickOnVideoplayer==1)
		{
			NSLog(@"dfv");

			CGRect frameOfwindowsfrdonebutton			=   CGRectMake(5, 5, 52, 29);
			overlayFrDoneButton = [[UIButton alloc] initWithFrame:frameOfwindowsfrdonebutton];
			NSString    *imageName						=	@"Donebutton.png";
			[overlayFrDoneButton setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
			
			// We want to get notified whenever the overlay control is touched
			
			[overlayFrDoneButton addTarget:self action:@selector(windowsfrdonebuttonTouched:)  forControlEvents:UIControlEventTouchUpInside];
			
			// Add the overlay to the window's subviews
			
			//[myview addSubview:overlayFrDoneButton];
			//	[self.view addSubview:myview];
			[self.view addSubview:overlayFrDoneButton];
			//overlayFrDoneButton.hidden=YES;
			if(timerFade!=nil)
			{
				[timerFade invalidate];
				timerFade=nil;
			}
			timerFade=[NSTimer new];
			timerFade								=	[NSTimer scheduledTimerWithTimeInterval:5.5 target:self selector:@selector(updateCounter:) userInfo:nil repeats:NO];
			
			
			clickOnVideoplayer=0;
	}
		else {
			if(timerFade!=nil)
			{
				[timerFade invalidate];
				timerFade=nil;
			}
			[videoPlayer setMovieControlMode:MPMovieControlModeHidden];
			[overlayFrDoneButton removeFromSuperview];
		//	overlayFrDoneButton.hidden=YES;
			clickOnVideoplayer=1;
	}

	
	}
		}*/	
//////////////////////////////////////////////////////////////////////////////
	

////////////////////////////////////////////////////////////////////////////
//When screen will enter to full screen
////////////////////////////////////////////////////////////////////////////
- (void) playerWillEnterToFullScreen:(NSNotification*) aNotification 
{
	videoPlayer = [aNotification object];
	[[NSNotificationCenter defaultCenter] 
	 removeObserver:self
	 name:MPMoviePlayerWillEnterFullscreenNotification
	 object:videoPlayer];	
	
	moviePlayerWindow					= [[UIApplication sharedApplication] keyWindow];
	touch=0;
	
	//[videoPlayer setMovieControlMode:MPMovieControlModeHidden];
	CGRect frameOfnxtbutton				=   CGRectMake(446, 883, 40, 28);
	overlayNxtButton					= [[UIButton alloc] initWithFrame:frameOfnxtbutton];
	// We want to get notified whenever the overlay control is touched
	//NSString    *imageName						=	@"nextVideo.png";
	//[overlayNxtButton setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
	[overlayNxtButton	 addTarget:self action:@selector(overlayNxtButtonTouched:)  forControlEvents:UIControlEventTouchUpInside];
	// Add the overlay to the window's subviews
	[moviePlayerWindow addSubview:overlayNxtButton	];
	
	
	// The movie's window is the one that is active
	// Now we create an invisible control with the same size as the window
	CGRect frameOfbackGround			=   CGRectMake(280, 883, 39, 28);
	overlayFrBckButton = [[UIButton alloc] initWithFrame:frameOfbackGround];
	//NSString    *imageNamebck						=	@"previous.png";
	//[overlayFrBckButton setBackgroundImage:[UIImage imageNamed:imageNamebck] forState:UIControlStateNormal];
	// We want to get notified whenever the overlay control is touched 
	[overlayFrBckButton addTarget:self action:@selector(overlayFrBckButtonTouched:)  forControlEvents:UIControlEventTouchUpInside];		
	// Add the overlay to the window's subviews
	[moviePlayerWindow addSubview:overlayFrBckButton];
	}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//touch=1;
		// The movie's window is the one that is active
		// Now we create an invisible control with the same size as the window
	/*	CGRect frameOfnxtbutton				=   CGRectMake(446, 883, 40, 28);
		overlayNxtButton					= [[UIButton alloc] initWithFrame:frameOfnxtbutton];
		// We want to get notified whenever the overlay control is touched
		//NSString    *imageName						=	@"nextVideo.png";
		//[overlayNxtButton setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
       [overlayNxtButton	 addTarget:self action:@selector(overlayNxtButtonTouched:)  forControlEvents:UIControlEventTouchUpInside];
        // Add the overlay to the window's subviews
        [moviePlayerWindow addSubview:overlayNxtButton	];
	
	NSLog(@"overlayFrBckButtonTouched");

		// The movie's window is the one that is active
        // Now we create an invisible control with the same size as the window
		CGRect frameOfbackGround			=   CGRectMake(280, 883, 39, 28);
		overlayFrBckButton = [[UIButton alloc] initWithFrame:frameOfbackGround];
		NSString    *imageNamebck						=	@"previous.png";
		[overlayFrBckButton setBackgroundImage:[UIImage imageNamed:imageNamebck] forState:UIControlStateNormal];
        // We want to get notified whenever the overlay control is touched 
		[overlayFrBckButton addTarget:self action:@selector(overlayFrBckButtonTouched:)  forControlEvents:UIControlEventTouchUpInside];		
        // Add the overlay to the window's subviews
        [moviePlayerWindow addSubview:overlayFrBckButton];
		// The movie's window is the one that is active*/
        // Now we create an invisible control with the same size as the window
		
		
		
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////
//To go main menu while video is playing
////////////////////////////////////////////////////////////////////////////
-(void)windowsfrdonebuttonTouched:(UIControl*)sender
{
	[videoPlayer stop];
	[videoPlayer.view removeFromSuperview];
	//overlayFrDoneButton.hidden=YES;
	[self  functiontosetframeOfAnimation];	


	[myview removeFromSuperview];
	
	if(timerFade!=nil)
	{
		[timerFade invalidate];
		timerFade=nil;
	}
}
//////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////
//To go to  previous video
////////////////////////////////////////////////////////////////////////////
-(void)overlayFrBckButtonTouched:(UIControl*)sender
{
	NSLog(@"overlayFrBckButtonTouched");
}
//	NSLog(@"videoNum%i",videoNum);
	/*if(touch==1)
	{
	if(videoNum>0)
		{
		videoNum--;
		[videoPlayer stop];
		[videoPlayer.view removeFromSuperview];
		[self functiontosetvideo];
		
		}
    }
		//[videoPlayer stop];
}*/


////////////////////////////////////////////////////////////////////////////
//To go to  next video
///////////////////////////////////////////////////////////////////////////
-(void)overlayNxtButtonTouched:(UIControl*)sender
{
}
///////////////////////////////////////////////////////////////
	/*NSLog(@"videoNum%i",videoNum);
	if(touch==1)
	{
			if(videoNum<2)
	
	{
		videoNum++;
		[videoPlayer stop];
		[videoPlayer.view removeFromSuperview];
		[self functiontosetvideo];
			
		
		} 
	}
}*/
////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////
//When screen will from  full screen
////////////////////////////////////////////////////////////////////////////
- (void) playerWillFromFullScreen:(NSNotification*) aNotification
{
	videoPlayer = [aNotification object];
    [[NSNotificationCenter defaultCenter] 
	 removeObserver:self
	 name:MPMoviePlayerWillEnterFullscreenNotification
	 object:videoPlayer];
	
	touch=0;
	
	[videoPlayer.view addSubview:myview];
	
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1];
	if(landmode   ==   0)
	{
			frameOfAnimation						=   CGRectMake(0, 0, 768, 45);
			myview.frame							=  frameOfAnimation;
	}
	else 
	{
		   frameOfAnimation						=   CGRectMake(0, 0, 1024, 45);
		   myview.frame							=  frameOfAnimation;

	}

	[UIView commitAnimations];	
	myview.userInteractionEnabled=YES;
	
	if(timerFade!=nil)
	{
		//[timerFade invalidate];
		timerFade=nil;
	}
	timerFade								= [NSTimer new];
	timerFade								=	[NSTimer scheduledTimerWithTimeInterval:5.5 target:self selector:@selector(updateCounter:) userInfo:nil repeats:NO];
	
		
	//[overlayFrDoneButton removeFromSuperview];
	//overlayFrDoneButton =nil;
	
	[overlayFrBckButton removeFromSuperview];
	overlayFrBckButton =nil;
	
	[overlayNxtButton removeFromSuperview];
	overlayNxtButton =nil;
}

/*- (void)mediaPickerDidCancel:(MPMediaPickerController *)mediaPicker
{
	[self dismissModalViewControllerAnimated:YES];
	[mediaPicker release];
}
*/
-(void)ViewinLandscape
{
	/*int incInY   =   106;
	for(int i=0;i<[ arrayForText  count];i++)
	{
		UITextView *textView						=    [UITextView new];
		textView									=   [ arrayForText objectAtIndex:i];
		textView.frame								=    CGRectMake(370, incInY,400 ,150);
		incInY += 350;
		[textView   release];
	}*/
	videoPlayer.view.frame = CGRectMake(0, 0,1024, 748); 
	homeButton.frame   =   CGRectMake(926, 0.0, 103, 42);
	CGRect frameOfScroll						=	CGRectMake(0,90,1024, 748);
	scrollView.frame							=	frameOfScroll;
	[scrollView setContentSize:CGSizeMake(1024, 1150)];
}
-(void)ViewinPortrait
{
	videoPlayer.view.frame = CGRectMake(0, 0,768, 1000); 
	CGRect frameOfScroll						=	CGRectMake(0,42,768, 960);
	scrollView.frame							=	frameOfScroll;
	[scrollView setContentSize:CGSizeMake(684, 960)];
	
	homeButton.frame   =   CGRectMake(670, 0.0, 103, 42);
	//backGround.frame   =    CGRectMake(0.0, 0.0, 1024, 748);
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
	if ((interfaceOrientation == UIInterfaceOrientationLandscapeLeft) || (interfaceOrientation == UIInterfaceOrientationLandscapeRight))
	{
		landmode=1;
		portrMode=0;
		[self ViewinLandscape];
		
	}
	else 
	{
		landmode=0;
		portrMode=1;
		[self ViewinPortrait];
		
	}
   
    return YES;
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
	if(homeButton)
	{
	[homeButton				release];
	homeButton=nil;
	}
	if(videoURL)
	{
		[videoURL			release];
		videoURL=nil;
	}
	if(moviePlayerWindow)
	{
		[moviePlayerWindow	release];
		moviePlayerWindow=nil;
	}
	if(overlayFrDoneButton)
	{
		[overlayFrDoneButton release];
		overlayFrDoneButton=nil;
	}
	if(overlayFrBckButton)
	{
		[overlayFrBckButton	release];
		overlayFrBckButton=nil;
	}
	if(scrollView)
	{
		[scrollView			release];
		scrollView=nil;
	}	
	if(currentElementValue)
	{
		[currentElementValue release];
		currentElementValue=nil;
	}
	if(videoPlayer)
	{
		[videoPlayer		release];
		videoPlayer=nil;
	}
	
    [super dealloc];
}


@end
