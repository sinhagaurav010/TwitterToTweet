//
//  MapShowController.h
//  VOA
//
//  Created by Dharmendra Singh Kushwaha on 02/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Event_Object.h"
#import "Global.h"

@interface MapShowController : UIViewController<MKMapViewDelegate> {

	MKMapView* mapView;
}
@property (nonatomic, retain) IBOutlet MKMapView* mapView;

@end
