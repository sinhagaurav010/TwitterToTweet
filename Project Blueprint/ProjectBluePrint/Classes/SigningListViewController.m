    //
//  SigningListViewController.m
//  ProjectBluePrint
//
//  Created by gaurav sinha on 02/02/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SigningListViewController.h"
#import "SaveTheFieldController.h"
#import "Global.h"
#import "AdverismentViewController.h"
#import "CJSONDeserializer.h"
@implementation SigningListViewController
//@synthesize cell;
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{
	dictionaryList = [[NSMutableDictionary alloc] init];
	
	_fromCell = 0;
	NSString *stringUrl =  [NSString stringWithFormat:@"https://bss_device:bss_password@bluepoint-staging.heroku.com/users/%@/signs.json",[SaveTheFieldController getTheSessionId]];
	
	[self ASIHttpCall:stringUrl:nil];
    
	[super viewDidLoad];
}


///////////////////////////////////////

////////////////////////////////////////
-(void)ASIHttpCall:(NSString*)stringUrl:(NSMutableData*)postData
{
	NSURL *url = [NSURL  URLWithString:stringUrl];
	getDeviceSessionRequest = [ASIHTTPRequest requestWithURL:url];
	getDeviceSessionRequest.delegate = self;
	[getDeviceSessionRequest addRequestHeader:CONTENT value:APP];
	[getDeviceSessionRequest addRequestHeader:ACCEPT value:APP];
	
	if(postData!=nil)
	{
		[getDeviceSessionRequest setRequestMethod:@"PUT"];
		[getDeviceSessionRequest setPostBody:postData];
	}
	[getDeviceSessionRequest setDidFinishSelector:@selector(topSecretFetchComplete:)];
	[getDeviceSessionRequest setDidFailSelector:@selector(topSecretFetchFailed:)];
	/////Start the activity indicator
	spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
	[spinner setCenter:CGPointMake(kScreenWidthPortrait/2.0, kScreenHeightPortrait/2.0)]; // I do this because I'm in landscape mode
	[self.view addSubview:spinner]; // spinner is not visible until started
	[spinner startAnimating];
	
	[getDeviceSessionRequest startAsynchronous];
}

///////////////////////////////////////
//In the case of request complete 
- (IBAction)topSecretFetchComplete:(ASIHTTPRequest *)theRequest
{
	NSError *theError = nil;
	[spinner stopAnimating];
	if(_fromCell == 0)
	{
		dictionaryList =(NSMutableDictionary*)[[CJSONDeserializer deserializer] deserialize:[[theRequest responseString] dataUsingEncoding:NSUTF8StringEncoding] error:&theError];
		count = [[dictionaryList  objectForKey:@"sign"] count];
	
		/////To put the data into nsmutable array from the dictionary
		arrayList		= [NSMutableArray  new];
		arrayRegister = [NSMutableArray new];
		arraySignedId = [NSMutableArray new];
		for(int i=0 ;i<count;i++)
			{
				[arrayList addObject:[[[dictionaryList objectForKey:@"sign"]objectAtIndex:i]objectForKey:@"name"]];
				[arrayRegister addObject:[[[dictionaryList objectForKey:@"sign"]objectAtIndex:i]objectForKey:@"registered"]];
				[arraySignedId addObject:[[[dictionaryList objectForKey:@"sign"]objectAtIndex:i]objectForKey:@"id"]];
			}
		table_View = [[UITableView alloc] initWithFrame:CGRectMake(0, 97, 768, 847) style:UITableViewStyleGrouped];
	
		table_View.delegate = self;
		table_View.dataSource = self;
	
		[self.view addSubview:table_View];
	}
	else
	{
		NSString *stringAfterParsing = [[SaveTheFieldController parseTheJSN:[theRequest responseString]]objectForKey:@"message"];
		if(![stringAfterParsing isEqualToString:@"Sign is registered!"])
		{
			UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Error Error!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
			[alert show];
			[alert  release];
		}
		else 
		{
			AdverismentViewController *objAdvertisementViewController = [AdverismentViewController new];
			[self.navigationController pushViewController:objAdvertisementViewController animated:YES];
			if(objAdvertisementViewController)
			{
				[objAdvertisementViewController  release];
				objAdvertisementViewController   =  nil;
			}
		}

	}

}
//////////////////////////////////////////////In the case request failed
- (IBAction)topSecretFetchFailed:(ASIHTTPRequest *)theRequest
{
	[spinner stopAnimating];
	UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Info" message:@"Error Error!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alert  show];
	[alert  release];
}

////////return View according to the registered status for cell color
-(UIView*)CellColorAccordingToStatus:(BOOL)status
{
	UIView *viewCell = [UIView new];
	if(status == 1)
	{
	viewCell.backgroundColor	 = [UIColor  yellowColor];
	}
	else 
	{
		viewCell.backgroundColor = [UIColor  whiteColor];
	}
	return viewCell;
	[viewCell release];
}
//////////Return string from the dictionary 
-(NSString*)stringFromTheDictionary:(NSDictionary*)dictionary:(NSString*)elementName:(NSInteger)Index
{
return [[[dictionary objectForKey:@"sign"]objectAtIndex:Index] objectForKey:elementName];
}
//////////////////////////////////
/////Code for the table view
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	
	return count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView              // Default is 1 if not implemented
{
	return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 80;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
	
	UITableViewCellStyle style =  UITableViewCellStyleDefault;
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BaseCell"];
	if (!cell) 
		cell = [[[UITableViewCell alloc] initWithStyle:style reuseIdentifier:@"BaseCell"] autorelease];
	
	UIView *ViewForCell = [UIView new];	
	//////To set the cell color according the registered user
	ViewForCell				= [self  CellColorAccordingToStatus:[[arrayRegister objectAtIndex:indexPath.row] boolValue]];
	CGRect  frameForCell	= [cell frame];
	ViewForCell.frame		= CGRectMake(frameForCell.origin.x, frameForCell.origin.y, frameForCell.size.width, 80);
	//[cell addSubview:ViewForCell];
	cell.backgroundView = ViewForCell;
	cell.textLabel.backgroundColor = [UIColor clearColor];
	[ViewForCell release];
	
	//////label for register ipad
	UILabel *labelCell	= [[UILabel alloc] initWithFrame:CGRectMake(frameForCell.origin.x+200, frameForCell.origin.y+25,400 ,40 )];
	labelCell.text		= [arrayList objectAtIndex:indexPath.row];	
	labelCell.font		= [UIFont systemFontOfSize:30];
	labelCell.backgroundColor = [UIColor clearColor];
	[cell addSubview:labelCell];
	
	return cell;
}
//////////////////////////////////////////////////////////////////

//////////////////When User click on the cell of the table
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSString *stringUrl =  [NSString stringWithFormat:@"https://bss_device:bss_password@bluepoint-staging.heroku.com/users/%@/signs/%d/register_device.json",[SaveTheFieldController getTheSessionId],[[arraySignedId objectAtIndex:indexPath.row] integerValue] ];
	NSString *postString = SIGN;
	_fromCell = 1;
	NSMutableData *postData = (NSMutableData *)[postString dataUsingEncoding:NSUTF8StringEncoding];
	[self ASIHttpCall:stringUrl:postData];
	SharedInstance *share = [SharedInstance sharedInstance];
	[share setFieldValueAtPos:0 ToValue:[[arraySignedId objectAtIndex:indexPath.row] integerValue]];
}
////////////////////////////////////////////
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation 
{
    // Overriden to allow any orientation.
    return YES;
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[table_View release];
	[arrayList release];
	[dictionaryList release];
	[arrayRegister release];
    [super dealloc];
}


@end
