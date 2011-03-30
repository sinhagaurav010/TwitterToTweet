//
//  ZoekenViewController.h
//  DemoProject
//
//  Created by CHROME INFOTECH  on 03/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Stoffen.h"

#import <sqlite3.h>

/*@ Discription:
 This Class for Zoeken View
 
 includes scroll view ,text view
 
 and button
 
*/
/////////////////////////////////////
//////////////////////

@class DemoProjectAppDelegate;


@interface ZoekenViewController : UIViewController 
{   NSMutableString             *currentElementValue;
	NSMutableString				*pictureList_String;
	IBOutlet UIScrollView		*scrll ;    //For the Scroll view
    IBOutlet UITextField		*txt_GE  ;   //For the text View 
	IBOutlet UIButton			*button;    //For the button
	IBOutlet UITextField        *txt_UN;
    IBOutlet UIBarButtonItem    *button_Annuleer;
	DemoProjectAppDelegate      *appDelegate;
	sqlite3						*database;
}

-(IBAction)userdidenteringtext:(id)sender; 
-(IBAction)Vindpressed:(id)argName;

@end
