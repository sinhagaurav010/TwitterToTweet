//
//  SubDiscriptionViewController.h
//  DemoProject
//
//  Created by CHROME INFOTECH  on 06/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
////////////////////////////////////////////
///////this Class tells the discription of material





#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface SubDiscriptionViewController : UIViewController {
	IBOutlet UIButton       *leftButton;
	IBOutlet UILabel        *mylabel;
	IBOutlet UIWebView	 	*web_Stof;
	IBOutlet UIWebView		*web_Gevaar;
	IBOutlet UIWebView		*web_Veiligheid;
	IBOutlet UIWebView		*web_Bronbestrijding;
	IBOutlet UIWebView		*web_Eerstehulp;
	IBOutlet UIScrollView	*myscroll;
	IBOutlet UIButton		*button_Stof;
	IBOutlet UIButton		*button_Gevaar;
	IBOutlet UIButton		*button_Veiligheid;
    IBOutlet UIButton		*button_Bronbestrijding;
	IBOutlet UIButton		*button_Eerste_hulp;
    IBOutlet UIButton		*button_Stof1;
	IBOutlet UIButton		*button_Gevaar1;
	IBOutlet UIButton		*button_Veiligheid1;
    IBOutlet UIButton		*button_Bronbestrijding1;
	IBOutlet UIButton		*button_Eerste_hulp1;
	IBOutlet UILabel		*label_right;
	IBOutlet UILabel		*label_left;
	IBOutlet UILabel		*label_stof;	//IBOutlet UIButton		*button_left;
	IBOutlet UIButton		*button_right;
	IBOutlet UILabel		*label_first;
	IBOutlet UILabel		*label_last;
	sqlite3 *database;
	IBOutlet UILabel        *label_gevaar;
	IBOutlet  UIWebView    *web_Gevaar_2;
	IBOutlet  UIWebView    *web_bk;
}
-(IBAction)pressofleftbutton:(id)argName;
-(IBAction)pressofrightbutton:(id)argName;
-(IBAction)pressstof:(id)argName;
-(IBAction)pressGevaar:(id)argName;
-(IBAction)pressVeiligheid:(id)argName;
-(IBAction)pressBronbestrijding:(id)argName;
-(IBAction)pressEerstehulp:(id)argName;

@end
