//
//  ComicissueViewController.h
//  ComiciPad
//
//  Created by CHROME INFOTECH  on 06/09/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Global.h"
@class ComiciPadAppDelegate;
///////////////////////////////////////
//Discription:This class is for the comic issue
///////////////////////////////////
@interface ComicissueViewController : UIViewController 
{
	IBOutlet UIButton           *home_Button;
	NSMutableString				*currentElementValue;
    ComiciPadAppDelegate		*appDelegate;
	NSMutableArray				*arrayForXmlfile;
}

-(IBAction)togohome:(id)argName;
@end
