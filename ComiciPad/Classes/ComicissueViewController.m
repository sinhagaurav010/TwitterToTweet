    //
//  ComicissueViewController.m
//  ComiciPad
//
//  Created by CHROME INFOTECH  on 06/09/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//  Email:gauravs@chromeinfotech

#import "ComicissueViewController.h"
#import "ComicViewController.h"
#import "InsidecomicsViewController.h"
#define  LOGFLAG  1
@implementation ComicissueViewController
- (ComicissueViewController *) initXMLParser {
	
		//arrayForKey					=	[NSMutableArray new];
	[super init];
	//appDelegate				= (ComiciPadAppDelegate *)[[UIApplication sharedApplication] delegate];
	return self;
}


////////////////////////////////////////////////////////////////////////////
/////This function  is used to parse the Xml file
/////////////////////////////////////////////////////////////////
-(void)parsingofComicXmlfile
{
	NSString *filePath					= [[NSBundle mainBundle]pathForResource:@"ComicXmlfile" ofType:@"xml"];
	NSString *fileContents				= [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
	NSData  *comicXmlfileData						= [fileContents dataUsingEncoding:NSUTF8StringEncoding];
	
	NSXMLParser *xmlParser				= [[NSXMLParser alloc] initWithData:comicXmlfileData];
		
	ComicissueViewController *parser	=	[[ComicissueViewController alloc] initXMLParser];// Used for ehat purpose
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
		if(LOGFLAG == 1)
		NSLog(@"string%@",string);
	}
	
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
	
	if([elementName isEqualToString:@"comic"]){
		return;
	}
	
	if([elementName isEqualToString:@"item"]) {
		
		[arrayOfDictionary	addObject:dictionayForXmlfile];
		dictionayForXmlfile	=	[NSMutableDictionary new];
		
	}
	
	if([elementName isEqualToString:@"thumbnail"]){
		
		[dictionayForXmlfile  setObject:[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:elementName];
       if(LOGFLAG == 1)
		NSLog(@"comicname------------->>>%@",currentElementValue);
	}
	
	if([elementName isEqualToString:@"comicname"]){
				
		[dictionayForXmlfile  setObject:[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:elementName];
       if(LOGFLAG == 1)
		NSLog(@"comicname------------->>>%@",currentElementValue);
		}
	
	
	if([elementName isEqualToString:@"coverpage"]){
		
		[dictionayForXmlfile  setObject:[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:elementName];
		
		if(LOGFLAG == 1)
		NSLog(@"elementname---------->>>%@",currentElementValue);
	}
	
	if([elementName isEqualToString:@"advpage"]){
		
		[dictionayForXmlfile  setObject:[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:elementName];
		if(LOGFLAG == 1)
		NSLog(@"elementname---------->>%@",currentElementValue);		
	}
	
	
	if([elementName isEqualToString:@"storypages"]){
		 [dictionayForXmlfile  setObject:[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:elementName];
		if(LOGFLAG == 1)
		NSLog(@"elementname--------->>>%@",currentElementValue);	
    }
	
		
	else
	{
	}
	
	if(currentElementValue != nil)
	{
	[currentElementValue release];
	currentElementValue	= nil;
	}
}
/////////////////////////////////////////////////////////////////////////
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
	
	dictionayForXmlfile						=	[NSMutableDictionary new];
	arrayForKey								=	[NSMutableArray new];
	arrayOfDictionary						=	[NSMutableArray new];
	[self parsingofComicXmlfile];
	
	int numOfComics							=	0;
	
	CGRect frameOfbackGroundimage			=   CGRectMake(0, 0, 768, 1024);
	UIImageView *backGroundimage			=	[[UIImageView alloc] initWithFrame:frameOfbackGroundimage];
	backGroundimage.backgroundColor			=	[UIColor blackColor];
    [self.view addSubview:backGroundimage];
	
	
	
	UIScrollView *scrollView				=	[UIScrollView new];
	CGRect frameOfScroll					=	CGRectMake(16,40, 729, 918);
	scrollView.frame						=	frameOfScroll;
	[self.view addSubview:scrollView];
	
	
	UIButton * homebutton					= [[UIButton alloc]initWithFrame:CGRectMake(670, 25.0, 103, 42)];
	
	[self.view addSubview:homebutton];
	
	/////////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////////////////
	/*
	//NSInteger  numOfRow						=(int)([arrayOfDictionary count]/3);
	NSInteger  numOfRow						=(int)(10/3);
	CGRect frameOfcomics	;		
	//frameOfcomics.origin.x	=	frameOfScroll.origin.x;
	frameOfcomics.origin.y	=	frameOfScroll.origin.y;
	for(int row=0;row<numOfRow;row++)
	{
		//CGRect frameOfcomics			=	[scrollView frame];
		//frameOfcomics.origin.x			+=column*243;
		//frameOfcomics.origin.y			+=306;
		NSLog(@"frameOfcomics.origin.y	%f",frameOfcomics.origin.y	);
		//frameOfcomics.size.width		=230;
		//frameOfcomics.size.height		=293;
		frameOfcomics.origin.x	=	frameOfScroll.origin.x;
		
		for(int column=0;column<3;column++)
		{
			
			//frameOfcomics.origin.x			=frameOfcomics.origin.x	+243;
			NSLog(@"frameOfcomics.originx	%f",frameOfcomics.origin.x	);
			/*CGRect frameOfcomics			=	[scrollView frame];
			 
			frameOfcomics.origin.x			+=column*243;
			frameOfcomics.origin.y			+=row*306;
			frameOfcomics.size.width		=230;
			frameOfcomics.size.height		=293;
			*/
			/*
			UIImageView *comics		        =	[[UIImageView alloc] initWithFrame:frameOfcomics];
			comics.image = [UIImage imageNamed:@"shippedposter123.jpg"];
			[comics addTarget:ComicissueViewController action:@selector(myAction:) forControlEvents:UIControlEventTouchUpInside];
			[myScroll addSubview: comics];  */
			
			/*UIButton  *myButton				= [UIButton buttonWithType:UIButtonTypeCustom];
			[myButton setImage:[UIImage imageNamed:@"shippedposter123.jpg"] forState:UIControlStateNormal];
			myButton.frame	=frameOfcomics;
			[myButton addTarget:self action:@selector(myAction:) forControlEvents:UIControlEventTouchUpInside];
			[myScroll addSubview:myButton];*/
			
			//////////////////////////////////////////////////////////
			////Make button for the comics
			//////////////////////////////////////////////////////////
		/*	
			UIButton *buttonForComics		= [[UIButton alloc] initWithFrame: CGRectMake(frameOfcomics.origin.x,frameOfcomics.origin.y,230,293)];
		//	NSString    *imageName			=	[[arrayOfDictionary objectAtIndex:numOfComics]objectForKey:@"coverpage"];
		//	[buttonForComics setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
			NSString    *imageName			=	@"WS_Ad.jpg";
			[buttonForComics setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];

			[buttonForComics addTarget:self action:@selector(myAction:) forControlEvents:UIControlEventTouchUpInside];
			buttonForComics.tag						=numOfComics;
			
			
			[scrollView addSubview:buttonForComics];
			
			
		/*	if(numOfComics==[arrayOfDictionary count])
				break;
			else {
				numOfComics++;
			
			//}
	
	
			frameOfcomics.origin.x			=frameOfcomics.origin.x	+243;
		  }
    frameOfcomics.origin.y			=  frameOfcomics.origin.y+306;
	}*/
	
///////////////////////////////////////////////////////////////////////////////////////////
	
	
	NSInteger  numOfRow						=(int)([arrayOfDictionary count]/3);
	CGRect frameOfcomics;
	
	frameOfcomics.origin.y					=	frameOfScroll.origin.y;
		//frameOfcomics.origin.y					=	0.0;
	
	for(int row = 0;row < numOfRow;row++)
	{		
		frameOfcomics.origin.x	=	frameOfScroll.origin.x;
		
		for(int column=0;column<3;column++)
		{
			////Make button for the comics
			 UIButton *buttonForComics		= [[UIButton alloc] initWithFrame: CGRectMake(frameOfcomics.origin.x,frameOfcomics.origin.y,221,292)];
			 NSString    *imageName			=	[[arrayOfDictionary objectAtIndex:numOfComics]objectForKey:@"thumbnail"];
			 [buttonForComics setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
			 [buttonForComics addTarget:self action:@selector(myAction:) forControlEvents:UIControlEventTouchUpInside];
			 buttonForComics.tag			=  numOfComics;
			 
			 [scrollView addSubview:buttonForComics];
			 
			 	if(numOfComics==[arrayOfDictionary count])
					break;
				else
				{
					numOfComics++;
				}
			 
			 frameOfcomics.origin.x			=frameOfcomics.origin.x	+243;
				if(buttonForComics)
				{
					[buttonForComics release];
					buttonForComics=nil;
				}
			
			}
			 frameOfcomics.origin.y			=  frameOfcomics.origin.y+306;
	}
	
	if(backGroundimage)
	{
	[backGroundimage release];
	backGroundimage=nil;
	}
	
	if(scrollView)
	{
		[scrollView release];
		scrollView=nil;
	}
	
	if(homebutton)
	{
		[homebutton release];
		homebutton=nil;
	}	
	
	[super viewDidLoad];
}


///////////////////////////////////////////////////////////
//When there is click on the comics 
/////////////////////////////////////////////////////
-(IBAction)myAction:(id)sender{

	if(LOGFLAG == 1)
	NSLog(@"arrayForKey----->>>%i%@",[sender tag],[arrayOfDictionary objectAtIndex:[sender tag]]);
	comicsNum								=		[sender tag];
	
	if ([[NSUserDefaults standardUserDefaults]objectForKey:[NSString stringWithFormat:@"%i",comicsNum]]){
	UIAlertView *alert						= [[UIAlertView alloc] initWithTitle:@"info" message:@"Would you like to resume from saved bookmark?"delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
	[alert show];
		if(alert)
		{
			[alert release];
			alert=nil;
		}
	}
	else{
		resume=0;
		InsidecomicsViewController	*insidecomicsViewControlleobj		=	[InsidecomicsViewController new];
		[self.navigationController pushViewController:insidecomicsViewControlleobj animated:YES];
		if(insidecomicsViewControlleobj)
		{
			[insidecomicsViewControlleobj release];
			insidecomicsViewControlleobj = nil;
		}
	}
	
}
////////////////////////////////////////////////////////////
/*
-(void)functionToResume
{
	if ([[NSUserDefaults standardUserDefaults]objectForKey:[NSString stringWithFormat:@"%i",comicsNum]])
	{
		selectBookmark = [[NSUserDefaults standardUserDefaults] integerForKey:[NSString stringWithFormat:@"%i",comicsNum]];
		resume				=1;
		if(LOGFLAG==1)
			NSLog(@"selectBookmark-->%i",selectBookmark);
		
		//touch=selectBookmark;
	}else {
		resume		=	0;
	}
}
*/
//////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
//This function is called when user want to go back
/////////////////////////////////////////////////////////////////////
-(void)functionToInsidecomicsViewController
{
	InsidecomicsViewController	*insidecomicsViewControlleobj		=	[InsidecomicsViewController new];
	[self.navigationController pushViewController:insidecomicsViewControlleobj animated:YES];
	if(insidecomicsViewControlleobj)
	{
		[insidecomicsViewControlleobj release];
		insidecomicsViewControlleobj=nil;
	}

}

///////////////////////////////////////////////////////////////////////
//This alert view  gives option to user that either user want to resume 
///or open from starting page
///////////////////////////////////////////////////////////////////
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex { 
	switch(buttonIndex) {
		case 0:
			//cancel
			resume		=	0;
			[[NSUserDefaults standardUserDefaults] removeObjectForKey:[NSString stringWithFormat:@"%i",comicsNum]]; 
			[self functionToInsidecomicsViewController]	;
			break;
		case 1:
			resume		=	1;
			selectBookmark = [[NSUserDefaults standardUserDefaults] integerForKey:[NSString stringWithFormat:@"%i",comicsNum]];
			[self functionToInsidecomicsViewController]	;
			break;
		default:
			break;
	}
}

//////////////////////////////////////
//When home button is clicked
////////////////////////////////////
-(IBAction)homeButtonClick:(id)sender
{
	//ComicViewController *obj				=	[ComicViewController new];
	[self.navigationController popToRootViewControllerAnimated:YES];
}

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
	if(home_Button)
	{
	[home_Button  release];
	home_Button = nil;
	}
	if(currentElementValue)
	{
		[currentElementValue  release];
		currentElementValue = nil;
	}
	if(appDelegate)
	{
		[appDelegate  release];
		appDelegate = nil;
	}
	if(arrayForXmlfile)
	{
		[arrayForXmlfile  release];
		arrayForXmlfile = nil;
	}
	
    [super dealloc];
}


@end
