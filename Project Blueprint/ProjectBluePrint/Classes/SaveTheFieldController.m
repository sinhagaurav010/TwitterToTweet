//
//  SaveTheFieldController.m
//  ProjectBluePrint
//
//  Created by gaurav sinha on 02/02/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SaveTheFieldController.h"
#import "CJSONDeserializer.h"

@implementation SaveTheFieldController

//////////This function check either session id exit or not
+(BOOL)CheckingTheExistenceOfKey
{
	NSUserDefaults			*defaults = [NSUserDefaults standardUserDefaults];
	BOOL _isExit;
	if([defaults objectForKey:SESSIONID])
	{
		_isExit = 1;
	}
	else 
	{
		_isExit = 0;
	}
	return _isExit;
}
///////////////Url for loading the web view in Advertisement 
+(NSURLRequest*)ReturnNSURL:(NSString*)stringURL
{
	NSURL *url = [NSURL URLWithString:stringURL];
	//URL Requst Object
	NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
	return requestObj;
}

/////Save the session id in userdefault
+(void)saveTheSessionId:(NSString*)string
{
	NSUserDefaults			*defaults = [NSUserDefaults standardUserDefaults];
	if([defaults objectForKey:SESSIONID])
	{
		[defaults removeObjectForKey:SESSIONID];
		[defaults synchronize];
	}
	[defaults setObject: string forKey: SESSIONID];
	[defaults synchronize];
}

////////Get the session id
+(NSString*)getTheSessionId
{
	NSUserDefaults			*defaults = [NSUserDefaults standardUserDefaults];
	NSString  *stringSessionID;
	if([defaults objectForKey:SESSIONID])
	{
		stringSessionID  = [defaults objectForKey:SESSIONID];
	}
	return stringSessionID;
}
////////Parse the JSON data and return the session string
+(NSString *)parseTheJSON:(NSString*)stringToParse
{
	NSError *theError = nil;
	NSMutableDictionary *dictionaryOfsession  = [NSMutableDictionary  new];
	dictionaryOfsession =(NSMutableDictionary*)[[CJSONDeserializer deserializer] deserialize:[stringToParse dataUsingEncoding:NSUTF8StringEncoding] error:&theError];
	if(LOG)
	{
	NSLog(@"Error: %@", theError);
	NSLog(@"Result: %@", [dictionaryOfsession objectForKey:@"session_id"]);
	}
	return  [dictionaryOfsession objectForKey:@"session_id"];
}
///////Give dictonary after parsing the string
+(NSMutableDictionary*)parseTheJSN:(NSString*)string
{
	NSError *theError = nil;
	NSMutableDictionary *dictionaryOfsession  = [NSMutableDictionary  new];
	dictionaryOfsession =(NSMutableDictionary*)[[CJSONDeserializer deserializer] deserialize:[string dataUsingEncoding:NSUTF8StringEncoding] error:&theError];
	
	if(LOG)
	{
	NSLog(@"Error: %@", theError);
	NSLog(@"Result: %@", [dictionaryOfsession objectForKey:@"session_id"]);
	}
	return  dictionaryOfsession;
}
@end
