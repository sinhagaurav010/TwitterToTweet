    //
//  CastViewController.m
//  ComiciPad
//
//  Created by CHROME INFOTECH  on 20/09/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CastViewController.h"
#import "Global.h"
#define LOGFLAG 1

@implementation CastViewController


- (CastViewController *) initXMLParser {
	
	//arrayForKey					=	[NSMutableArray new];
	[super init];
	//appDelegate				= (ComiciPadAppDelegate *)[[UIApplication sharedApplication] delegate];
	return self;
}


////////////////////////////////////////////////////////////////////////////
/////This function  is used to parse the Xml file
/////////////////////////////////////////////////////////////////
-(void)parsingofComiccastXmlfile
{
	NSString *filePath						= [[NSBundle mainBundle]pathForResource:@"XmlfilefrCast" ofType:@"xml"];
	NSString *fileContents					= [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
	NSData  *myData							= [fileContents dataUsingEncoding:NSUTF8StringEncoding];
	
	NSXMLParser *xmlParser					= [[NSXMLParser alloc] initWithData:myData];
	
	CastViewController *parser				=	[[CastViewController alloc] initXMLParser];// Used for ehat purpose
	[xmlParser setDelegate:parser];
	
	
	//	Start parsing the XML file.
	BOOL success							= [xmlParser parse];
	if(success)
		NSLog(@"No Errors");
	else
		NSLog(@"Error Error Error!!!");
	
	
	if (xmlParser) {
		[xmlParser release];
		xmlParser = nil;
	}
	
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName 
	attributes:(NSDictionary *)attributeDict {
	
	if([elementName isEqualToString:@"cast"]) {
		
	}
	
	else if([elementName isEqualToString:@"item"]) 
	{
		
	}	
	
	
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string 

{ 
	if(!currentElementValue) {
		
		currentElementValue				= [[NSMutableString alloc] initWithString:string];
	}
	
	
	else{
		
		[currentElementValue appendString:string];
		//if(LOGFLAG==1)
			//NSLog(@"string%@",string);
	}
	
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
	
	if([elementName isEqualToString:@"cast"]){
		return;
	}
	if([elementName isEqualToString:@"item"]) {
		
		[arrayOfDictionaryforcast	addObject:dictionayForXmlfilecast];
		dictionayForXmlfilecast	=	[NSMutableDictionary new];
		NSLog(@"----comic name---%@",arrayOfDictionaryforcast);
	}
	
	if([elementName isEqualToString:@"name"]){		
		[dictionayForXmlfilecast  setObject:[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:elementName];
		if(LOGFLAG==1)
			NSLog(@"comicname------------->>>%@",currentElementValue);
	}

	if([elementName isEqualToString:@"thumbnail"]){		
		[dictionayForXmlfilecast  setObject:[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:elementName];
		if(LOGFLAG==1)
			NSLog(@"comicname------------->>>%@",currentElementValue);
	}
	if([elementName isEqualToString:@"weapons"]){
		
		[dictionayForXmlfilecast  setObject:[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:elementName];
		if(LOGFLAG==1)
			NSLog(@"comicname------------->>>%@",currentElementValue);
	}
	if([elementName isEqualToString:@"specialpower"]){
		
		[dictionayForXmlfilecast  setObject:[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:elementName];
        if(LOGFLAG==1)
			NSLog(@"comicname------------->>>%@",currentElementValue);
	}
	
	if([elementName isEqualToString:@"placeoforigin"]){
		
		[dictionayForXmlfilecast  setObject:[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:elementName];
		if(LOGFLAG==1)
			NSLog(@"comicname------------->>>%@",currentElementValue);
	}
	
	if([elementName isEqualToString:@"discription"]){
		
		[dictionayForXmlfilecast  setObject:[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:elementName];
		if(LOGFLAG==1)
			NSLog(@"comicname------------->>>%@",currentElementValue);
	}
	else
	{
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
- (void)viewDidLoad {
	arrayOfDictionaryforcast					=	[NSMutableArray new];
	dictionayForXmlfilecast						=	[NSMutableDictionary new];
	
	[self parsingofComiccastXmlfile];
	
	NSLog(@"-------%@",arrayOfDictionaryforcast);
	
	
	CGRect frameOfbackGroundimage				=   CGRectMake(0, 0, 768, 1024);
	UIImageView *backGroundimage				=	[[UIImageView alloc] initWithFrame:frameOfbackGroundimage];
	backGroundimage.backgroundColor				=	[UIColor blackColor];
    [self.view addSubview:backGroundimage];
	
	
	homeButton									= [[UIButton alloc]initWithFrame:CGRectMake(670, 30, 103, 42)];
	[homeButton addTarget:self action:@selector(homeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
	[homeButton setTitle:@"HOME"  forState:(UIControlState)UIControlStateNormal];
	homeButton.font								= [UIFont boldSystemFontOfSize:25];
	[self.view addSubview:homeButton];
    
	
	UILabel *labelTitle							=	[[UILabel alloc]initWithFrame:CGRectMake(20,40, 398, 30)];
	labelTitle.text								=	@"Characters & Mythology";
	//labelTitle.text							=[titlestrng stringByAppendingFormat:[[arrayOfDictionaryforvideo objectAtIndex:i]objectForKey:@"title"]];	;
	labelTitle.textColor						= [UIColor whiteColor];
	labelTitle.backgroundColor					= [UIColor clearColor];
	labelTitle.font								= [UIFont boldSystemFontOfSize:25];
	[self.view addSubview:labelTitle];
    
	UILabel *labelExtra							=	[[UILabel alloc]initWithFrame:CGRectMake(20,132, 398, 30)];
	labelExtra.text								=	@"Wall Papers";
	//labelTitle.text							=[titlestrng stringByAppendingFormat:[[arrayOfDictionaryforvideo objectAtIndex:i]objectForKey:@"title"]];	;
	labelExtra.textColor						= [UIColor whiteColor];
	labelExtra.backgroundColor					= [UIColor clearColor];
	labelExtra.font								= [UIFont boldSystemFontOfSize:25];
	[self.view addSubview:labelExtra];
	

	scrollView									=	[UIScrollView new];
	CGRect frameOfScroll						=	CGRectMake(20,180,768, 960);
	scrollView.frame							=	frameOfScroll;
	[scrollView setContentSize:CGSizeMake(732,806 )];
	[self.view addSubview:scrollView];
	
	//CGRect frameOfScoll							=	[scrollView frame];
	int incIny									=	0;
	
	
	for(int i=0;i<[arrayOfDictionaryforcast count];i++)
	{
	UIImageView *imageforMaiLin					= [[UIImageView alloc]initWithFrame:CGRectMake(0,incIny,150,80)];
	NSString    *imageName						= [[arrayOfDictionaryforcast objectAtIndex:i]objectForKey:@"thumbnail"];
	imageforMaiLin.image						= [UIImage imageNamed:imageName];
	[scrollView addSubview:imageforMaiLin];
		
		UILabel *label							=	[[UILabel alloc]initWithFrame:CGRectMake(187,incIny, 398, 22)];
		label.text							    =[[arrayOfDictionaryforcast objectAtIndex:i]objectForKey:@"name"];	;
		label.textColor							= [UIColor whiteColor];
		label.backgroundColor					= [UIColor clearColor];
		label.font						    	= [UIFont fontWithName:@"Arial Rounded MT Bold" size:(20.0)];
		[scrollView addSubview:label];
		
       /////To set the label for episode
		UILabel *labelEps							=	[[UILabel alloc]initWithFrame:CGRectMake(187,incIny+20, 398, 22)];
		labelEps.text								=	@"Weapons:";
		//labelEps.text								=[episodstrng stringByAppendingFormat:[[arrayOfDictionaryforvideo objectAtIndex:i]objectForKey:@"episodenumber"]];	;
		labelEps.textColor							= [UIColor whiteColor];
		labelEps.backgroundColor					= [UIColor clearColor];
		labelEps.font								= [UIFont fontWithName:@"Arial Rounded MT Bold" size:(20.0)];
		[scrollView addSubview:labelEps];
		
		
		UILabel *labelEpsdetext						=	[[UILabel alloc]initWithFrame:CGRectMake(300,incIny+20, 398, 22)];
		labelEpsdetext.text							=[[arrayOfDictionaryforcast objectAtIndex:i]objectForKey:@"weapons"];	
		labelEpsdetext.textColor					= [UIColor whiteColor];
		labelEpsdetext.backgroundColor				= [UIColor clearColor];
		labelEpsdetext.font							= [UIFont boldSystemFontOfSize:17];
		[scrollView addSubview:labelEpsdetext];
		
		
		/////To set the label for title
		UILabel *labelTitle							=	[[UILabel alloc]initWithFrame:CGRectMake(187,incIny+40, 398,22 )];
		labelTitle.text								=	@"Special Power:";
		//labelTitle.text							=[titlestrng stringByAppendingFormat:[[arrayOfDictionaryforvideo objectAtIndex:i]objectForKey:@"title"]];	;
		labelTitle.textColor						= [UIColor whiteColor];
		labelTitle.backgroundColor					= [UIColor clearColor];
		labelTitle.font								= [UIFont fontWithName:@"Arial Rounded MT Bold" size:(20.0)];
		[scrollView addSubview:labelTitle];
		
		
		UILabel *labelTitleText						=	[[UILabel alloc]initWithFrame:CGRectMake(350,incIny+40, 398, 22)];
		labelTitleText.text							=[[arrayOfDictionaryforcast objectAtIndex:i]objectForKey:@"specialpower"];	
		labelTitleText.textColor					= [UIColor whiteColor];
		labelTitleText.backgroundColor				= [UIColor clearColor];
		labelTitleText.font							= [UIFont boldSystemFontOfSize:17];
		[scrollView addSubview:labelTitleText];
		
		UILabel *labelPlaceOfOrigin					=	[[UILabel alloc]initWithFrame:CGRectMake(187,incIny+60, 398,22 )];
		labelPlaceOfOrigin.text						=	@"Place of Origin:";
		//labelTitle.text							=[titlestrng stringByAppendingFormat:[[arrayOfDictionaryforvideo objectAtIndex:i]objectForKey:@"title"]];	;
		labelPlaceOfOrigin.textColor				= [UIColor whiteColor];
		labelPlaceOfOrigin.backgroundColor			= [UIColor clearColor];
		labelPlaceOfOrigin.font						= [UIFont fontWithName:@"Arial Rounded MT Bold" size:(20.0)];
		[scrollView addSubview:labelPlaceOfOrigin];
		
		
		UILabel *labelPlaceOfOrigindiscription		=	[[UILabel alloc]initWithFrame:CGRectMake(360,incIny+60, 398, 22)];
		labelPlaceOfOrigindiscription.text			=[[arrayOfDictionaryforcast objectAtIndex:i]objectForKey:@"placeoforigin"];	
		labelPlaceOfOrigindiscription.textColor		= [UIColor whiteColor];
		labelPlaceOfOrigindiscription.backgroundColor= [UIColor clearColor];
		labelPlaceOfOrigindiscription.font			= [UIFont boldSystemFontOfSize:17];
		[scrollView addSubview:labelPlaceOfOrigindiscription];
		
	
		UITextView *textView						= [[UITextView alloc] initWithFrame:CGRectMake(180, incIny+85, 522, 90)];
		textView.textColor							= [UIColor whiteColor];
		textView.font								= [UIFont fontWithName:@"Arial" size:17];
		//textView.delegate = self;
		textView.backgroundColor					= [UIColor clearColor];
		NSString	*discrptionstrng				=	@"Discription:";
		textView.text								=[discrptionstrng stringByAppendingFormat:[[arrayOfDictionaryforcast objectAtIndex:i]objectForKey:@"discription"]];
		[scrollView addSubview:textView];
		textView.editable=NO;
		
		incIny+=206;
		
		if(imageforMaiLin)
		{
			[imageforMaiLin  release];
			imageforMaiLin = nil;
		}
		if(label)
		{
			[label release];
			label  =  nil;
		}
		if (labelEps) 
		{
			[labelEps  release];
			labelEps   =  nil;
		}
		if (labelEpsdetext) 
		{
			[labelEpsdetext release];
			labelEpsdetext  =  nil;
		}
		if(labelTitle)
		{
			[labelTitle  release];
			labelTitle = nil;
		}
		if (labelTitleText) 
		{
			[labelTitleText  release];
			labelTitleText = nil;
		}
		if (labelPlaceOfOrigin)
		{
			[labelPlaceOfOrigin  release];
			labelPlaceOfOrigin  =  nil;
		}
		if (labelPlaceOfOrigindiscription) 
		{
			[labelPlaceOfOrigindiscription release];
			labelPlaceOfOrigindiscription = nil;
		}
		if (textView) 
		{
			[textView release];
			textView = nil;
		}
	}	
	if(backGroundimage)
	{
		[backGroundimage release];
		backGroundimage = nil;
	}
	if(labelTitle)
	{
		[labelTitle  release];
		labelTitle = nil;
	}
	if(labelExtra)
	{
		[labelExtra release];
		labelExtra = nil;
	}
	[super viewDidLoad];
}


//////////////If user want to go to home
-(IBAction)homeButtonClick:(id)sender
{
	//ComicViewController *obj			=	[ComicViewController new];
	//[self.navigationController pushViewController:obj animated:YES];
	[self.navigationController popViewControllerAnimated:YES];
}
//////////////////////////////////////////////////////////////////////////////////////////

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
	if (homeButton) 
	{
		[homeButton release];
		homeButton   =  nil;
	}
	if (currentElementValue) 
	{
		[currentElementValue  release];
		currentElementValue  =  nil;
	}
	if (scrollView)
	{
		[scrollView release];
		scrollView   =  nil;
	}
    [super dealloc];
}


@end
