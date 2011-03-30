//
//  DemoProjectAppDelegate.m
//  DemoProject
//
//  Created by CHROME INFOTECH  on 03/08/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "DemoProjectAppDelegate.h"
#import "ZoekenViewController.h"
#import "ScreenShotViewController.h"
#import "LoadingScreenViewController.h"
#import "SearchTableViewController.h"

#define DB_NAME @"ichemAlertDataBase.sqlite"

@interface DemoProjectAppDelegate(private) 

-(void)createEditableCopyOfDatabaseIfNeeded;

@end


@implementation DemoProjectAppDelegate

@synthesize window;

/*-(id)init
{
	if (self = [super init]) 
	{
	}
	return self;
}*/


////////////////////////////////////////////////////
//Parsing code for stoffenlijistsymbols.Xml



-(void)Xmlparsingforogs
{
	#pragma mark Grouped all the satement that is used for the same functionality
	
	///========== Grouped all the satement that is used for the same functionality
	NSString *filePath					= [[NSBundle mainBundle]pathForResource:@"ogs1" ofType:@"xml"];
	NSString *fileContents				= [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
	NSData  *myData						= [fileContents dataUsingEncoding:NSUTF8StringEncoding];
	
	NSXMLParser *xmlParser				= [[NSXMLParser alloc] initWithData:myData];
	SearchTableViewController *parser	=	[[SearchTableViewController alloc] initXMLParser];// Used for ehat purpose
	[xmlParser setDelegate:parser];
	
	
	//	Start parsing the XML file.
	BOOL success						= [xmlParser parse];
	if(success)
		NSLog(@"No Errors");
	else
		NSLog(@"Error Error Error!!!");

#pragma mark  Local declared varibale will releases like this
	///============== Local declared varibale will releases like this
	if (xmlParser) {
		[xmlParser release];
		xmlParser = nil;
	}
	
}

////////////////////////////////////////////////////
	
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 
{  
	LoadingScreenViewController *testobj=	[[LoadingScreenViewController alloc]init];
	navigation							=	[[UINavigationController alloc]initWithRootViewController:testobj];
	[window addSubview:navigation.view];
	
	//[self Xmlparsingforogs];
	
	////////////////////////////////////////////////////
	//Parsing code for stoffenlijistsymbols.Xml
	[self createEditableCopyOfDatabaseIfNeeded];
	[window makeKeyAndVisible];
	
	return YES;
}

- (void)createEditableCopyOfDatabaseIfNeeded {
	
	// First, test for existence.
	
	BOOL success;
	
	NSFileManager *fileManager		= [NSFileManager defaultManager];
	NSError *error;
		NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
		NSString *documentsDirectory	= [paths objectAtIndex:0];
		NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"ichemAlertDataBase.sqlite"];
		success = [fileManager fileExistsAtPath:writableDBPath];
	    if (success) return;
		#pragma mark <Always used named constant for the constant values for i.e #define>
	// The writable database does not exist, so copy the default to the appropriate location.
	
	NSString *defaultDBPath			= [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"ichemAlertDataBase.sqlite"];
	//======================= Always used named constant for the constant values for i.e #define
		success							= [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
		if (!success) {
				NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
	}
}
/*+ (NSString *) getDBPath
{
	//NSLog(@"getDBPath");
	NSArray *paths1 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask, YES);
	NSString *documentsDir = [paths1 objectAtIndex:0];
	return [documentsDir stringByAppendingPathComponent:DB_NAME];
}*/

- (void)dealloc {
    [window release];
	[matters release];
	[navigation release];
    [super dealloc];
}


@end
