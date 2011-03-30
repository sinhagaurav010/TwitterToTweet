//
//  ThirdViewController.h
//  Free RX iCard
//
//  Created by J Brian Oliver on 12/14/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ThirdViewController : UIViewController {
	IBOutlet MKMapView *mapView;
	MKReverseGeocoder *geoCoder;
	MKPlacemark *mPlacemark;
	CLLocationCoordinate2D location;
	UIButton *homeButton;
	NSMutableArray  *arrayForLatitude;
	NSMutableArray  *arrayForLongnitude;
}

@property(nonatomic,retain)IBOutlet MKMapView *mapView;


@end
