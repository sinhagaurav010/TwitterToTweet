//
//  MainMenuController.m
//  VOA
//
//  Created by Dharmendra Singh Kushwaha on 29/04/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MainMenuController.h"


/*@implementation UINavigationBar (UINavigationBarCategory)

- (void)drawRect:(CGRect)rect {
	UIImage *image = [UIImage imageNamed: @"voa-business.png"];
	[image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
}
@end*/


static NSMutableDictionary *navigationBarImages = NULL;

@implementation UINavigationBar(CustomImage)
//Overrider to draw a custom image

+ (void)initImageDictionary
{
    if(navigationBarImages==NULL){
        navigationBarImages=[[NSMutableDictionary alloc] init];
    }   
}

- (void)drawRect:(CGRect)rect
{
    NSString *imageName=[navigationBarImages objectForKey:[NSValue valueWithNonretainedObject: self]];
    if (imageName==nil) {
        imageName=@"navigationBarImage.png";
    }
    UIImage *image = [UIImage imageNamed: imageName];
    [image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
}

//Allow the setting of an image for the navigation bar
- (void)setImage:(UIImage*)image
{
    [navigationBarImages setObject:image forKey:[NSValue valueWithNonretainedObject: self]];
}
@end




@implementation MainMenuController

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
		
		[self ArrayInitalization];
	
	}
		
	return self;
}


-(void)ArrayInitalization
{
	@try {
		Event_Object *checkObject;//= [[Event_Object alloc]init];
		
		if ([eventsArray count] > 0) {
			for (int i = 0; i < [eventsArray count] - 1; i ++) {
				Event_Object *sortObject = [eventsArray objectAtIndex:i];
				
				
				for (int j = i+1; j < [eventsArray count]; j ++) {
					checkObject = [eventsArray objectAtIndex:j];
					
					//NSLog(@"[sortObject.event_Date substringWithRange:NSMakeRange(2,4)] intValue] = %@",[sortObject.event_Date substringWithRange:NSMakeRange(3,2)]);
					
					if (([[sortObject.event_Date substringWithRange:NSMakeRange(3,2)] intValue]) > ([[checkObject.event_Date substringWithRange:NSMakeRange(3,2)] intValue])) {
						
						Event_Object *mainObject = [[Event_Object alloc]init];
						mainObject = sortObject;
						sortObject = checkObject ;
						checkObject = mainObject;
						
						[eventsArray replaceObjectAtIndex:j withObject:mainObject];
						[eventsArray replaceObjectAtIndex:i withObject:sortObject];
					}
				}
			}
		}
		
		
		eventsDistinctArray = [[NSMutableArray alloc]initWithArray:eventsArray];
		
		while([eventsDistinctArray count] > 0) {
			
			Event_Object *testObject = [eventsDistinctArray objectAtIndex:0];
			[eventsDateArray addObject:(id)testObject.event_Date];
			
			[eventsDayArray addObject:testObject.event_DayName];
			
			for (int i = 0; i < [eventsDistinctArray count]; i ++) {
				Event_Object *compareObject = [eventsDistinctArray objectAtIndex:i];
				if([compareObject.event_Date isEqualToString:testObject.event_Date])
				{
					[eventsDistinctArray removeObjectAtIndex:i];
					i --;
				}
			}
			
		}
		
		
		//NSData *mydata = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:[obj objectForKey:@"url"]]];
		
		if (DEBUG ==1)	NSLog(@"eventsArray .count = %i",[eventsArray count]);
		
		event_OrganizationImage_Array = [[NSMutableArray alloc]init];
		
		for (int i = 0; i<[eventsArray count]; i++) {
			if (DEBUG ==1) NSLog(@"eventsArray .count ");	
			
			Event_Object *my_Object = [eventsArray objectAtIndex:i];
			NSData *mydata = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:my_Object.event_OrganizationImage]];
			[event_OrganizationImage_Array addObject:mydata];
			
		}
		
		if (DEBUG ==1) NSLog(@"eventsArray .count = %@",event_OrganizationImage_Array);	
		
	}
	@catch (NSException * e) {
		NSLog(@"Aray out of Bound Exception");
	}
		//These array will be used to provide the functionality to table view(For Current Month)
		
}

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	NSLog(@"MainMenucontroller ----------> viewDidLoad ");
	
	commonEventsArray = [[NSMutableArray alloc]initWithArray:eventsArray];
	commonDateArray = [[NSMutableArray alloc]initWithArray:eventsDateArray];
	commonDayArray	= [[NSMutableArray alloc]initWithArray:eventsDayArray];
	
	
	
	@try {
		[self.navigationController setNavigationBarHidden:NO];//Used to hide the navigation bar
		self.navigationItem.hidesBackButton = YES;// setNavigationBarHidden:YES];//Used to hide the navigation bar
		
		self.navigationController.navigationBar.frame = CGRectMake(0.0, 20.0, 320, 80.0);
		UIColor *navigationColor = [UIColor colorWithRed:0 green:0.65 blue:0.85 alpha:1];
		self.navigationController.navigationBar.tintColor = navigationColor;//[UIColor colorWithPatternImage: [UIImage imageNamed:@"voa-business.png"]];
		
		self.title = [monthFullNameArray objectAtIndex:0];
		
		UIImageView *navigationTopImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0.0, 20.0, 320, 39)];
		[navigationTopImageView setBackgroundColor:[UIColor grayColor]];
		[navigationTopImageView setImage:[UIImage imageNamed:@"voa_image.png"]];
		[self.navigationController.view addSubview:navigationTopImageView];
		[navigationTopImageView release];
		
		NSLog(@"nextMonth_Month = %@",nextMonth_Month);
		
		if (nextMonth_Month.length != 0) 
		{
			
			UIButton *nextCustomButton = [[UIButton alloc]initWithFrame:CGRectMake(269, 85.0, 56, 31)];
			nextCustomButton.backgroundColor=[UIColor clearColor];
			[nextCustomButton setBackgroundImage:[UIImage imageNamed:@"right_back_style.png"] forState:UIControlStateNormal];
			[nextCustomButton setTitle:[monthNameArray objectAtIndex:1] forState:UIControlStateNormal];
			[nextCustomButton setFont:[UIFont fontWithName:@"Arial-BoldMT" size:14]];
			[nextCustomButton addTarget:self action:@selector(nextButtonClick:) forControlEvents:UIControlEventTouchUpInside];
			
			UIBarButtonItem *nextButton	= [[UIBarButtonItem alloc]initWithCustomView:nextCustomButton];//target:self action:@selector(autoPlayAudio:)];
			self.navigationItem.rightBarButtonItem = nextButton;
			[nextButton release];
		}
		
		
		if ((previousMonth_Month.length != 0) && (nextMonth_Month.length != 0))
		{
			
			UIButton *previousMonthCustomButton = [[UIButton alloc]initWithFrame:CGRectMake(265, 85.0, 56, 31)];
			previousMonthCustomButton.backgroundColor=[UIColor clearColor];
			[previousMonthCustomButton setBackgroundImage:[UIImage imageNamed:@"left-backg.png"] forState:UIControlStateNormal];
			[previousMonthCustomButton setTitle:[monthNameArray objectAtIndex:2] forState:UIControlStateNormal];
			[previousMonthCustomButton setFont:[UIFont fontWithName:@"Arial-BoldMT" size:14]];
			[previousMonthCustomButton addTarget:self action:@selector(previousMonthCustomButtonClick:) forControlEvents:UIControlEventTouchUpInside];
			
			UIBarButtonItem *previousButton	= [[UIBarButtonItem alloc]initWithCustomView:previousMonthCustomButton];//target:self action:@selector(autoPlayAudio:)];
			self.navigationItem.leftBarButtonItem = previousButton;
			[previousButton release];
			
		}
		
		else if(previousMonth_Month.length != 0){
			
			UIButton *previousMonthCustomButton = [[UIButton alloc]initWithFrame:CGRectMake(265, 85.0, 56, 31)];
			previousMonthCustomButton.backgroundColor=[UIColor clearColor];
			[previousMonthCustomButton setBackgroundImage:[UIImage imageNamed:@"left-backg.png"] forState:UIControlStateNormal];
			[previousMonthCustomButton setTitle:[monthNameArray objectAtIndex:1] forState:UIControlStateNormal];
			[previousMonthCustomButton addTarget:self action:@selector(previousMonthCustomButtonClick:) forControlEvents:UIControlEventTouchUpInside];
			[previousMonthCustomButton setFont:[UIFont fontWithName:@"Arial-BoldMT" size:14]];

			UIBarButtonItem *previousButton	= [[UIBarButtonItem alloc]initWithCustomView:previousMonthCustomButton];//target:self action:@selector(autoPlayAudio:)];
			self.navigationItem.leftBarButtonItem = previousButton;
			[previousButton release];
			
		}
		
		
		TableView = [[UITableView alloc]initWithFrame:CGRectMake(0.0, 34.0, self.view.bounds.size.width, 336)];
		TableView.delegate = self;
		TableView.dataSource = self;
		TableView.autoresizesSubviews = YES;
		TableView.backgroundColor=[UIColor clearColor];
		//TableView.alpha=0.7;
		TableView.rowHeight = 65.0;
		TableView.separatorColor = [UIColor grayColor];
		[self.view addSubview:TableView];
		//[TableView release];
		
		
		spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
		[spinner setCenter:CGPointMake(155.0, 230)]; 
		[self.view addSubview:spinner];
				
		UIImageView *advImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0.0, 366, 320, 50)];
		[advImageView setBackgroundColor:[UIColor grayColor]];
		[advImageView setImage:[UIImage imageNamed:@"advertisement.png"]];
		[self.view addSubview:advImageView];
		[advImageView release];
		
				
		NSLog(@"monthNameArray = %@",monthNameArray);
	}
	@catch (NSException * e) {
		NSLog(@"Array out of Bound Exception");
	}
	
	
	
    [super viewDidLoad];
}



#pragma mark -
#pragma mark controls

#pragma mark - UITableView delegates
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	// The number of sections is based on the number of items in the data property list.
	return [commonDateArray count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return ([self getNumberOfRowsInSection:section]);
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	UITableViewCell *cell =[[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:nil ] autorelease];
	cell.accessoryType = UITableViewCellAccessoryNone;
	cell.backgroundColor=[UIColor clearColor];
	cell.alpha=0.5;
	
	NSLog(@"cellForRowAtIndexPath");

		
	Event_Object *myObject = [self getCellForRowAtIndexPath:[indexPath row] InSection:[indexPath section]];

	NSLog(@"myObject.satat%@",myObject.event_Starttime);

	UIImageView *logoImageView = [[UIImageView alloc]initWithFrame:CGRectMake(5.0, 15.0, 60, 40)];
	[logoImageView setBackgroundColor:[UIColor grayColor]];
	
	
	
	/*NSMutableDictionary *data=[[NSMutableDictionary alloc]init];
	[data setObject:[NSString stringWithFormat:@"%@", myObject.event_OrganizationImage] forKey: @"url"];
	[data setObject:logoImageView forKey: @"imageView"];
	[NSThread detachNewThreadSelector:@selector(fetchImage:) toTarget:self withObject:data]; 
	[data release];
	*/
	//NSData *mydata = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:[obj objectForKey:@"url"]]];
	
	
	
	[logoImageView setImage:[UIImage imageWithData:[event_OrganizationImage_Array objectAtIndex:rowSelectedAtIndex]]];
	[cell.contentView addSubview:logoImageView];
	
	UILabel *hoursLabel = [[[UILabel alloc] init] autorelease];
    hoursLabel.frame = CGRectMake(100, 5.0, 180, 20);
    hoursLabel.backgroundColor = [UIColor clearColor];
    hoursLabel.textColor = [UIColor blackColor];
	hoursLabel.font=[UIFont fontWithName:@"Helvetica-Bold"  size:14];
	hoursLabel.text = [myObject.event_Starttime stringByAppendingFormat:@" - %@ uur",myObject.event_Endtime];
	if ((myObject.event_Starttime.length == 0) && (myObject.event_Endtime == 0)) {
		[hoursLabel removeFromSuperview];
	}else {
		[cell.contentView addSubview:hoursLabel];
	}

	
	UILabel *TextLabel = [[[UILabel alloc] init] autorelease];
    TextLabel.frame = CGRectMake(100, 20, 180, 40);
    TextLabel.backgroundColor = [UIColor clearColor];
    TextLabel.textColor = [UIColor blackColor];
	TextLabel.font=[UIFont fontWithName:@"Helvetica-Bold"  size:14];
	TextLabel.numberOfLines = 2;
	TextLabel.text = myObject.event_Title;
	
	if (myObject.event_Title.length == 0) {
		[TextLabel removeFromSuperview];
	}else {
		[cell.contentView addSubview:TextLabel];
	}
	
	
	UIImageView *infoImageView = [[UIImageView alloc]initWithFrame:CGRectMake(280, 17.0, 30, 30)];
	[infoImageView setBackgroundColor:[UIColor clearColor]];
	[infoImageView setImage:[UIImage imageNamed:@"infoButton.png"]];
	[cell.contentView addSubview:infoImageView];
	[infoImageView release];
	
		return cell;
}	


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
	
	//Create header view and add label as a subview
	NSArray *dateDisplayArray = [[commonDateArray objectAtIndex:section] componentsSeparatedByString:@"/"];
	
	
	//Used to shoow date in formated way
	NSInteger dateShow = [[dateDisplayArray objectAtIndex:1] intValue];
	NSString *dateString;
	
	if (dateShow < 10) 
	{
		dateString = [[NSString alloc]initWithFormat:@"%@",[[dateDisplayArray objectAtIndex:1]substringFromIndex:1]];
	}
	else{
		dateString = [[NSString alloc]initWithFormat:@"%@",[dateDisplayArray objectAtIndex:1]];
	  }
	
	NSString *headerText = [[NSString alloc]initWithFormat:@"\t\t%@ %@ %@ %@",[commonDayArray objectAtIndex:section],dateString,[monthNameArray objectAtIndex:0],[dateDisplayArray objectAtIndex:2]];
	[dateString release];
	
	UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 25)];
	view.backgroundColor = [UIColor grayColor];
	// Create label with section title
    UILabel *label = [[[UILabel alloc] init] autorelease];
    label.frame = CGRectMake(0, 1, 320, 19);
    label.backgroundColor = [UIColor lightGrayColor];
	label.textAlignment = YES;
    label.textColor = [UIColor whiteColor];
	label.font=[UIFont fontWithName:@"Helvetica-Bold"  size:14];
	label.text = headerText;
	[view addSubview:label];
	[view autorelease];
	
    return view;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
	
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	globalObject = [[Event_Object alloc]init];
	globalObject = [self getCellForRowAtIndexPath:[indexPath row] InSection:[indexPath section]];
	
	self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Terug" style:UIBarButtonItemStyleBordered target:nil action:nil]; 

	DetailsPageController *my_DetailsPageController = [[DetailsPageController alloc]init];
	[[self navigationController] pushViewController:my_DetailsPageController animated:YES];
	
}



-(Event_Object *)getCellForRowAtIndexPath:(NSInteger)row InSection:(NSInteger)section
{
	int k=0;
	int count=0;
	
	NSString *stringTemp=[NSString stringWithFormat:@"%@",[commonDateArray objectAtIndex:section]];
	
	
	for(int i=0;i<[commonEventsArray count];i++)
	{
		rowSelectedAtIndex = i;
		Event_Object *clientObject = [commonEventsArray objectAtIndex:i];
		
		NSString *compTemp=[NSString stringWithFormat:@"%@",clientObject.event_Date];
		NSString *returnTemp = [NSString stringWithFormat:@"%@",clientObject.event_Endtime];
		if([stringTemp isEqualToString:compTemp])
		{
			k=1;
			
			count++;
			
			if(count==row+1)
			{
				//sectionRows = row + 1;
				return clientObject;
			}
		}
		else 
		{
			if(k==1)
			{
				
				break;
			}
		}
	}
	
}




-(NSInteger)getNumberOfRowsInSection:(NSInteger)section

{
	int k=0;
	int count=0;
	NSString *stringTemp=[NSString stringWithFormat:@"%@",[commonDateArray objectAtIndex:section]];
	
	
	for(int i=0;i<[commonEventsArray count];i++)
	{
		NSString *compTemp=[NSString stringWithFormat:@"%@",[(Event_Object *)[commonEventsArray objectAtIndex:i] event_Date]];
		if([stringTemp isEqualToString:compTemp])
		{
			
			k=1;
			count++;
			
		}
		else 
		{
			if(k==1)
			{
				
				break;
			}
		}
	}
	return count;
}



	
	
-(void)fetchImage:(NSDictionary *)obj 
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init]; 
	NSData *mydata = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:[obj objectForKey:@"url"]]];
	UIImage *myImage;
	if(mydata)
		myImage = [UIImage imageWithData:mydata];
	
	[(UIImageView *)[obj objectForKey:@"imageView"] setImage:myImage];
	
	[mydata release];
	mydata=nil;
	[pool release];
}	
	

-(IBAction)nextButtonClick:(id)sender
{	
	
	//[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
	[spinner startAnimating];

	nextTimer = [NSTimer scheduledTimerWithTimeInterval:0.0 target:self selector:@selector(nextTimerExecute:) userInfo:nil repeats:NO];

}

-(void)nextTimerExecute:(id)sender{
	
	[nextTimer release];
	nextTimer = nil;
	
	NSString *URLString = [[NSString alloc]initWithFormat:@"http://voaonline.redfive-labs.biz/monthdata.aspx?month=%@&year=%@",nextMonth_Month,nextMonth_Year];
	mydata = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:URLString]];
	NSLog(@"URLString = %@",URLString);
	[URLString release];
	

	SplashScreenController *mySplashScreenController = [[SplashScreenController alloc]init];
	[mySplashScreenController XMLParsingStart];
	[self ArrayInitalization];

	whichMonthSelect = 1;
	self.navigationItem.rightBarButtonItem = nil;
	self.navigationItem.leftBarButtonItem = nil;
	
	self.title = [monthFullNameArray objectAtIndex:0];
	if (nextMonth_Month.length != 0) 
	{
		
		UIButton *nextCustomButton = [[UIButton alloc]initWithFrame:CGRectMake(269, 85.0, 56, 31)];
		nextCustomButton.backgroundColor=[UIColor clearColor];
		[nextCustomButton setBackgroundImage:[UIImage imageNamed:@"right_back_style.png"] forState:UIControlStateNormal];
		[nextCustomButton setTitle:[monthNameArray objectAtIndex:1] forState:UIControlStateNormal];
		[nextCustomButton addTarget:self action:@selector(nextButtonClick:) forControlEvents:UIControlEventTouchUpInside];
		[nextCustomButton setFont:[UIFont fontWithName:@"Arial-BoldMT" size:14]];
		UIBarButtonItem *nextButton	= [[UIBarButtonItem alloc]initWithCustomView:nextCustomButton];//target:self action:@selector(autoPlayAudio:)];
		self.navigationItem.rightBarButtonItem = nextButton;
		[nextButton release];
	}
	
	
	if ((previousMonth_Month.length != 0) && (nextMonth_Month.length != 0))
	{
		
		UIButton *previousMonthCustomButton = [[UIButton alloc]initWithFrame:CGRectMake(265, 85.0, 56, 31)];
		previousMonthCustomButton.backgroundColor=[UIColor clearColor];
		[previousMonthCustomButton setBackgroundImage:[UIImage imageNamed:@"left-backg.png"] forState:UIControlStateNormal];
		[previousMonthCustomButton setTitle:[monthNameArray objectAtIndex:2] forState:UIControlStateNormal];
		[previousMonthCustomButton addTarget:self action:@selector(previousMonthCustomButtonClick:) forControlEvents:UIControlEventTouchUpInside];
		[previousMonthCustomButton setFont:[UIFont fontWithName:@"Arial-BoldMT" size:14]];

		UIBarButtonItem *previousButton	= [[UIBarButtonItem alloc]initWithCustomView:previousMonthCustomButton];//target:self action:@selector(autoPlayAudio:)];
		self.navigationItem.leftBarButtonItem = previousButton;
		[previousButton release];
		
	}
	
	else if(previousMonth_Month.length != 0){
		
		UIButton *previousMonthCustomButton = [[UIButton alloc]initWithFrame:CGRectMake(265, 85.0, 56, 31)];
		previousMonthCustomButton.backgroundColor=[UIColor clearColor];
		[previousMonthCustomButton setBackgroundImage:[UIImage imageNamed:@"left-backg.png"] forState:UIControlStateNormal];
		[previousMonthCustomButton setTitle:[monthNameArray objectAtIndex:1] forState:UIControlStateNormal];
		[previousMonthCustomButton addTarget:self action:@selector(previousMonthCustomButtonClick:) forControlEvents:UIControlEventTouchUpInside];
		[previousMonthCustomButton setFont:[UIFont fontWithName:@"Arial-BoldMT" size:14]];

		UIBarButtonItem *previousButton	= [[UIBarButtonItem alloc]initWithCustomView:previousMonthCustomButton];//target:self action:@selector(autoPlayAudio:)];
		self.navigationItem.leftBarButtonItem = previousButton;
		[previousButton release];
		
	}
	
	
	commonEventsArray = [[NSMutableArray alloc]initWithArray:eventsArray];
	commonDateArray = [[NSMutableArray alloc]initWithArray:eventsDateArray];
	commonDayArray	= [[NSMutableArray alloc]initWithArray:eventsDayArray];
	
	NSLog(@"commonEventsArray%@,commonDateArray%@,commonDayArray%@",commonEventsArray,commonDateArray,commonDayArray);
	[TableView reloadData];
	[spinner stopAnimating];
	
}

	
-(void)previousMonthCustomButtonClick:(id)sender
{
	[spinner startAnimating];
	previousTimer = [NSTimer scheduledTimerWithTimeInterval:0.0 target:self selector:@selector(previousTimerExecute:) userInfo:nil repeats:NO];
	
}

-(void)previousTimerExecute:(id)sender{
	

	[previousTimer release];
	previousTimer = nil;
	NSString *URLString = [[NSString alloc]initWithFormat:@"http://voaonline.redfive-labs.biz/monthdata.aspx?month=%@&year=%@",previousMonth_Month,previousMonth_Year];
	mydata = mydata = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:URLString]];
	NSLog(@"URLString = %@",URLString);
	[URLString release];
	
	SplashScreenController *mySplashScreenController = [[SplashScreenController alloc]init];
	[mySplashScreenController XMLParsingStart];
	[self ArrayInitalization];
	
	whichMonthSelect = 2;
	self.navigationItem.rightBarButtonItem = nil;
	self.navigationItem.leftBarButtonItem = nil;
	
	self.title = [monthFullNameArray objectAtIndex:0];

	
	
	if (nextMonth_Month.length != 0) 
	{
		
		UIButton *nextCustomButton = [[UIButton alloc]initWithFrame:CGRectMake(269, 85.0, 56, 31)];
		nextCustomButton.backgroundColor=[UIColor clearColor];
		[nextCustomButton setBackgroundImage:[UIImage imageNamed:@"right_back_style.png"] forState:UIControlStateNormal];
		[nextCustomButton setTitle:[monthNameArray objectAtIndex:1] forState:UIControlStateNormal];
		[nextCustomButton addTarget:self action:@selector(nextButtonClick:) forControlEvents:UIControlEventTouchUpInside];
		[nextCustomButton setFont:[UIFont fontWithName:@"Arial-BoldMT" size:14]];

		UIBarButtonItem *nextButton	= [[UIBarButtonItem alloc]initWithCustomView:nextCustomButton];//target:self action:@selector(autoPlayAudio:)];
		self.navigationItem.rightBarButtonItem = nextButton;
		[nextButton release];
	}
	
	
	if ((previousMonth_Month.length != 0) && (nextMonth_Month.length != 0))
	{
		
		UIButton *previousMonthCustomButton = [[UIButton alloc]initWithFrame:CGRectMake(265, 85.0, 56, 31)];
		previousMonthCustomButton.backgroundColor=[UIColor clearColor];
		[previousMonthCustomButton setBackgroundImage:[UIImage imageNamed:@"left-backg.png"] forState:UIControlStateNormal];
		[previousMonthCustomButton setTitle:[monthNameArray objectAtIndex:2] forState:UIControlStateNormal];
		[previousMonthCustomButton addTarget:self action:@selector(previousMonthCustomButtonClick:) forControlEvents:UIControlEventTouchUpInside];
		[previousMonthCustomButton setFont:[UIFont fontWithName:@"Arial-BoldMT" size:14]];

		UIBarButtonItem *previousButton	= [[UIBarButtonItem alloc]initWithCustomView:previousMonthCustomButton];//target:self action:@selector(autoPlayAudio:)];
		self.navigationItem.leftBarButtonItem = previousButton;
		[previousButton release];
		
	}
	
	else if(previousMonth_Month.length != 0){
		UIButton *previousMonthCustomButton = [[UIButton alloc]initWithFrame:CGRectMake(265, 85.0, 56, 31)];
		previousMonthCustomButton.backgroundColor=[UIColor clearColor];
		[previousMonthCustomButton setBackgroundImage:[UIImage imageNamed:@"left-backg.png"] forState:UIControlStateNormal];
		[previousMonthCustomButton setTitle:[monthNameArray objectAtIndex:1] forState:UIControlStateNormal];
		[previousMonthCustomButton addTarget:self action:@selector(previousMonthCustomButtonClick:) forControlEvents:UIControlEventTouchUpInside];
		[previousMonthCustomButton setFont:[UIFont fontWithName:@"Arial-BoldMT" size:14]];

		UIBarButtonItem *previousButton	= [[UIBarButtonItem alloc]initWithCustomView:previousMonthCustomButton];//target:self action:@selector(autoPlayAudio:)];
		self.navigationItem.leftBarButtonItem = previousButton;
		[previousButton release];
	}
	
	
	commonEventsArray = [[NSMutableArray alloc]initWithArray:eventsArray];
	commonDateArray = [[NSMutableArray alloc]initWithArray:eventsDateArray];
	commonDayArray	= [[NSMutableArray alloc]initWithArray:eventsDayArray];
	
	[TableView reloadData];
	[spinner stopAnimating];


	
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
}


@end
