//
//  StoffenlijistViewController.h
//  DemoProject
//
//  Created by CHROME INFOTECH  on 03/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
#import "Global.h"
/*@Discription:
 This class belong to stoffenlijist view
 in this class there is two table which is controlled by tag one table is for 
 section and other is simple in which search result appear with  every entry
 */



@interface StoffenlijistViewController : UIViewController 


{
	
	IBOutlet UISearchBar	*search_item;
	IBOutlet UITableView	*table_stofen;/////////////for the section table
	IBOutlet UITableView	*table_stofen_2;///////////////for simple table in which search result appear with  every entry
	NSMutableArray			*resultRow;  ///////////this array will have selected row result
	NSInteger				tag;      /////////Tag to check when section table(=0) is there or simple table is there(=1) 
	sqlite3					*database;
}



@property (nonatomic, retain)IBOutlet UITableView *table_stofen;
@property (nonatomic, retain)IBOutlet UITableView *table_stofen_2;
@end
