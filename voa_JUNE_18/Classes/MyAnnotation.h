//
//  MyAnnotation.h
//  VOA
//
//  Created by Dharmendra Singh Kushwaha on 02/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MKAnnotation.h>

@interface MyAnnotation : NSObject <MKAnnotation> 
{
	CLLocationCoordinate2D coordinate;
	NSString *title;
	NSString *subtitle;
}
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic,assign) NSString *title;
@property (nonatomic,assign) NSString *subtitle;


@end
