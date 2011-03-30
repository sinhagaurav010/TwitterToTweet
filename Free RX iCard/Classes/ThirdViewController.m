    //
//  ThirdViewController.m
//  Free RX iCard
//
//  Created by J Brian Oliver on 12/14/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ThirdViewController.h"
#import <MapKit/MapKit.h>
#import <MapKit/MKReverseGeocoder.h>
#import <CoreLocation/CoreLocation.h>
#import "MyAnnotation.h"
@implementation ThirdViewController
@synthesize mapView;




// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	arrayForLongnitude		=	[NSMutableArray new];
	arrayForLatitude		=	[NSMutableArray new];
	
	[arrayForLatitude addObject:@"31.212"];
	[arrayForLatitude addObject:@"31.219"];
	[arrayForLatitude addObject:@"31.236"];
	
	[arrayForLongnitude addObject:@"121.46"];
	[arrayForLongnitude addObject:@"121.50"];
	[arrayForLongnitude addObject:@"121.44"];
	
	self.navigationItem.rightBarButtonItem = nil;
	UIButton* doneButton = [[UIButton alloc]initWithFrame:CGRectMake(250, 0.0, 60, 32)];
	[doneButton setBackgroundImage:[UIImage imageNamed:@"done.png"] forState:UIControlStateNormal];
	[doneButton addTarget:self action:@selector(doneButtonClick:) forControlEvents:UIControlEventTouchUpInside];
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:doneButton];
	
	mapView = [[MKMapView alloc]initWithFrame:CGRectMake(0, 0, 480, 300)];
	[self.view insertSubview:mapView atIndex:2];
	
	//mapView.showsUserLocation=TRUE;
	mapView.mapType=MKMapTypeStandard;
	[self.mapView setDelegate:self];
	
	/*Region and Zoom*/
	MKCoordinateRegion region;
	MKCoordinateSpan span;
	span.latitudeDelta=0.2;
	span.longitudeDelta=0.2;
	
	//	CLLocationCoordinate2D location1=mapView.userLocation.coordinate;
	for(int i=0;i<[arrayForLatitude count];i++)
	{
		location.latitude = [[arrayForLatitude objectAtIndex:i] floatValue];
		location.longitude = [[arrayForLongnitude objectAtIndex:i]floatValue];
		region.span=span;
		region.center=location;
		[self.mapView setRegion:region animated:TRUE];
		
		[self.mapView regionThatFits:region];
		self.mapView.showsUserLocation = TRUE;
		self.mapView.zoomEnabled = YES;
		MyAnnotation *addAnnotation = [[[MyAnnotation alloc] initWithCoordinate:location] retain];  
		[addAnnotation setTitle:@"The Pin Title"];  
		
		
		[self.mapView addAnnotation:addAnnotation]; 
		
		/*Geocoder Stuff*/
		self.mapView.showsUserLocation = TRUE;
		geoCoder		=		[[MKReverseGeocoder alloc] initWithCoordinate:location];
		geoCoder.delegate=self;
		[geoCoder start];
		
	}
	
    [super viewDidLoad];
}

- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFailWithError:(NSError *)error{
	NSLog(@"Reverse Geocoder Errored");
	
}

- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFindPlacemark:(MKPlacemark *)placemark
{
	mPlacemark=placemark;
	NSLog(@"mPlacemark%@",mPlacemark);
	location.latitude=40.814849;
	location.longitude=-73.622732;
	
	/*MyAnnotation *addAnnotation = [[[MyAnnotation alloc] initWithCoordinate:location] retain];  
	 NSLog(@"location%f",location.latitude);
	 [addAnnotation setTitle:@"The Pin Title"];  
	 //[addAnnotation setSubTitle:@"The pin subtitle goes here"];  
	 
	 [self.mapView addAnnotation:addAnnotation]; 
	 [self.mapView setDelegate:self];*/
}
/*
 -(MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>) annotation
 {
 
 NSLog(@"dvdsvds");
 MKPinAnnotationView *annView=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"currentloc"];
 annView.animatesDrop=TRUE;
 return annView;
 }*/
/*-MKPinAnnotationView *dropPin=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"venues"];
 
 UIButton *disclosureButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
 [disclosureButton addTarget:self action:@selector(mapCallOutPressed:) forControlEvents:UIControlEventTouchUpInside];
 
 dropPin.rightCalloutAccessoryView = disclosureButton;
 dropPin.animatesDrop = YES;
 dropPin.canShowCallout = YES;
 
 return dropPin;*/
//}
- (MKAnnotationView *)mapView:(MKMapView *)mapview viewForAnnotation:(id <MKAnnotation>)annotation
{
	NSString *string   =   mPlacemark.locality;
	NSLog(@"vdsv");
	NSLog(@"location-------------%f",annotation.coordinate.latitude);
	
	MKPinAnnotationView *annView = nil;
	(MKPinAnnotationView *)[mapview dequeueReusableAnnotationViewWithIdentifier:string];
	
	// If we have to, create a new view
	
	annView = [[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:string] autorelease];
	//MKPinAnnotationView *annView=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:string];  
	
    annView.canShowCallout = YES;  
	NSLog(@"AAN----%f",annView.frame.origin.x);
	NSLog(@"AAN----%f",annView.frame.origin.y);
	NSLog(@"location%f",location.latitude);
	
	
	//[annView setSelected:YES];  	
	
	annView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
	
	[annView setPinColor:MKPinAnnotationColorGreen];
	
    annView.calloutOffset = CGPointMake(-5, 5);
	annView.animatesDrop=TRUE; 
    return annView;
	
	
}




// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
