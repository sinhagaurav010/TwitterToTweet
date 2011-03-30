//
//  ProjectBluePrintAppDelegate.h
//  ProjectBluePrint
//
//  Created by gaurav sinha on 28/01/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProjectBluePointAppDelegate : NSObject <UIApplicationDelegate> 
{
	IBOutlet UINavigationController *navigation;
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

