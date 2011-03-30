    //
//  GalleryViewController.m
//  ComiciPad
//
//  Created by CHROME INFOTECH  on 20/09/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GalleryViewController.h"
#define LOGFLAG 1


@implementation GalleryViewController

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

- (GalleryViewController *) initXMLParser {
	
	//arrayForKey					=	[NSMutableArray new];
	[super init];
	//appDelegate				= (ComiciPadAppDelegate *)[[UIApplication sharedApplication] delegate];
	return self;
}


////////////////////////////////////////////////////////////////////////////
/////This function  is used to parse the Xml file
/////////////////////////////////////////////////////////////////



-(void)parsingofComicGalleryXmlfile
{
	arrayOfConceptart					=[NSMutableArray new];
	arrayOfConceptartthumbs				=[NSMutableArray new];
	arrayOfProductionart				=[NSMutableArray new];
	arrayOfProductionartThumb			=[NSMutableArray new];
	arrayOfPromoart						=[NSMutableArray new];
	arrayOfPromoartThumb				=[NSMutableArray new];
	
	
	NSString *filePath					= [[NSBundle mainBundle]pathForResource:@"Xmlfilefrgallery" ofType:@"xml"];
	NSString *fileContents				= [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
	NSData  *galleryXmlfileData			= [fileContents dataUsingEncoding:NSUTF8StringEncoding];
	
	NSXMLParser *xmlParser				= [[NSXMLParser alloc] initWithData:galleryXmlfileData];
	
	GalleryViewController *parser	=	[[GalleryViewController alloc] initXMLParser];// Used for ehat purpose
	[xmlParser setDelegate:parser];
	
	
	//	Start parsing the XML file.
	BOOL success						= [xmlParser parse];
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
	
	if([elementName isEqualToString:@"gallery"]) {
		
	}
	
/*	else if([elementName isEqualToString:@"item"]) 
	{
		
	}	
*/	
	
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
	
	if([elementName isEqualToString:@"gallery"]){
		return;
	}
	/*if([elementName isEqualToString:@"conceptart"]) {
		
		[arrayOfDictionaryforvideo	addObject:dictionayForXmlfilevideo];
		dictionayForXmlfilevideo	=	[NSMutableDictionary new];
		
	}*/
	
	if([elementName isEqualToString:@"conceptart"]){
		
		[arrayOfConceptart  addObject:[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]]] ;
		if(LOGFLAG==1)
			NSLog(@"comicname------------->>>%@",currentElementValue);
	}
	if([elementName isEqualToString:@"conceptthumbs"]){
		
		[arrayOfConceptartthumbs addObject:[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]]] ;
		if(LOGFLAG==1)
			NSLog(@"comicname------------->>>%@",currentElementValue);
	}
	if([elementName isEqualToString:@"productionart"]){
		
		[arrayOfProductionart  addObject:[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]]] ;
        if(LOGFLAG==1)
			NSLog(@"comicname------------->>>%@",currentElementValue);
	}
	
	if([elementName isEqualToString:@"productionthumbs"]){
		
		[arrayOfProductionartThumb addObject:[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]] ];
		if(LOGFLAG==1)
			NSLog(@"comicname------------->>>%@",currentElementValue);
	}
	
	if([elementName isEqualToString:@"promoart"]){
		
		[arrayOfPromoart  addObject:[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]]] ;
		if(LOGFLAG==1)
			NSLog(@"comicname------------->>>%@",currentElementValue);
	}
	
	
	if([elementName isEqualToString:@"promothumbs"]){
		
		[arrayOfPromoartThumb  addObject:[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]]] ;
		if(LOGFLAG==1)
			NSLog(@"elementname---------->>>%@",currentElementValue);
	}
	else {
	}
	
	if(currentElementValue)
	{
	[currentElementValue release];
	currentElementValue							= nil;
	}
}
//////////////////////////////////////////

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	[self parsingofComicGalleryXmlfile];
	
	ComponentOfConceptart						=[NSArray new];
	ComponentOfConceptart						= [ [arrayOfConceptart objectAtIndex:0] componentsSeparatedByString:@","];
	
	ComponentOfPromoart							=[NSArray new];
	ComponentOfPromoart							= [ [arrayOfPromoart objectAtIndex:0] componentsSeparatedByString:@","];
	
	ComponentOfPromoartThumb					=[NSArray new];
	ComponentOfPromoartThumb					= [ [arrayOfPromoartThumb objectAtIndex:0] componentsSeparatedByString:@","];
	
	ComponentOfProductionart					=[NSArray new];
	ComponentOfProductionart					= [ [arrayOfProductionart objectAtIndex:0] componentsSeparatedByString:@","];
	
	ComponentOfProductionartThumb				=[NSArray new];
	ComponentOfProductionartThumb				= [ [arrayOfProductionartThumb objectAtIndex:0] componentsSeparatedByString:@","];
	
	ComponentOfConceptartThumb					=[NSArray new];
	ComponentOfConceptartThumb					= [ [arrayOfConceptartthumbs objectAtIndex:0] componentsSeparatedByString:@","];

	mArrayFrConceptArt							=[NSMutableArray new];
	for(int i=0;i<[ComponentOfConceptart count];i++)
		[mArrayFrConceptArt addObject:[ComponentOfConceptart objectAtIndex:i]];

	mArrayFrProductionArt						=[NSMutableArray new];
	for(int i=0;i<[ComponentOfProductionart count];i++)
		[mArrayFrProductionArt addObject:[ComponentOfProductionart objectAtIndex:i]];
	
	
	mArrayFrPromoArt							=[NSMutableArray new];
	for(int i=0;i<[ComponentOfPromoart count];i++)
	[mArrayFrPromoArt addObject:[ComponentOfPromoart objectAtIndex:i]];
	
	for(int i=0;i<[ComponentOfPromoart count];i++)
		NSLog(@"34323!-%@",[ComponentOfPromoart objectAtIndex:i]);

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
	labelTitle.text								=	@"Gallery";
	//labelTitle.text							=[titlestrng stringByAppendingFormat:[[arrayOfDictionaryforvideo objectAtIndex:i]objectForKey:@"title"]];	;
	labelTitle.textColor						= [UIColor whiteColor];
	labelTitle.backgroundColor					= [UIColor clearColor];
	labelTitle.font								= [UIFont boldSystemFontOfSize:25];
	[self.view addSubview:labelTitle];
    
	
	
	UILabel *labelExtra							=	[[UILabel alloc]initWithFrame:CGRectMake(20,232, 398, 30)];
	labelExtra.text								=	@"Wall Papers";
	//labelTitle.text							=[titlestrng stringByAppendingFormat:[[arrayOfDictionaryforvideo objectAtIndex:i]objectForKey:@"title"]];	;
	labelExtra.textColor						= [UIColor whiteColor];
	labelExtra.backgroundColor					= [UIColor clearColor];
	labelExtra.font								= [UIFont boldSystemFontOfSize:25];
	[self.view addSubview:labelExtra];
	
	
	/////To set the scroll view
	int WidthOfScrllForConceptart				=[ComponentOfConceptartThumb count]*165+20;
	UIScrollView *scrollViewForConceptart	    =	[UIScrollView new];
	CGRect frameOfScroll						=	CGRectMake(20,280,768,90);
	scrollViewForConceptart.frame				=	frameOfScroll;
	scrollViewForConceptart.contentSize			=CGSizeMake(WidthOfScrllForConceptart,80);
	//[scrollView setContentSize:CGRectMake(20,180,WidthOfScrll,80)];
	[self.view addSubview:scrollViewForConceptart];
	
	
	
	int incInX=0;
	for(int i=0;i<[ComponentOfConceptartThumb count];i++)
	{
	UIButton *buttonForConceptart				= [[UIButton alloc] initWithFrame: CGRectMake(incInX,0,150,80)];
	NSString *imageNameConceptart				=	[ComponentOfConceptartThumb objectAtIndex:i]	;
	[buttonForConceptart setBackgroundImage:[UIImage imageNamed:imageNameConceptart] forState:UIControlStateNormal];
	[buttonForConceptart addTarget:self action:@selector(getintoConcept:) forControlEvents:UIControlEventTouchUpInside];
	buttonForConceptart.tag=i;
		[scrollViewForConceptart addSubview:buttonForConceptart];
	incInX+=165;
		if(buttonForConceptart)
		{
			[buttonForConceptart release];
			buttonForConceptart = nil;
		}
	}
    
	
	
	UILabel *labelProductionart					=	[[UILabel alloc]initWithFrame:CGRectMake(20,460, 398, 30)];
	labelProductionart.text						=	@"Production Art";
	//labelTitle.text							=[titlestrng stringByAppendingFormat:[[arrayOfDictionaryforvideo objectAtIndex:i]objectForKey:@"title"]];	;
	labelProductionart.textColor				= [UIColor whiteColor];
	labelProductionart.backgroundColor			= [UIColor clearColor];
	labelProductionart.font						= [UIFont boldSystemFontOfSize:25];
	[self.view addSubview:labelProductionart];
	if(labelProductionart)
	{
		[labelProductionart release];
		labelProductionart = nil;
	}
	
	
	int WidthOfScrllForProduction				=[ComponentOfProductionartThumb count]*165+20;
	UIScrollView *scrollViewForProductionart	=	[UIScrollView new];
	CGRect frameOfScrollProduction				=	CGRectMake(20,510,768,90);
	scrollViewForProductionart.frame		    =	frameOfScrollProduction;
	scrollViewForProductionart.contentSize		=CGSizeMake(WidthOfScrllForProduction,80);
	[self.view addSubview:scrollViewForProductionart];
	
	
	
	 incInX=0;
	for(int i=0;i<[ComponentOfProductionartThumb count];i++)
	{
		UIButton *buttonForProduction			= [[UIButton alloc] initWithFrame: CGRectMake(incInX,0,150,80)];
		NSString *imageNameConceptart			=	[ComponentOfProductionartThumb objectAtIndex:i]	;
		[buttonForProduction setBackgroundImage:[UIImage imageNamed:imageNameConceptart] forState:UIControlStateNormal];
		[buttonForProduction addTarget:self action:@selector(getintoProduction:) forControlEvents:UIControlEventTouchUpInside];
		buttonForProduction.tag=i;
		[scrollViewForProductionart addSubview:buttonForProduction];
		incInX+=165;
		if(buttonForProduction)
		{
			[buttonForProduction release];
			buttonForProduction = nil;
		}
		
	}
	
	
	
	UILabel *labelpromonart					    =	[[UILabel alloc]initWithFrame:CGRectMake(20,690, 398, 30)];
	labelpromonart.text							=	@"Promo Art";
	//labelTitle.text							=[titlestrng stringByAppendingFormat:[[arrayOfDictionaryforvideo objectAtIndex:i]objectForKey:@"title"]];	;
	labelpromonart.textColor					= [UIColor whiteColor];
	labelpromonart.backgroundColor				= [UIColor clearColor];
	labelpromonart.font							= [UIFont boldSystemFontOfSize:25];
	[self.view addSubview:labelpromonart];
	if(labelpromonart)
	{
		[labelpromonart release];
		labelpromonart = nil;
	}
	
	
	int WidthOfScrllForPromo					= [ComponentOfPromoartThumb count]*165+20;
	UIScrollView *scrollViewForPromoart			=	[UIScrollView new];
	CGRect frameOfScrollPromo					=	CGRectMake(20,740,768,90);
	scrollViewForPromoart.frame					=	frameOfScrollPromo;
	scrollViewForPromoart.contentSize						=CGSizeMake(WidthOfScrllForPromo,80);
	//[scrollView setContentSize:CGRectMake(20,180,WidthOfScrll,80)];
	[self.view addSubview:scrollViewForPromoart];
	
	
	
	incInX=0;
	for(int i=0;i<[ComponentOfPromoartThumb count];i++)
	{
		UIButton *buttonForPromo				= [[UIButton alloc] initWithFrame: CGRectMake(incInX,0,150,80)];
		NSString *imageNamepromo				=	[ComponentOfPromoartThumb objectAtIndex:i]	;
		[buttonForPromo setBackgroundImage:[UIImage imageNamed:imageNamepromo] forState:UIControlStateNormal];
		[buttonForPromo addTarget:self action:@selector(getintoPromoart:) forControlEvents:UIControlEventTouchUpInside];
		buttonForPromo.tag=i;
		[scrollViewForPromoart addSubview:buttonForPromo];
		incInX+=165;
		if(buttonForPromo)
		{
		    [buttonForPromo release];
			buttonForPromo = nil;
		}
	}
	
	if(scrollViewForProductionart)
	{
		[scrollViewForProductionart release];
		scrollViewForProductionart = nil;
	}
	if(scrollViewForPromoart)
	{
		[scrollViewForPromoart release];
		scrollViewForPromoart = nil;
	}
	if(backGroundimage)
	{
		[backGroundimage  release];
		backGroundimage = nil;
	}
	if(labelTitle)
	{
		[labelTitle  release];
		labelTitle = nil;
	}
	if(labelExtra)
	{
		[labelExtra  release];
		labelExtra = nil;
	}  
	if(scrollViewForConceptart)
	{
		[scrollViewForConceptart  release];
		scrollViewForConceptart = nil;
	} 
	
	[super viewDidLoad];
}


////////////////To watch the full  image of the promo art
-(IBAction)getintoPromoart:(id )sender
{
	artNum=0;
	imageNumOfPromoart=[sender tag];
	FullImgeViewController		*fullImgeViewControllerObj	=	[FullImgeViewController new];
	[self.navigationController pushViewController:fullImgeViewControllerObj animated:YES];
	if(fullImgeViewControllerObj)
	{
		[fullImgeViewControllerObj release];
		fullImgeViewControllerObj =  nil;
	}
}
/////////////////////////////////////////////////////////////

////////////////To watch the full  image of the Production art
-(IBAction)getintoProduction:(id )sender
{
	artNum=1;
	imageNumOfProductionart=[sender tag];
	FullImgeViewController		*fullImgeViewControllerObj	=	[FullImgeViewController new];
	[self.navigationController pushViewController:fullImgeViewControllerObj animated:YES];
	if(fullImgeViewControllerObj)
	{
		[fullImgeViewControllerObj release];
		fullImgeViewControllerObj = nil;
	}	
}
/////////////////////////////////////////////////////////////

////////////////To watch the full  image of the Concept art
-(IBAction)getintoConcept:(id )sender
{
	artNum=2;
	imageNumOfConceptart=[sender tag];
	NSLog(@"promo%i",imageNumOfConceptart);
	FullImgeViewController		*fullImgeViewControllerObj	=	[FullImgeViewController new];
	[self.navigationController pushViewController:fullImgeViewControllerObj animated:YES];
	if(fullImgeViewControllerObj)
	{
		[fullImgeViewControllerObj release];
		fullImgeViewControllerObj = nil;
	}
}
/////////////////////////////////////////////////////////////

////////////If  user want to go to home
-(IBAction)homeButtonClick:(id)sender
{
	[self.navigationController popViewControllerAnimated:YES];
}
/////////////////////////////////////////////////////////////

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
	
	
	if(currentElementValue)
	{
		[currentElementValue  release];
		currentElementValue  =  nil;
	}
	/*if(ComponentOfConceptart)
	{
		[ComponentOfConceptart  release];
		//ComponentOfConceptart  =  nil;
	}
	/*if(ComponentOfConceptartThumb)
	{
		[ComponentOfConceptartThumb  release];
		ComponentOfConceptartThumb  =  nil;
	}
	if(ComponentOfProductionart)
	{
		[ComponentOfProductionart  release];
		ComponentOfProductionart  =  nil;
	}
	if(ComponentOfProductionartThumb)
	{
		[ComponentOfProductionartThumb  release];
		ComponentOfProductionartThumb  =  nil;
	}
	
	if(ComponentOfPromoart)
	{
		[ComponentOfPromoart  release];
		ComponentOfPromoart  =  nil;
	}
	if(ComponentOfPromoartThumb)
	{
		[ComponentOfPromoartThumb  release];
		ComponentOfPromoartThumb  =  nil;
	}*/
    [super dealloc];
}


@end
