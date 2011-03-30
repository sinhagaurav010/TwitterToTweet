//
//  VOAAppDelegate.m
//  VOA
//
//  Created by Dharmendra Singh Kushwaha on 29/04/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "VOAAppDelegate.h"

@implementation VOAAppDelegate

@synthesize window,navigationController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
	[self init_location_manager];
	navigationController = [[UINavigationController alloc]initWithRootViewController:[[SplashScreenController alloc]init]];
	[window addSubview:navigationController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}

-(void)init_location_manager
{
	locationManager = [[CLLocationManager alloc] init];
	locationManager.delegate=self;
	locationManager.distanceFilter = kCLDistanceFilterNone;
	locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
	[locationManager startUpdatingLocation];
}

#pragma mark location manager
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
	
	CGFloat lati = newLocation.coordinate.latitude;
	lat1 = [[NSString alloc] initWithFormat:@"%f",lati];
	
	
	CGFloat longi = newLocation.coordinate.longitude ;
	longt1 = [[NSString alloc] initWithFormat:@"%f",longi];
	
	NSLog(@"latitude %@",lat1);
	NSLog(@"longitude %@",longt1);
	
	
#if (TARGET_IPHONE_SIMULATOR)
	lat1 = @"37.279990699999999";
	longt1 = @"121.1587983";
#endif
	
	
}


@end