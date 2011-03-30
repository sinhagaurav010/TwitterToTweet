//
//  DemoProjectAppDelegate.h
//  DemoProject
//
//  Created by CHROME INFOTECH  on 03/08/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
@interface DemoProjectAppDelegate : NSObject <UIApplicationDelegate>
{
#pragma mark Release all the objects in dealloc which are declared here
	//////============= Release all the objects in dealloc which are declared here=====================
	NSMutableArray         *matters; 
	UINavigationController *navigation;
    UIWindow               *window;
	sqlite3                *database;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

