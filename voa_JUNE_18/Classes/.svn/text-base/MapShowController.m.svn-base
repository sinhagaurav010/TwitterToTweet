//
//  MapShowController.m
//  VOA
//
//  Created by Dharmendra Singh Kushwaha on 02/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MapShowController.h"
#import "MyAnnotation.h"

@implementation MapShowController
@synthesize mapView;

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}


/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	
	self.navigationItem.title = @"Map";
	mapView = [[MKMapView alloc]initWithFrame:CGRectMake(0.0, 0.0 ,self.view.bounds.size.width, self.view.bounds.size.height)];
	[self.view insertSubview:mapView atIndex:1];
	
	CLLocationCoordinate2D loc_coord; 
	
	loc_coord.latitude = [globalObject.event_Location_Latitude floatValue];
	loc_coord.longitude = [globalObject.event_Location_Longitude floatValue];
	
	MKCoordinateRegion region;
	MKCoordinateSpan span;
	span.latitudeDelta = 0.0500;
	span.longitudeDelta = 0.0500;
	region.span=span;
	region.center=loc_coord;
	[self.mapView setMapType:MKMapTypeStandard];
	[self.mapView setRegion:region animated:TRUE];
	[self.mapView regionThatFits:region];
	//self.mapView.showsUserLocation = TRUE;
	self.mapView.zoomEnabled = YES;
	
	MyAnnotation *ann = [[MyAnnotation alloc] initWithCoordinate:loc_coord];
	//[ann setTitle:@"Title"];
	//[ann setSubtitle:@"Subtitle"];
	[self.mapView addAnnotation:ann];
	 
	
	[self.mapView setDelegate:self];
	
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//Map View delegates methods

#pragma mark -
#pragma mark MKMapViewDelegate methods

- (MKAnnotationView *)mapView:(MKMapView *)mapview viewForAnnotation:(id <MKAnnotation>)annotation {
	MKAnnotationView *my_MKAnnotationView=nil;
	
	if(annotation == self.mapView.userLocation)
	{
		return my_MKAnnotationView;
	}
	else {
		MyAnnotation *myAnnotation = (MyAnnotation *)annotation;
		MKPinAnnotationView *newAnnotation = [[MKPinAnnotationView alloc] initWithAnnotation:myAnnotation reuseIdentifier:@"userloc"];
		newAnnotation.pinColor = MKPinAnnotationColorRed;
		newAnnotation.animatesDrop = TRUE; 
		newAnnotation.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
		[newAnnotation setEnabled:YES];
		[newAnnotation setCanShowCallout:YES];
		return newAnnotation;
		
		
	}
	
	return my_MKAnnotationView;
}


- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views 
{	
	
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
	if ([control isKindOfClass:[UIButton class]]) {}	
}


- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated 
{
	MKCoordinateRegion region;
	CLLocationCoordinate2D centerCoordinate =self.mapView.region.center;
	region.center= centerCoordinate;
	
	//NSLog(@"Latitude %f, Longitude%f",centerCoordinate.latitude, centerCoordinate.longitude);
}



// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
