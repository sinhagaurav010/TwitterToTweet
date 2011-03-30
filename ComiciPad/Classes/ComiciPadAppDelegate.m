//
//  ComiciPadAppDelegate.m
//  ComiciPad
//
//  Created by CHROME INFOTECH  on 06/09/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "ComiciPadAppDelegate.h"
#import "ComicViewController.h"
#import "ComicissueViewController.h"
@implementation ComiciPadAppDelegate

@synthesize window;


#pragma mark -
#pragma mark Application lifecycle
/*
-(void)parsingofComicXmlfile
{
	NSString *filePath					= [[NSBundle mainBundle]pathForResource:@"ComicXmlfile" ofType:@"xml"];
	NSString *fileContents				= [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
	NSData  *myData						= [fileContents dataUsingEncoding:NSUTF8StringEncoding];
	
	NSXMLParser *xmlParser				= [[NSXMLParser alloc] initWithData:myData];
	ComicissueViewController *parser	=	[[ComicissueViewController alloc] initXMLParser];// Used for ehat purpose
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
	
}*/

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
	
    // Override point for customization after application launch.
	ComicViewController     *comicviewcontrollerObj			=	[ComicViewController  new];
	navigation												=	[[UINavigationController alloc]initWithRootViewController:comicviewcontrollerObj];
    [window addSubview:navigation.view];
	
	if(comicviewcontrollerObj!=nil)
	{
		[comicviewcontrollerObj release];
		comicviewcontrollerObj=nil;
	}
	//[self parsingofComicXmlfile];
    [window makeKeyAndVisible];
	
	return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [window release];
	if(navigation)
	{
	[navigation  release];
		navigation    =  nil;
	}
	[super dealloc];
}


@end
