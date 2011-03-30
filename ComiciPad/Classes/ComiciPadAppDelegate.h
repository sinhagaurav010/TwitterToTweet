//
//  ComiciPadAppDelegate.h
//  ComiciPad
//
//  Created by CHROME INFOTECH  on 06/09/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ComiciPadAppDelegate : NSObject <UIApplicationDelegate> {
	UINavigationController *navigation;
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

