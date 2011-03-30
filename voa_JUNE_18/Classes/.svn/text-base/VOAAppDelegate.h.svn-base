//
//  VOAAppDelegate.h
//  VOA
//
//  Created by Dharmendra Singh Kushwaha on 29/04/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SplashScreenController.h"
#import "Global.h"
#import <CoreLocation/CoreLocation.h>

@interface VOAAppDelegate : NSObject <UIApplicationDelegate,CLLocationManagerDelegate> {
	UIWindow *window;
	UINavigationController *navigationController;
	
	CLLocationManager *locationManager;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

-(void)init_location_manager;
@end

