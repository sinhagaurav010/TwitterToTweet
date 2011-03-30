//
//  NumberOfitemViewController.h
//  DemoProject
//
//  Created by CHROME INFOTECH  on 12/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
///////////////////////////////
/*@discription:
 this class show how many item are alike
 there is table to show the same item
 */




@interface NumberOfitemViewController : UIViewController {
	
	IBOutlet UITableView *myTable;
	NSMutableArray       *listOfItems;
	
}

@end
