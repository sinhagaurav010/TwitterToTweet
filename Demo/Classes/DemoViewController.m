#import "DemoViewController.h"
#import "Global.h"
#import "SearchDetViewController.h"
#import "SearchDetViewController.h"


NSMutableDictionary  *dict_search;
NSMutableArray *arry_search;

@implementation DemoViewController

+ (void) initialize {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	NSMutableDictionary *defaultsDict = [NSMutableDictionary dictionary];
	[defaultsDict setObject:[NSNumber numberWithBool:YES] forKey:@"shouldLookForEAN13AndUPCACodes"];
	[defaultsDict setObject:[NSNumber numberWithBool:YES] forKey:@"shouldLookForEAN8Codes"];
	[defaultsDict setObject:[NSNumber numberWithBool:YES] forKey:@"shouldLookForUPCECodes"];
	[defaultsDict setObject:[NSNumber numberWithBool:NO] forKey:@"shouldLookForQRCodes"];

	[defaults registerDefaults:defaultsDict];	
}
- (DemoViewController *) initXMLParser {
	
	//arrayForKey					=	[NSMutableArray new];
	[super init];
	//appDelegate				= (ComiciPadAppDelegate *)[[UIApplication sharedApplication] delegate];
	return self;
}
-(void)parseloginXml:(NSString* )aStr
{
	
	NSData *myData =  [aStr dataUsingEncoding: NSASCIIStringEncoding];
	
	
	NSLog(@"astr===========----------%@",aStr);
	//NSData  *galleryXmlfileData			= [theXML dataUsingEncoding:NSUTF8StringEncoding];
	NSXMLParser *xmlParser				= [[NSXMLParser alloc] initWithData:myData];
	DemoViewController *parser		=	[[DemoViewController alloc] initXMLParser];// Used for ehat purpose
	[xmlParser setDelegate:parser];
	NSLog(@"1111111111111");
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
	attributes:(NSDictionary *)attributeDict
{
	
	if([elementName isEqualToString:@"soap:Envelope"]) {
	}
	
	else if([elementName isEqualToString:@"soap:Body"]) 
	{
		//aOgs				=  [ogs new];
	}	
	if([elementName isEqualToString:@"link"])
	{
		[datacomp setObject:[attributeDict objectForKey:@"rel"] forKey:@"rel"] ;
		[datacomp setObject:[attributeDict objectForKey:@"type"] forKey:@"type"] ;
		[datacomp setObject:[attributeDict objectForKey:@"href"] forKey:@"href"] ;
		NSLog(@"=======^^^^^^^^^----------%@",attributeDict);
		[array_ref  addObject: datacomp];
		
		datacomp   =  [NSMutableDictionary  new];
		

	}	
	
	
	
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string 

{ 
	NSLog(@"----------------000000000000000000000000000000");
	if(!currentElementValue) {
		
		currentElementValue	= [[NSMutableString alloc] initWithString:string];
	}
	
	
	else
	{
		[currentElementValue appendString:string];
	}
	
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
	
	if([elementName isEqualToString:@"feed"])
	{
		
		return;
	}
	//entry
	if([elementName isEqualToString:@"entry"]) 
	{
		[arry_search  addObject:dict_search];
		[arrayforBuy addObject:array_ref];
		NSLog(@"arrayforBuyarrayforBuy-------%@",arrayforBuy);
		array_ref = [NSMutableArray  new];
		dict_search = [NSMutableDictionary new];
	}
	
	if([elementName isEqualToString:@"g:image_link"]) 
	{
		if(currentElementValue!=nil)
		[dict_search setObject:[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:elementName];
		
	}
	
	if([elementName isEqualToString:@"title"])
	{
		//NSLog(@"----------------------------%@",currentElementValue);
		if(currentElementValue!=nil)
		[dict_search setObject:[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:elementName];
		
	}
	
	/*if([elementName isEqualToString:@"link rel"])
	{
		//NSLog(@"?????????????????????");
		//NSLog(@"----------------------------%@",currentElementValue);
		if(currentElementValue!=nil)
			[dict_search setObject:[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:elementName];
		
	}*/
	//link
	if([elementName isEqualToString:@"g:price"])
	{
		//NSLog(@"----------------------------%@",currentElementValue);
		if(currentElementValue!=nil)
		[dict_search setObject:[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:elementName];
		
	}
	
	
	/*if([elementName isEqualToString:@"g:expiration_date"])
	 {
	 g:price
	 [dict_search setObject:[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:elementName];
	 
	 }*/
	
	//content
	if([elementName isEqualToString:@"content"])
	{
		if(currentElementValue!=nil)
		[dict_search setObject:[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:elementName];
		
	}
	else {}
	
	[currentElementValue release];
	currentElementValue				= nil;
	
}
/*
-(IBAction)Addtowith:(id)sender
{
	NSString *sring_data   =  @"012546615310";
	NSString *url_string = [NSString stringWithFormat:@"http://base.google.com/base/feeds/snippets/?bq=%@",sring_data];//,string_inUrl,campaignid,data_fetch.string_mobile,user_name,password];
	
	NSString  *string_return = [NSString stringWithContentsOfURL:[NSURL URLWithString:url_string] ];
	
	arrayforBuy  =   [NSMutableArray  new];
	arry_search		=  [NSMutableArray       new];
	dict_search     =  [NSMutableDictionary  new];
	datacomp  =  [NSMutableDictionary new];
	array_ref  = [NSMutableArray  new];
	[self parseloginXml:string_return];
	
	NSLog(@"arry_search---------????????%@",arrayforBuy);
	SearchDetViewController  *obj  =   [SearchDetViewController   new];
	[self.navigationController  pushViewController:obj animated:YES];
	
	if(obj)
	{
		[obj   release];
		obj  = nil;
	}
	

}
 */
//////////////////////////////////////////
-(IBAction)Addtowith:(id)sender
{
	NSString *str_image = @"081864202243";
	NSString *url_string = [NSString stringWithFormat:@"http://base.google.com/base/feeds/snippets/?bq=%@",str_image];//,string_inUrl,campaignid,data_fetch.string_mobile,user_name,password];
	
    //	NSString *url_string = [NSString stringWithFormat:@"http://base.google.com/base/feeds/snippets/?bq=%@",sring_data];//,string_inUrl,campaignid,data_fetch.string_mobile,user_name,password];
	
	NSString  *string_return = [NSString stringWithContentsOfURL:[NSURL URLWithString:url_string] ];
	
	arrayforBuy     =   [NSMutableArray  new];
	arry_search		=   [NSMutableArray       new];
	dict_search     =   [NSMutableDictionary  new];
	datacomp		=   [NSMutableDictionary new];
	array_ref		=   [NSMutableArray  new];
	[self parseloginXml:string_return];
	
	//NSLog(@"arry_search---------????????%@",arrayforBuy);
	SearchDetViewController  *obj  =   [SearchDetViewController   new];
	[self.navigationController  pushViewController:obj animated:YES];
	
	if(obj)
	{
		[obj   release];
		obj  = nil;
	}
	
}
//////////////////////////
- (void) viewDidLoad 
{
	
	UIBarButtonItem *newBackButton				= [[UIBarButtonItem alloc] initWithTitle: @"Share" style: UIBarButtonItemStyleBordered target:self action:@selector(Addtowith:)];
	self.navigationItem.leftBarButtonItem		= newBackButton;
	
	
	
	self.view.backgroundColor = [UIColor colorWithRed:99.0/255.0 green:162.0/255.0 blue:223.0/255.0 alpha:1.0];
	self.title = @"Scanner Demo"; //Set our title.
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStyleBordered target:self action:@selector(settingsTapped)];

	//Set up a UILabel to show some info about each barcode that is scanned.
	_codeInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300.0)];
	_codeInfoLabel.backgroundColor = [UIColor clearColor];
	_codeInfoLabel.numberOfLines = 0;
	_codeInfoLabel.font = [UIFont boldSystemFontOfSize:14.0];
	_codeInfoLabel.textColor = [UIColor colorWithWhite:0.1 alpha:1.0];
	_codeInfoLabel.textAlignment = UITextAlignmentCenter;

	[self.view addSubview:_codeInfoLabel];

	[_codeInfoLabel release]; //We've added our info label as a subview, no need to keep it around, our view will retain it for us.

	//Create a button for the user to tap on that will bring up the barcode scanner view controller.
	UIButton *_scanABarcodeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	
	[_scanABarcodeButton setTitle:@"Scan a Barcode" forState:UIControlStateNormal];
	[_scanABarcodeButton addTarget:self action:@selector(scanABarcodeTapped) forControlEvents:UIControlEventTouchUpInside];
	
	_scanABarcodeButton.frame = CGRectMake(20, 300, 280, 44);
	
	[self setupSettingsView];

	[self.view addSubview:_scanABarcodeButton];
}

#pragma mark User Interation Methods

- (void) scanABarcodeTapped {
	//Called when the user taps on our "Scan A Barcode" button
	
	if([SKScannerViewController canRecognizeBarcodes]) 
	{
		//Make sure we can even attempt barcode recognition, (i.e. on a device without a camera, you wouldn't be able to scan anything).
		SKScannerViewController *scannerVC         = [[SKScannerViewController alloc] init]; //Insantiate a new SKScannerViewController
		scannerVC.delegate = self;
		scannerVC.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelTapped)];
		scannerVC.title = @"Scan a Barcode";
		
		_codeInfoLabel.text = @""; //Reset our info text label.

		scannerVC.shouldLookForEAN13AndUPCACodes   = [[NSUserDefaults standardUserDefaults] boolForKey:@"shouldLookForEAN13AndUPCACodes"];
		scannerVC.shouldLookForEAN8Codes = [[NSUserDefaults standardUserDefaults] boolForKey:@"shouldLookForEAN8Codes"];
		scannerVC.shouldLookForQRCodes   = [[NSUserDefaults standardUserDefaults] boolForKey:@"shouldLookForQRCodes"];
		scannerVC.shouldLookForUPCECodes = [[NSUserDefaults standardUserDefaults] boolForKey:@"shouldLookForUPCECodes"];

		UINavigationController *_nc      = [[[UINavigationController alloc] initWithRootViewController:scannerVC] autorelease]; //Put our SKScannerViewController into a UINavigationController. (So it looks nice).

		[scannerVC release];

		[self presentModalViewController:_nc animated:YES]; //Slide it up onto the screen.
	} 
	else 
	{
		UIAlertView *alertView           = [[UIAlertView alloc] initWithTitle:@"Sorry" message:@"This device doesn't support barcode recognition." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alertView show];
		[alertView release];
	}
}
- (void) cancelTapped {
	[self dismissModalViewControllerAnimated:YES];
}

#pragma mark SKScannerViewControllerDelegate Methods

- (void) scannerViewController:(SKScannerViewController *)scanner didRecognizeCode:(SKCode *)code {
	NSLog(@"didRecognizeCode = %@", code.rawContent);

	AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);

	[self dismissModalViewControllerAnimated:YES]; //We're done scanning barcodes so we should dismiss our modal view controller.

	_codeInfoLabel.text = code.rawContent; //Grab the nice pretty description of our "Code" object and set it as our label's text so users will know what they've scanned.
	
	NSString *url_string = [NSString stringWithFormat:@"http://base.google.com/base/feeds/snippets/?bq=%@",code.rawContent];//,string_inUrl,campaignid,data_fetch.string_mobile,user_name,password];
	
    //	NSString *url_string = [NSString stringWithFormat:@"http://base.google.com/base/feeds/snippets/?bq=%@",sring_data];//,string_inUrl,campaignid,data_fetch.string_mobile,user_name,password];
	
	NSString  *string_return = [NSString stringWithContentsOfURL:[NSURL URLWithString:url_string] ];
	
	arrayforBuy     =   [NSMutableArray  new];
	arry_search		=   [NSMutableArray       new];
	dict_search     =   [NSMutableDictionary  new];
	datacomp		=   [NSMutableDictionary new];
	array_ref		=   [NSMutableArray  new];
	[self parseloginXml:string_return];
	
	//NSLog(@"arry_search---------????????%@",arrayforBuy);
	SearchDetViewController  *obj  =   [SearchDetViewController   new];
	[self.navigationController  pushViewController:obj animated:YES];
	
	if(obj)
	{
		[obj   release];
		obj  = nil;
	}
	
}


- (void) scannerViewController:(SKScannerViewController *)scanner didStopLookingForCodesWithError:(NSError *)error {
	[self dismissModalViewControllerAnimated:YES];
}
	
#pragma mark Settings

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	return @"Formats";
}
- (NSInteger) tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section {
	return 4;
}
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SettingsCell"];

	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SettingsCell"];
	}
	
	cell.selectionStyle = UITableViewCellSelectionStyleNone;

	if(indexPath.row == 0) {
		cell.textLabel.text = @"EAN13 & UPCA";
		cell.accessoryView = _ean13AndUPCASwitch;
	} else if(indexPath.row == 1) {
		cell.textLabel.text = @"EAN8";
		cell.accessoryView = _ean8Switch;
	} else if(indexPath.row == 2) {
		cell.textLabel.text = @"UPCE";
		cell.accessoryView = _upcESwitch;
	} else if(indexPath.row == 3) {
		cell.textLabel.text = @"QR Codes";
		cell.accessoryView = _qrSwitch;
	}

	return cell;
}

- (void) setupSettingsView {
	_settingsTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
	_settingsTableView.delegate = self;
	_settingsTableView.dataSource = self;

	_ean13AndUPCASwitch = [[UISwitch alloc] init];
	_ean13AndUPCASwitch.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"shouldLookForEAN13AndUPCACodes"];
	[_ean13AndUPCASwitch addTarget:self action:@selector(settingsSwitchChanged:) forControlEvents:UIControlEventValueChanged];

	_ean8Switch = [[UISwitch alloc] init];
	_ean8Switch.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"shouldLookForEAN8Codes"];
	[_ean8Switch addTarget:self action:@selector(settingsSwitchChanged:) forControlEvents:UIControlEventValueChanged];

	_upcESwitch = [[UISwitch alloc] init];
	_upcESwitch.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"shouldLookForUPCECodes"];
	[_upcESwitch addTarget:self action:@selector(settingsSwitchChanged:) forControlEvents:UIControlEventValueChanged];

	_qrSwitch = [[UISwitch alloc] init];
	_qrSwitch.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"shouldLookForQRCodes"];
	[_qrSwitch addTarget:self action:@selector(settingsSwitchChanged:) forControlEvents:UIControlEventValueChanged];
}
- (void) settingsTapped {
	[UIView transitionFromView:self.view toView:_settingsTableView duration:1.0 options:UIViewAnimationOptionTransitionFlipFromLeft completion:nil];
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(settingsDoneTapped)];
}
- (void) settingsDoneTapped {
	[UIView transitionFromView:_settingsTableView toView:self.view duration:1.0 options:UIViewAnimationOptionTransitionFlipFromLeft completion:nil];
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStyleBordered target:self action:@selector(settingsTapped)];
}
- (void) settingsSwitchChanged:(UISwitch *)sender {
	if(sender == _ean13AndUPCASwitch) {
		[[NSUserDefaults standardUserDefaults] setBool:_ean13AndUPCASwitch.on forKey:@"shouldLookForEAN13AndUPCACodes"];
	} else if(sender == _ean8Switch) {
		[[NSUserDefaults standardUserDefaults] setBool:_ean8Switch.on forKey:@"shouldLookForEAN8Codes"];
	} else if(sender == _upcESwitch) {
		[[NSUserDefaults standardUserDefaults] setBool:_upcESwitch.on forKey:@"shouldLookForUPCECodes"];		
	} else if(sender == _qrSwitch) {
		[[NSUserDefaults standardUserDefaults] setBool:_qrSwitch.on forKey:@"shouldLookForQRCodes"];
	}

	[[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark Memory Management

- (void) viewDidUnload {
	_codeInfoLabel = nil;
	_settingsTableView = nil;

	_ean13AndUPCASwitch = nil;
	_ean8Switch = nil;
	_upcESwitch = nil;
	_qrSwitch = nil;

	[super viewDidUnload];
}
- (void) dealloc {
	[super dealloc];
}

@end