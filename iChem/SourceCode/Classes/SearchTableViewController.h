//
//  SearchTableViewController.h
//  DemoProject
//
//  Created by CHROME INFOTECH  on 05/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
/////////////////////////////
/*@ Discription
 
 class for table search
 
 in this class ogs.xml is also parse
 
 */

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@class DemoProjectAppDelegate;

@interface SearchTableViewController : UIViewController {
	
	NSMutableString				*currentElementValue;
	IBOutlet UITableView		*tableFornaterial;
	NSMutableArray				*materiallist;/////////////For the value of cell
	sqlite3						*database;
	//NSString					*str1;
	DemoProjectAppDelegate      *appDelegate;
	NSMutableArray				*dataarrygv;////////////Used to take gevi number from table stoffen
	
}

@end
