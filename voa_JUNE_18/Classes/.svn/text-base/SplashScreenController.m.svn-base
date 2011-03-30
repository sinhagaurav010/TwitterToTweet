//
//  SplashScreenController.m
//  VOA
//
//  Created by Dharmendra Singh Kushwaha on 29/04/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SplashScreenController.h"


@implementation SplashScreenController


 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
		
		monthNameArray = [[NSMutableArray alloc]init];
		monthFullNameArray = [[NSMutableArray alloc]init];
    }
    return self;
}

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	
	[self.navigationController setNavigationBarHidden:YES];//Used to hide the navigation bar
	
	//----------Main Image of splash screen-----------------------
	UIImageView *splashImage = [[UIImageView alloc]initWithFrame:CGRectMake(0.0,0.0 ,self.view.bounds.size.width, self.view.bounds.size.height)];
	[splashImage setImage:[UIImage imageNamed:@"splash.png"]];
	[splashImage setBackgroundColor:[UIColor grayColor]];
	[self.view addSubview:splashImage];
	[splashImage release];
	
	spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
	[spinner setCenter:CGPointMake(155.0, 287)]; 
	[self.view addSubview:spinner];
	[spinner startAnimating];
	
	hasConnection = [self connectedToWeb];
	[super viewDidLoad];

	if (hasConnection) {
		autoTimer = [NSTimer scheduledTimerWithTimeInterval:0.0 target:self selector:@selector(timerMainMenu:) userInfo:nil repeats:NO];
	}else {
		[spinner stopAnimating];
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Connection Failed" message:@"Please check your internet connection"
													   delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
		[alert show];
		[alert release];
	}

	
	

}

//After three this code will be executed
- (void) timerMainMenu : (id)sender
{	
	if (hasConnection) {

	mydata = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://voaonline.redfive-labs.biz/monthdata.aspx"]];
	
	//mydata = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://121.245.233.73/Http%20Responce/Responce.php"]];
	NSString *theXML = [[NSString alloc] initWithData:mydata encoding:NSASCIIStringEncoding];//NSASCIIStringEncoding];

	if (DEBUG ==1) NSLog(@"theXML =%@ mydata =%@  ",theXML,mydata);
	
	if (mydata.length != 0) {
		
		[self XMLParsingStart];
		
		MainMenuController *my_MainMenuController = [[MainMenuController alloc]init];
		[[self navigationController] pushViewController:my_MainMenuController animated:YES];
		[my_MainMenuController release]; 
		
		[spinner stopAnimating];

	}
	
	}else {
		[spinner stopAnimating];
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Connection Failed" message:@"Please check your internet connection"
													   delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
		[alert show];
		[alert release];
	}

}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//Start parser
-(void)XMLParsingStart
{
	
	//Initialize the various aray that kept the events data
	eventsArray					= [[NSMutableArray alloc]init];
	eventsDateArray				= [[NSMutableArray alloc]init];
	eventsDayArray				= [[NSMutableArray alloc]init];
	
	//Start Parsing
	xmlParser = [[NSXMLParser alloc] initWithData:mydata];
	xmlParser.delegate=self;
	[xmlParser setShouldResolveExternalEntities: YES];
	[xmlParser parse];
	[mydata release];
	
	
	

	
}
//Touch event used to rdirect another screen
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event  {
	
	if ((mydata.length != 0) &&(hasConnection != FALSE)) {
		
		MainMenuController *my_MainMenuController = [[MainMenuController alloc]init];
		[[self navigationController] pushViewController:my_MainMenuController animated:YES];
		[my_MainMenuController release]; 
		
		[spinner stopAnimating];

	}
	else {
		[spinner stopAnimating];
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Connection Failed" message:@"Please check your internet connection"
													   delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
		[alert show];
		[alert release];
	}
	
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Function used to check the network cinnectivity
-(BOOL)connectedToWeb{
	BOOL connected;
	const char *host = "www.apple.com";
	SCNetworkReachabilityRef reachability = SCNetworkReachabilityCreateWithName(NULL, host);
	SCNetworkReachabilityFlags flags;
	connected = SCNetworkReachabilityGetFlags(reachability, &flags);
	BOOL isConnected = connected && (flags & kSCNetworkFlagsReachable) && !(flags & kSCNetworkFlagsConnectionRequired);
	CFRelease(reachability);
	return isConnected;
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//Delegate Function of NSParser

#pragma mark - Delegate method of XMLParser
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *) qualifiedName attributes:(NSDictionary *)attributeDict
{
	//NSLog(@"didStartElement");
	
	if( [elementName isEqualToString:@"CurrentMonth"])
	{
			currentMonth_Month	= [[NSMutableString alloc]init];
			currentMonth_Year	= [[NSMutableString alloc]init];
			CurrentMonth = 1;
			return;
	}
	
	
	if( [elementName isEqualToString:@"NextMonth"])
	{
			nextMonth_Month		= [[NSMutableString alloc]init];
			nextMonth_Year		= [[NSMutableString alloc]init];
			NextMonth = 1;
			return;
	}
	
		
	if( [elementName isEqualToString:@"PreviousMonth"])
	{
			previousMonth_Month	= [[NSMutableString alloc]init];
			previousMonth_Year	= [[NSMutableString alloc]init];
			PreviousMonth = 1;
			return;
	}
	
	if( [elementName isEqualToString:@"Month"])
	{
		NSString *monthName = [[NSString alloc]initWithFormat:@"%@",[attributeDict objectForKey:@"Name"]];
		[monthNameArray addObject:monthName];
		[monthName release];
		
		NSString *monthFullName = [[NSString alloc]initWithFormat:@"%@",[attributeDict objectForKey:@"FullName"]];
		[monthFullNameArray addObject:monthFullName];
		[monthFullName release];
		
		//NSLog(@"Reading monthNameArray :%@  monthFullNameArray  %@", monthNameArray,monthFullNameArray);
		
		Month = 1;
		return;
	}
	
	if( [elementName isEqualToString:@"Year"])
	{
		Year = 1;
		return;
	}
		
	
	if( [elementName isEqualToString:@"Date"])
	{
		myObject = [[Event_Object alloc]init];
		myObject.event_DayName = [[NSString alloc]initWithFormat:@"%@",[attributeDict objectForKey:@"DayName"]];
		//NSLog(@"myObject.event_DayName :%@", myObject.event_DayName);
		Date = 1;
		return;
	}
	
	if( [elementName isEqualToString:@"Body"])
	{
		body = 1;
		return;
	}
	
	if( [elementName isEqualToString:@"Subject"])
	{
		subject = 1;
		return;
	}
		
	
	
	if( [elementName isEqualToString:@"Title"])
	{
		Title = 1;
		return;
	}
	
	if( [elementName isEqualToString:@"Starttime"])
	{
		myObject.event_Starttime  = [[NSString alloc]init];
		Starttime = 1;
		return;
	}
	if( [elementName isEqualToString:@"Endtime"])
	{
		Endtime = 1;
		return;
	}
	if( [elementName isEqualToString:@"EventImage"])
	{
		EventImage = 1;
		return;
	}
	if( [elementName isEqualToString:@"OrganizationImage"])
	{
		OrganizationImage = 1;
		return;
	}
	
	if( [elementName isEqualToString:@"OrganizationFooter"])
	{
		OrganizationFooter = 1;
		return;
	}
	
	if( [elementName isEqualToString:@"Description"])
	{
		Description = 1;
		return;
	}
	
	if( [elementName isEqualToString:@"Organization"])
	{
		Organization = 1;
		return;
	}
	
	
	if( [elementName isEqualToString:@"Name"])
	{
		LocationName = 1;
		return;
	}
	
	if( [elementName isEqualToString:@"Latitude"])
	{
		LocationLatitude = 1;
		return;
	}
	
	if( [elementName isEqualToString:@"Longitude"])
	{
		LocationLongitude = 1;
		return;
	}
	
	if( [elementName isEqualToString:@"URL"])
	{
		url = 1;
		return;
	}
	
	
}
	
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
	if(CurrentMonth)
	{	
		NSLog(@"CurrentMonth=%@ ",string);
		if (Month) {
			[currentMonth_Month appendString: string];
			NSLog(@"currentMonth_Month%@ ",currentMonth_Month);
		}
		if (Year) {
			[currentMonth_Year appendString: string];
			NSLog(@"currentMonth_Year%@",currentMonth_Year);
		}
	}
	
	if(NextMonth) 
	{	
		NSLog(@"nextMonth_Month string = %@",string);

		if (Month) {
			[nextMonth_Month appendString: string];
			NSLog(@"nextMonth_Month%@   string = %@",nextMonth_Month,string);
		}
		if (Year) {
			[nextMonth_Year appendString: string];
			NSLog(@"nextMonth_Year%@",nextMonth_Year);
		}
	}
	

	if(PreviousMonth)
	{	
		//CurrentMonth = FALSE;
		NextMonth = FALSE;
		//PreviousMonth = FALSE;
		NSLog(@"previousMonth_Month  string =%@",string);

		if (Month) {
			[previousMonth_Month appendString: string];
			NSLog(@"previousMonth_Month%@",previousMonth_Month);
		}
		if (Year) {
			[previousMonth_Year appendString: string];
			NSLog(@"previousMonth_Year%@",previousMonth_Year);
		}
	}
	
	if(Date)
	{	
		myObject.event_Date = string;
		
		if([[myObject.event_Date substringToIndex:2] isEqualToString:currentMonth_Month])
		{
			currentMonthFlag = TRUE;
			if (DEBUG ==1) NSLog(@"%myObject.event_Date  %@  [string substringToIndex:1] %@",myObject.event_Date,[string substringToIndex:2]);
		}else if([[myObject.event_Date substringToIndex:2] isEqualToString:nextMonth_Month])
		{
			nextMonthFlag = TRUE;
			if (DEBUG ==1) NSLog(@"%myObject.event_Date  %@  [string substringToIndex:1] %@",myObject.event_Date,[string substringToIndex:2]);
		}else if([[myObject.event_Date substringToIndex:2] isEqualToString:previousMonth_Month])
		{
			previousMonthFlag = TRUE;
			if (DEBUG ==1) NSLog(@"%myObject.event_Date  %@  [string substringToIndex:1] %@",myObject.event_Date,[string substringToIndex:2]);
		}
	}
	

	if(subject)
	{		
		mail_subject = [[NSMutableString alloc]initWithFormat:@"%@",string];
		if (DEBUG ==1) NSLog(@"mail_subject  %@",mail_subject);
		
	}
	if(body)
	{		
		mail_body = [[NSMutableString alloc]initWithFormat:@"%@",string];
		if (DEBUG ==1) NSLog(@"mail_body %@",mail_body);
	}
	
	
	if(Title)
	{		
		myObject.event_Title = string;
		if (DEBUG ==1) NSLog(@"%myObject.event_Title  %@",myObject.event_Title);

	}
	if(Starttime)
	{		
		myObject.event_Starttime = string;
		if (DEBUG ==1) NSLog(@"%myObject.event_Starttime  %@",myObject.event_Starttime);

	}
	if(Endtime)
	{		
		myObject.event_Endtime = string;
		if (DEBUG ==1) NSLog(@"%myObject.event_Endtime  %@",myObject.event_Endtime);

	}
	if(EventImage)
	{		
		myObject.event_EventImage = string;
		if (DEBUG ==1) NSLog(@"%myObject.event_EventImage  %@",myObject.event_EventImage);

	}
	if(OrganizationImage)
	{		
		myObject.event_OrganizationImage = string;
		if (DEBUG ==1) NSLog(@"%myObject.event_OrganizationImage  %@",myObject.event_OrganizationImage);

	}
	if(OrganizationFooter)
	{		
		myObject.event_OrganizationFooter = string;
		if (DEBUG ==1) NSLog(@"%myObject.event_OrganizationImage  %@",myObject.event_OrganizationFooter);

	}
	if(Description)
	{		
		myObject.event_Description = string;
		if (DEBUG ==1) NSLog(@"%myObject.event_Description  %@",myObject.event_Description);

	}
	if(Organization)
	{		
		myObject.event_Organization = string;
		//NSLog(@"%myObject.event_Organization  %@",myObject.event_Organization);

	}
	if(LocationName)
	{		
		myObject.event_Location_Name = string;
		//NSLog(@"%myObject.event_Location  %@",myObject.event_Location);
		
	}
	
	if(LocationLatitude)
	{		
		myObject.event_Location_Latitude = string;
		//NSLog(@"%myObject.event_Location  %@",myObject.event_Location);
		
	}
	
	if(LocationLongitude)
	{		
		myObject.event_Location_Longitude = string;
		//NSLog(@"%myObject.event_Location  %@",myObject.event_Location);
		
	}
	
	if(url)
	{		
		myObject.url_String = string;
		//NSLog(@"%myObject.event_Location  %@",myObject.event_Location);
		
	}
	
	
	
	
		
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName 
{
	if( [elementName isEqualToString:@"CurrentMonth"])
	{
		return;
	}
	
	
	if( [elementName isEqualToString:@"NextMonth"])
	{
		return;
	}
	
	
	if( [elementName isEqualToString:@"PreviousMonth"])
	{
		return;
	}
	 
	
	if( [elementName isEqualToString:@"Month"])
	{
		Month = FALSE;
		return;
	}
	
	if( [elementName isEqualToString:@"Year"])
	{
		
		NSLog(@"Inside the Year --->didElementElement");
		
		Year				= FALSE;
		CurrentMonth		= FALSE;
		NextMonth			= FALSE;
		PreviousMonth		= FALSE;
		return;
	}
	
	
	if( [elementName isEqualToString:@"Date"])
	{
		Date = FALSE;
		return;
	}
	
	if( [elementName isEqualToString:@"Subject"])
	{
		subject = FALSE;
		return;
	}
	
	if( [elementName isEqualToString:@"Body"])
	{
		body = FALSE;
		return;
	}
	
	if( [elementName isEqualToString:@"Title"])
	{
		Title = FALSE;
		return;
	}
	
	if( [elementName isEqualToString:@"Starttime"])
	{
		//myObject.event_Starttime = nil;
		Starttime = FALSE;
		return;
	}
	if( [elementName isEqualToString:@"Endtime"])
	{
		Endtime = FALSE;
		return;
	}
	if( [elementName isEqualToString:@"EventImage"])
	{
		EventImage = FALSE;
		return;
	}
	if( [elementName isEqualToString:@"OrganizationImage"])
	{
		OrganizationImage = FALSE;
		return;
	}
	
	if( [elementName isEqualToString:@"OrganizationFooter"])
	{
		OrganizationFooter = FALSE;
		return;
	}
	
	if( [elementName isEqualToString:@"Description"])
	{
		Description = FALSE;
		return;
	}
	
	if( [elementName isEqualToString:@"Organization"])
	{
		Organization = FALSE;
		return;
	}
	
	if( [elementName isEqualToString:@"Name"])
	{
		LocationName = FALSE;
		return;
	}
	
	if( [elementName isEqualToString:@"Latitude"])
	{
		LocationLatitude = FALSE;
		return;
	}
	
	if( [elementName isEqualToString:@"Longitude"])
	{
		
		LocationLongitude = FALSE;
		return;
	}
	
	if( [elementName isEqualToString:@"URL"])
	{
		if(currentMonthFlag == TRUE)
		{
			[eventsArray addObject:myObject];
			
		}
		url = FALSE;

		currentMonthFlag	= FALSE;
		nextMonthFlag		= FALSE;
		previousMonthFlag	= FALSE;
		return;
	}
	
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
	//NSLog(@"parser in not working properly");
}







// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
	
	[spinner release];	
	[autoTimer release];
}


@end
