//
//  SplashScreenController.h
//  VOA
//
//  Created by Dharmendra Singh Kushwaha on 29/04/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
/**
 @Description: This class provide the splash functionality. if user will touch on this page the it will redirected to next page or after 3 seconds of launching this application
 
 */

#import <UIKit/UIKit.h>
#import "MainMenuController.h"
#import "Global.h"
#import "Event_Object.h"
#import <SystemConfiguration/SystemConfiguration.h>

@interface SplashScreenController : UIViewController {
	NSTimer *autoTimer; // set to three second and non repetative
	NSXMLParser *xmlParser;
   
	Event_Object *myObject;
	UIActivityIndicatorView *spinner;	

	
	BOOL CurrentMonth;
	BOOL Month;
	BOOL Year;
	BOOL NextMonth;
	BOOL PreviousMonth;
	BOOL Date;
	BOOL Title;
	BOOL Starttime;
	BOOL Endtime;
	BOOL EventImage;
	BOOL OrganizationImage;
	BOOL OrganizationFooter;
	BOOL Description;
	BOOL Organization;
	BOOL LocationName;
	BOOL LocationLatitude;
	BOOL LocationLongitude;
	BOOL url;
	
	
	
	BOOL previousMonthFlag;
	BOOL nextMonthFlag;
	BOOL currentMonthFlag;
	BOOL subject;
	BOOL body;
	
	/////////////////////////////////////
	
	//Boolean Used to check the connection
	
	BOOL hasConnection;
}
-(void)XMLParsingStart;
-(BOOL)connectedToWeb;
@end
