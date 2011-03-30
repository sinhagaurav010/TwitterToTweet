//
//  ZoekhulpViewController.h
//  DemoProject
//
//  Created by CHROME INFOTECH  on 03/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
//////////////////////////////////////////
////////////////////
/*@ Discription this class for the Zoekhulp  */




#import <UIKit/UIKit.h>


@interface ZoekhulpViewController : UIViewController {
	IBOutlet UIButton		*button_UN;
	IBOutlet UIButton		*button_GV;
	IBOutlet UILabel		*lable_un;
	IBOutlet UILabel		*lable_gevi;
	IBOutlet UILabel		*lable_un2;
    IBOutlet UIScrollView	*myScroll;
	IBOutlet UIWebView		*myWebfrUN;
	IBOutlet UIWebView      *myWebfrGV;
	IBOutlet UIButton		*rightButton;
}
-(IBAction)button_unpress:(id)argName;
-(IBAction)rightButtonpress:(id)argName;
-(IBAction)button_gvpress:(id)argName;
@end
