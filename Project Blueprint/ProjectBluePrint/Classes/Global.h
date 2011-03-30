//
//  Global.h
//  ProjectBluePrint
//
//  Created by gaurav sinha on 02/02/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#define BASAUTH @"{\"email\":\"testuser@ef3.com\",\"password\":\"password1\"}"
#define URLFOR @"https://bss_device:bss_password@bluepoint-staging.heroku.com/session/get_device_session.json"
#define EMAILTESTING @"{\"email\":\"testuser@ef3.com\",\"password\":\"password1\"}"
#define LOG 1
#define CONTENT @"Content-Type"
#define APP @"application/json"
#define ACCEPT @"Accept"
#define kScreenWidthPortrait 768
#define kScreenHeightPortrait 1004
#define SESSIONID @"sessionID"
#define kScreenWidthLandscape 1024
#define kScreenHeightLandscape 748
#define SIGN @"{\"uid\":\"7CC9C853C22593FC50EFD06D056F41B4094D6D5B091120945F9AEDED30E31A7B\",\"lat\":\"38.897096\",\"lng\":\"-77.036545\"}"
/*locationManager = [[CLLocationManager alloc] init];
locationManager.delegate = self;
locationManager.distanceFilter = kCLDistanceFilterNone; // whenever we move
locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
[locationManager startUpdatingLocation];
 - (void)locationManager:(CLLocationManager *)manager
 didUpdateToLocation:(CLLocation *)newLocation
 fromLocation:(CLLocation *)oldLocation
 {
 int degrees = newLocation.coordinate.latitude;
 double decimal = fabs(newLocation.coordinate.latitude - degrees);
 int minutes = decimal * 60;
 double seconds = decimal * 3600 - minutes * 60;
 NSString *lat = [NSString stringWithFormat:@"%d° %d' %1.4f\"",
 degrees, minutes, seconds];
 latLabel.text = lat;
 degrees = newLocation.coordinate.longitude;
 decimal = fabs(newLocation.coordinate.longitude - degrees);
 minutes = decimal * 60;
 seconds = decimal * 3600 - minutes * 60;
 NSString *longt = [NSString stringWithFormat:@"%d° %d' %1.4f\"",
 degrees, minutes, seconds];
 longLabel.text = longt;
 }*/