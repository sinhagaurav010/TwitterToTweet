    //
//  WallpaperViewController.m
//  ComiciPad
//
//  Created by CHROME INFOTECH  on 22/09/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "WallpaperViewController.h"
#define   LOGFLAG 1

@implementation WallpaperViewController

- (WallpaperViewController *) initXMLParser {
	
	//arrayForKey					=	[NSMutableArray new];
	[super init];
	//appDelegate				= (ComiciPadAppDelegate *)[[UIApplication sharedApplication] delegate];
	return self;
}

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/
/////////////////////////////parsing of xml file start here
-(void)parsingofComicgalleryXmlfile
{	NSString *filePath					= [[NSBundle mainBundle]pathForResource:@"xmlFilefrWallpapers" ofType:@"xml"];
	NSString *fileContents				= [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
	NSData  *galleryXmlfileData			= [fileContents dataUsingEncoding:NSUTF8StringEncoding];
	
	NSXMLParser *xmlParser				= [[NSXMLParser alloc] initWithData:galleryXmlfileData];
	
	WallpaperViewController *parser		=	[[WallpaperViewController alloc] initXMLParser];// Used for ehat purpose
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
	
	if([elementName isEqualToString:@"wallpaper"]) {
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
	
	if([elementName isEqualToString:@"wallpaper"]){
		return;
	}
	
	
	if([elementName isEqualToString:@"image"]){
		
		[arrayOfImageGallery  addObject:[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]]] ;
		if(LOGFLAG==1)
			NSLog(@"comicname------------->>>%@",currentElementValue);
	}
	if([elementName isEqualToString:@"thumbnail"]){
		
		[arrayOfThumbGallery  addObject:[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]]] ;
		if(LOGFLAG==1)
			NSLog(@"comicname------------->>>%@",currentElementValue);
	}
	
	else {
	}
		 
	if(currentElementValue)
		 {
			 [currentElementValue release];
			 currentElementValue		= nil;
		 }
}
///////////////////////////////////////////////////////////////////////

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	arrayOfThumbGallery					=	[NSMutableArray new];
	arrayOfImageGallery					=	[NSMutableArray new];
	
	[self parsingofComicgalleryXmlfile];
	NSLog(@"arrayOfThumbGallery->%@",arrayOfThumbGallery);
	
	CGRect frameOfbackGroundImage		=   CGRectMake(0, 0, 768, 1024);
	UIImageView *backGroundImage		=	[[UIImageView alloc] initWithFrame:frameOfbackGroundImage];
	backGroundImage.backgroundColor		=	[UIColor blackColor];
    [self.view addSubview:backGroundImage];
	
	
	
	homeButton							= [[UIButton alloc]initWithFrame:CGRectMake(670, 30, 103, 42)];
	[homeButton addTarget:self action:@selector(homeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
	[homeButton setTitle:@"HOME"  forState:(UIControlState)UIControlStateNormal];
	homeButton.font						= [UIFont boldSystemFontOfSize:25];
	[self.view addSubview:homeButton];
    
	
	/*UIButton *Morebutton				= [[UIButton alloc]initWithFrame:CGRectMake(0,40, 103, 42)];
	[Morebutton addTarget:self action:@selector(homeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
	[Morebutton setTitle:@"More"  forState:(UIControlState)UIControlStateNormal];
	Morebutton.font						= [UIFont boldSystemFontOfSize:25];
	[self.view addSubview:Morebutton];
	*/

	UILabel *labelWallPaper				=	[[UILabel alloc]initWithFrame:CGRectMake(20,150, 398, 30)];
	labelWallPaper.text					=	@"Wall Papers";
	labelWallPaper.textColor			= [UIColor whiteColor];
	labelWallPaper.backgroundColor		= [UIColor clearColor];
	labelWallPaper.font					= [UIFont boldSystemFontOfSize:25];
	[self.view addSubview:labelWallPaper];
	
	UILabel *labelText				=	[[UILabel alloc]initWithFrame:CGRectMake(20,249, 760, 30)];
	labelText.text					=	@"Tap to select a wallpaper. To add an image to your photos, click the Save button";
	labelText.textColor				= [UIColor whiteColor];
	labelText.backgroundColor		= [UIColor clearColor];
	labelText.font					= [UIFont boldSystemFontOfSize:18];
	[self.view addSubview:labelText];
	
	UILabel *labelTxt				=	[[UILabel alloc]initWithFrame:CGRectMake(20,285, 760, 30)];
	labelTxt.text					=  @"the image to your camera roll.";
	labelTxt.textColor				= [UIColor whiteColor];
	labelTxt.backgroundColor		= [UIColor clearColor];
	labelTxt.font					= [UIFont boldSystemFontOfSize:18];
	[self.view addSubview:labelTxt];
	
	ComponentOfThumb					=[NSArray new];
	ComponentOfThumb					= [ [arrayOfThumbGallery objectAtIndex:0] componentsSeparatedByString:@","];
	
	ComponentOfImage					=[NSArray new];
	ComponentOfImage					= [ [arrayOfImageGallery objectAtIndex:0] componentsSeparatedByString:@","];
	mArrayFrFullImageinWallpaper=[NSMutableArray new];
	
	for(int i=0;i<[ComponentOfImage count];i++)
		[mArrayFrFullImageinWallpaper		addObject:[ComponentOfImage objectAtIndex:i]];
	int incInX	=	20;
	
	for(int i=0;i<[ComponentOfThumb count];i++)
	{
		UIButton *buttonForThumb				= [[UIButton alloc] initWithFrame: CGRectMake(incInX,325,184,250)];
		NSString *imageNameConceptart				=	[ComponentOfThumb objectAtIndex:i]	;
		[buttonForThumb setBackgroundImage:[UIImage imageNamed:imageNameConceptart] forState:UIControlStateNormal];
		[buttonForThumb addTarget:self action:@selector(clicktowatchfull:) forControlEvents:UIControlEventTouchUpInside];
		buttonForThumb.tag=i;
		[self.view addSubview:buttonForThumb];
		incInX+=272;
		if(buttonForThumb)
		{
			[buttonForThumb release];
			buttonForThumb = nil;
		}
	}
	if(backGroundImage)
	{
		[backGroundImage  release];
		backGroundImage = nil;
	}
	if(labelWallPaper)
	{
		[labelWallPaper release];
		labelWallPaper  =  nil;
	}
	if(labelText)
	{
		[labelText release];
		labelText  =  nil;
	}
	if(labelTxt)
	{
		[labelTxt  release];
		labelText  =  nil;
	}
    [super viewDidLoad];
}
////////////////////////////////////////////////////////


/////////////////////If user want to go to home
-(IBAction)homeButtonClick:(id)sender
{
	[self.navigationController popViewControllerAnimated:YES];
}



//////////////////////If user want to watch the full image 
-(IBAction)clicktowatchfull:(id)sender
{	
	imageNumClickInWallpaper		=		[sender tag];
	FullImageGalleryViewController *fullImageGalleryViewControllerObj			=	[FullImageGalleryViewController new];
	[self.navigationController pushViewController:fullImageGalleryViewControllerObj animated:YES];
	if(fullImageGalleryViewControllerObj)
	{
		[fullImageGalleryViewControllerObj release];
		fullImageGalleryViewControllerObj = nil;
	}
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
	if(homeButton)
	{
		[homeButton release];
		homeButton  =  nil;
	}
	if(currentElementValue)
	{
		[currentElementValue release];
		currentElementValue   =  nil;
	}
    [super dealloc];
}


@end
