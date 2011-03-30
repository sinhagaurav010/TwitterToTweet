//
//  DetailsPageController.m
//  VOA
//
//  Created by Dharmendra Singh Kushwaha on 29/04/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "DetailsPageController.h"
#define BORDER_COLOR [UIColor colorWithRed:0.811765 green:0.819608 blue:0.835294 alpha:1]
#define TEXT_COLOR [UIColor colorWithRed:0.227451 green:0.227451 blue:0.227451 alpha:1]

@implementation DetailsPageController


// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
		
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
    [super viewDidLoad];
	
	self.title = [monthFullNameArray objectAtIndex:0];

	segmentedControl = [[UISegmentedControl alloc] initWithItems:
						[NSArray arrayWithObjects:
						 [UIImage imageNamed:@"up.png"],
						 [UIImage imageNamed:@"down.png"],
						 nil]];
	[segmentedControl addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
	segmentedControl.frame = CGRectMake(0, 0, 90, 30);
	segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
	segmentedControl.momentary = YES;
	
	UIBarButtonItem *segmentBarItem = [[UIBarButtonItem alloc] initWithCustomView:segmentedControl];
	self.navigationItem.rightBarButtonItem = segmentBarItem;
	//[segmentBarItem release];
	
	
	[self.view setBackgroundColor:[UIColor colorWithRed:0.862745 green:0.882353 blue:0.929412 alpha:1]];
	
	
	[self mainView];
	
	
	
}

-(void)mainView
{
	[detailsView removeFromSuperview];
	detailsView = [[UIView alloc]initWithFrame:CGRectMake(0.0, 0.0, self.view.bounds.size.width, self.view.bounds.size.height)];
	[self.view addSubview:detailsView];
	
	NSString *EventImageURL			= [[NSString alloc]initWithFormat:@"%@",globalObject.event_EventImage];
	NSString *OrganizationImageURL	= [[NSString alloc]initWithFormat:@"%@",globalObject.event_OrganizationImage];
	NSString *OrganizationFooterURL = [[NSString alloc]initWithFormat:@"%@",globalObject.event_OrganizationFooter];
	
	//Image fetches in data format
	EventImageData			= [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:EventImageURL]];
	OrganizationImageData	= [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:OrganizationImageURL]];
	OrganizationFooterData	= [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:OrganizationFooterURL]];
	
	
	
	if (rowSelectedAtIndex == 0) 
		[segmentedControl setEnabled:NO forSegmentAtIndex:0];
	
	if (rowSelectedAtIndex == ([eventsArray count] - 1)) 
		[segmentedControl setEnabled:NO forSegmentAtIndex:1];    
	
	NSInteger numberOfLinesOfDescription = (globalObject.event_Description.length)/34 + 1;//Calculate the number of lines of description
	
	NSInteger height;
	if ((numberOfLinesOfDescription * 14) > 100) {
		height = numberOfLinesOfDescription * 14;
	}
	else {
		height = 110;
	}
	
	UIScrollView *description_scrollview=[[UIScrollView alloc]initWithFrame:CGRectMake(0.0, 0.0, self.view.bounds.size.width, self.view.bounds.size.height)];
	description_scrollview.delegate = self;
	description_scrollview.bouncesZoom = YES;
	description_scrollview.backgroundColor = [UIColor clearColor];
	description_scrollview.showsVerticalScrollIndicator=YES;
	
	// Minimum and maximum zoom scales
	description_scrollview.minimumZoomScale = description_scrollview.frame.size.width / 320.0;
	description_scrollview.maximumZoomScale = 2.0;
	
	
	
	
	//Logo image
	UIImage *logoImage = [[UIImage alloc]initWithData:OrganizationImageData];
	UIImageView *logoImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10.0, 44.0, 60.0,40.0)];
	[logoImageView setBackgroundColor:[UIColor clearColor]];
	[logoImageView setImage:logoImage];
	[description_scrollview addSubview:logoImageView];
	[logoImage release];
	
	NSArray *dateDisplayArray = [globalObject.event_Date componentsSeparatedByString:@"/"];
	
	//Used to Show date in formatted way
	
	NSInteger dateShow = [[dateDisplayArray objectAtIndex:1] intValue];
	NSString *dateString;
	
	if (dateShow < 10) 
	{
		dateString = [[NSString alloc]initWithFormat:@"%@",[[dateDisplayArray objectAtIndex:1]substringFromIndex:1]];
	}
	else{
		dateString = [[NSString alloc]initWithFormat:@"%@",[dateDisplayArray objectAtIndex:1]];
	}
		
	
	NSString *headerText = [[NSString alloc]initWithFormat:@"%@ %@ %@ %@",globalObject.event_DayName,dateString,[monthNameArray objectAtIndex:0],[dateDisplayArray objectAtIndex:2]];
	[dateString release];
	//used to print the date
	UILabel *dateLabel = [[[UILabel alloc] init] autorelease];
	dateLabel.frame = CGRectMake(90, 44.0, 200, 20);
	dateLabel.backgroundColor = [UIColor clearColor];
	dateLabel.textColor = [UIColor blackColor];
	dateLabel.adjustsFontSizeToFitWidth = YES;
	dateLabel.font=[UIFont fontWithName:@"Helvetica-Bold"  size:15];
	dateLabel.text = headerText;
	if (globalObject.event_Date.length == 0) {
		[dateLabel removeFromSuperview];
	}else {
		[description_scrollview addSubview:dateLabel];
	}
	
	//[description_scrollview addSubview:dateLabel];
	//[dateLabel release];
	
	//Used to print the hours of the day
	UILabel *hoursLabel = [[[UILabel alloc] init] autorelease];
	hoursLabel.frame = CGRectMake(90, 64.0, 280, 15);
	hoursLabel.backgroundColor = [UIColor clearColor];
	hoursLabel.textColor = [UIColor blackColor];
	hoursLabel.font=[UIFont fontWithName:@"Helvetica"  size:13];
	hoursLabel.text = [globalObject.event_Starttime stringByAppendingFormat:@" - %@ uur",globalObject.event_Endtime];
	
	if ((globalObject.event_Starttime.length == 0) && (globalObject.event_Endtime.length == 0)) {
		[hoursLabel removeFromSuperview];
	}else {
		[description_scrollview addSubview:hoursLabel];
	}
	
	//[hoursLabel release];
	
	//Used to print the text line
	UILabel *TextLabel = [[[UILabel alloc] init] autorelease];
	
	CGFloat labelHeight;
	
	if (globalObject.event_Title.length > 35) {
		labelHeight = 40;
		TextLabel.numberOfLines = 2;

	}
	else {
		labelHeight = 20;
		TextLabel.numberOfLines = 1;

	}

	TextLabel.frame = CGRectMake(10, 90, 280, labelHeight);
	TextLabel.backgroundColor = [UIColor clearColor];
	TextLabel.textColor = [UIColor blackColor];
	TextLabel.font=[UIFont fontWithName:@"Helvetica-Bold"  size:16];
	TextLabel.text = globalObject.event_Title;
	[description_scrollview addSubview:TextLabel];
	//[TextLabel release];
	
	
	CGFloat heightOfBackground;
	if (numberOfLinesOfDescription*14 > 110)
	{
		heightOfBackground = numberOfLinesOfDescription*14;
	}
	else 
	{
		heightOfBackground = 110;
	}

	UIImageView *backImageView = [[UIImageView alloc]initWithFrame:CGRectMake(8.0, 93.0 + labelHeight, 229 + 75, heightOfBackground + 8)];
	[backImageView setBackgroundColor:BORDER_COLOR];
	backImageView.layer.cornerRadius = 5;
	[description_scrollview addSubview:backImageView];
	[backImageView release];
	
	UIImageView *backgroundImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10.0, 95.0 + labelHeight, 227 + 73, heightOfBackground + 5)];
	[backgroundImageView setBackgroundColor:[UIColor whiteColor]];
	backgroundImageView.layer.cornerRadius = 5;
	[description_scrollview addSubview:backgroundImageView];
	[backgroundImageView release];
	
	
	//Person image
	UIImage *personImage = [[UIImage alloc]initWithData:EventImageData];
	UIImageView *personImageView = [[UIImageView alloc]initWithFrame:CGRectMake(15.0, 100.0 + labelHeight, 70, 100)];
	[personImageView setBackgroundColor:[UIColor clearColor]];
	//[personImageView setImage:personImage];
	personImageView.image = [self roundCornersOfImage:personImage];

	
	//personImageView.layer.cornerRadius = 5;
	[description_scrollview addSubview:personImageView];
	[personImageView release];
	
	
	
		
	//Used to print the description
	UILabel *descriptionLabel = [[[UILabel alloc] init] autorelease];
	descriptionLabel.frame = CGRectMake(95, 100 + labelHeight, 215, numberOfLinesOfDescription*14);
	descriptionLabel.backgroundColor = [UIColor clearColor];
	descriptionLabel.textColor = TEXT_COLOR;
	// descriptionLabel.textAlignment = YES;
	descriptionLabel.font=[UIFont fontWithName:@"Helvetica"  size:12];
	descriptionLabel.numberOfLines = numberOfLinesOfDescription;
	descriptionLabel.text = globalObject.event_Description;
	[description_scrollview addSubview:descriptionLabel];
	//[descriptionLabel release];
	
	
	NSLog(@"globalObject.event_Description = %@",globalObject.event_Description);
	
	UIImageView *backImageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(8.0, 102 + labelHeight + height, 304, 73)];
	[backImageView1 setBackgroundColor:BORDER_COLOR];
	backImageView1.layer.cornerRadius = 5;
	[description_scrollview addSubview:backImageView1];
	[backImageView1 release];
	
	UIImageView *backgroundImageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(10, 104 + labelHeight + height, 300, 70)];
	[backgroundImageView1 setBackgroundColor:[UIColor whiteColor]];
	backgroundImageView1.layer.cornerRadius = 5;
	[description_scrollview addSubview:backgroundImageView1];
	[backgroundImageView1 release];
	
	//Used to print the orgination
	UILabel *companyLabel = [[[UILabel alloc] init] autorelease];
	companyLabel.frame = CGRectMake(10, 110 + labelHeight + height, 80, 20);
	companyLabel.backgroundColor = [UIColor clearColor];
	companyLabel.textColor = TEXT_COLOR;
	companyLabel.font=[UIFont fontWithName:@"Helvetica"  size:13];
	companyLabel.textAlignment= UITextAlignmentRight;
	companyLabel.text = @"Organisatie";
	[description_scrollview addSubview:companyLabel];
	//[descriptionLabel release];
	
	//Used to print the orgination Name
	UILabel *companyPrintLabel = [[[UILabel alloc] init] autorelease];
	companyPrintLabel.frame = CGRectMake(100, 110 + labelHeight + height, 170, 20);
	companyPrintLabel.backgroundColor = [UIColor clearColor];
	companyPrintLabel.textColor = TEXT_COLOR;
	companyPrintLabel.font=[UIFont fontWithName:@"Helvetica"  size:13];
	companyPrintLabel.text = globalObject.event_Organization;
	[description_scrollview addSubview:companyPrintLabel];
	
	
	//Used to print the orgination
	UILabel *locationLabel = [[[UILabel alloc] init] autorelease];
	locationLabel.frame = CGRectMake(10, 135 + labelHeight + height, 80, 20);
	locationLabel.backgroundColor = [UIColor clearColor];
	locationLabel.textColor = TEXT_COLOR;
	locationLabel.font=[UIFont fontWithName:@"Helvetica"  size:13];
	locationLabel.textAlignment= UITextAlignmentRight;
	locationLabel.text = @"Locatie";
	[description_scrollview addSubview:locationLabel];
	//[descriptionLabel release];
	
	NSInteger numberOfLinesOfLocation;
	if (globalObject.event_Location_Name.length > 30) {
		numberOfLinesOfLocation = 2;
	}else {
		numberOfLinesOfLocation = 1;

	}

	
	//Used to print the orgination Name
	UILabel *locationPrintLabel = [[[UILabel alloc] init] autorelease];
	
	if (numberOfLinesOfLocation == 2) {
		locationPrintLabel.frame = CGRectMake(100, 132 + labelHeight + height, 170, 40);
	}else if (numberOfLinesOfLocation == 1) {
		locationPrintLabel.frame = CGRectMake(100, 125 + labelHeight + height, 170, 40);
	}
	
	locationPrintLabel.backgroundColor = [UIColor clearColor];
	locationPrintLabel.textColor = [UIColor colorWithRed:0.333333 green:0.109804 blue:0.835294 alpha:1];
	locationPrintLabel.font=[UIFont fontWithName:@"Helvetica"  size:13];
	locationPrintLabel.numberOfLines = numberOfLinesOfLocation;
	locationPrintLabel.text = globalObject.event_Location_Name;
	[description_scrollview addSubview:locationPrintLabel];
	
	
	//Used to create pin button
	UIButton *pinButton = [UIButton new];
	pinButton.frame = CGRectMake(270, 128 + labelHeight + height, 32, 40);
	pinButton.backgroundColor=[UIColor clearColor];
	[pinButton setBackgroundImage:[UIImage imageNamed:@"pin.jpg"] forState:UIControlStateNormal];
	[pinButton addTarget:self action:@selector(pinButtonClick:) forControlEvents:UIControlEventTouchUpInside];
	
	if ((globalObject.event_Location_Latitude.length > 0) && (globalObject.event_Location_Longitude.length > 0)) {
		[description_scrollview addSubview:pinButton];
	}else {
		[pinButton removeFromSuperview];
	}
	[pinButton release];
	
	//Used to create mail button
	UIButton *mailButton = [[UIButton buttonWithType:UIButtonTypeRoundedRect]retain];
	mailButton.frame = CGRectMake(10.0, 182.0 +labelHeight + height, 140, 35);
	mailButton.backgroundColor=[UIColor clearColor];
	[mailButton setTitle:@"Vertel verder" forState:UIControlStateNormal];
	[mailButton addTarget:self action:@selector(mailButtonClick:) forControlEvents:UIControlEventTouchUpInside];
	[description_scrollview addSubview:mailButton];
	[mailButton release];
	
	//use to create iCal Button
	UIButton *urlButton = [[UIButton buttonWithType:UIButtonTypeRoundedRect]retain];
	urlButton.frame = CGRectMake(170, 182.0 +labelHeight + height, 140, 35);
	urlButton.backgroundColor=[UIColor clearColor];
	[urlButton setTitle:@"Meer informatie" forState:UIControlStateNormal];
	[urlButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
	[urlButton addTarget:self action:@selector(launchURLButtonClick:) forControlEvents:UIControlEventTouchUpInside];
	[description_scrollview addSubview:urlButton];
	
	if (globalObject.url_String.length == 0) {
		urlButton.enabled = FALSE;
	}else {
		urlButton.enabled = YES;
	}
	[urlButton release];

    
	self.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, height + 320);
	description_scrollview.contentSize = self.view.frame.size;
	[detailsView addSubview:description_scrollview];
	
	UIImage *advImage = [[UIImage alloc]initWithData:OrganizationFooterData];
	UIImageView *advImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0.0, 366 , 320, 50)];
	[advImageView setBackgroundColor:[UIColor grayColor]];
	[advImageView setImage:advImage];
	[self.view addSubview:advImageView];
	[advImageView release];
	
	self.view.frame = CGRectMake(0.0, 0.0, 320, 480.0);
	
	
}	

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Create the segment for next and previous entry

- (IBAction)segmentAction:(id)sender
{
	// The segmented control was clicked, handle it here 
	UISegmentedControl *segmentedControl1 = (UISegmentedControl *)sender;
	NSLog(@"Segment clicked: %d", segmentedControl1.selectedSegmentIndex);
	if(segmentedControl1.selectedSegmentIndex == 1)
	{
		
		if (rowSelectedAtIndex < [commonEventsArray count] - 1) {
			[segmentedControl1 setEnabled:YES forSegmentAtIndex:0];
			rowSelectedAtIndex ++;
			globalObject = [commonEventsArray objectAtIndex:rowSelectedAtIndex];
			[self mainView];
		}
		else {
			[segmentedControl1 setEnabled:NO forSegmentAtIndex:1];        // default is YES
			
		}
		
	}
	else if(segmentedControl1.selectedSegmentIndex == 0)
	{
		if (rowSelectedAtIndex > 0) {
			[segmentedControl1 setEnabled:YES forSegmentAtIndex:1];	
			rowSelectedAtIndex --;
			globalObject = [commonEventsArray objectAtIndex:rowSelectedAtIndex];
			[self mainView];
		}else {
			[segmentedControl1 setEnabled:NO forSegmentAtIndex:0];        // default is YES
			
		}
	}
	
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//For launching the URl
-(IBAction)launchURLButtonClick:(id)sender{
		
	NSString *url;
	if (!([globalObject.url_String hasPrefix:@"http://"])) {
		url = [[NSString alloc]initWithFormat:@"http://%@",globalObject.url_String];
	} 
	else {
		url = [[NSString alloc]initWithFormat:@"%@",globalObject.url_String];
	}

	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
	[url release];
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Button Used to send a mail
-(IBAction)mailButtonClick:(id)sender{
	NSString * mailSubject = [[NSString alloc]initWithFormat:@"%@ %@",mail_subject,globalObject.event_Title];
	NSString * mailBody;
	if ((mail_body.length > 0 ) && (globalObject.event_Description.length > 0)) {
		mailBody = [[NSString alloc]initWithFormat:@"%@\n\n%@",mail_body,globalObject.event_Description];
	}else if ((mail_body.length > 0 ) && (globalObject.event_Description.length == 0)) {
		mailBody = [[NSString alloc]initWithFormat:@"%@",mail_body];
	}else if ((mail_body.length == 0 ) && (globalObject.event_Description.length > 0)) {
		mailBody = [[NSString alloc]initWithFormat:@"%@",globalObject.event_Description];
	}
	
	
	MFMailComposeViewController *controller = [MFMailComposeViewController new];
	[controller setToRecipients:[NSArray arrayWithObjects:@"",nil]];
	[controller setMessageBody:mailBody  isHTML:NO];
	[controller setSubject:mailSubject];
	controller.navigationBar.tintColor = [UIColor colorWithRed:0 green:0.65 blue:0.85 alpha:1];
	[controller setMailComposeDelegate:self];
	[self presentModalViewController:controller animated:YES];
	[controller release];
	
	[mailBody release];
	[mailSubject release];
	
	
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Mail Composer delegate

#pragma mark email delegate

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
	NSString *message = @"";
	if( MFMailComposeResultSent == result )
	{
		message = @"Mail sent OK";
	}
	else if( MFMailComposeResultCancelled == result )
	{
		
	}
	else
	{
		message = @"Mail sent failed";
	}
	if( [message length] > 0 )
	{
		UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alertView show];
		[alertView release];
	}
	[controller dismissModalViewControllerAnimated:YES];
	
	self.navigationController.navigationBar.frame = CGRectMake(0.0, 20.0, 320, 80.0);
	
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
-(void)pinButtonClick:(id)sender
{
	self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Terug" style:UIBarButtonItemStyleBordered target:nil action:nil]; 
	
	MapShowController *my_MapShowController = [[MapShowController alloc]init];
	[[self navigationController] pushViewController:my_MapShowController animated:YES];
	
	
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


void addRoundedRectToPath(CGContextRef context, CGRect rect, float ovalWidth, float ovalHeight)
	{
		    float fw, fh;
		    if (ovalWidth == 0 || ovalHeight == 0) {
			        CGContextAddRect(context, rect);
			        return;
			    }
		    CGContextSaveGState(context);
		    CGContextTranslateCTM (context, CGRectGetMinX(rect), CGRectGetMinY(rect));
		    CGContextScaleCTM (context, ovalWidth, ovalHeight);
		    fw = CGRectGetWidth (rect) / ovalWidth;
		    fh = CGRectGetHeight (rect) / ovalHeight;
		    CGContextMoveToPoint(context, fw, fh/2);
		    CGContextAddArcToPoint(context, fw, fh, fw/2, fh, 1);
		    CGContextAddArcToPoint(context, 0, fh, 0, fh/2, 1);
		    CGContextAddArcToPoint(context, 0, 0, fw/2, 0, 1);
		    CGContextAddArcToPoint(context, fw, 0, fw, fh/2, 1);
		    CGContextClosePath(context);
		    CGContextRestoreGState(context);
		}
	 
- (UIImage *)roundCornersOfImage:(UIImage *)source {
		    int w = source.size.width;
		    int h = source.size.height;
		 
		    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
		    CGContextRef context = CGBitmapContextCreate(NULL, w, h, 8, 4 * w, colorSpace, kCGImageAlphaPremultipliedFirst);
		 
		    CGContextBeginPath(context);
		    CGRect rect = CGRectMake(0, 0, w, h);
		    // Set the oval width and height to be quarter of the image width and height
		    addRoundedRectToPath(context, rect, w/16, h/16);
		    CGContextClosePath(context);
		    CGContextClip(context);
		 
		    CGContextDrawImage(context, CGRectMake(0, 0, w, h), source.CGImage);
		 
		    CGImageRef imageMasked = CGBitmapContextCreateImage(context);
		    UIImage *newImage = [[UIImage imageWithCGImage:imageMasked] retain];
		 
		    CGContextRelease(context);
		    CGColorSpaceRelease(colorSpace);
		    CGImageRelease(imageMasked);
		    return newImage;
	}

@end
