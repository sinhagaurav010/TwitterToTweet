//
//  MyAnnotation.h
//  swiftGO
//
//  Created by Dharmendra Singh Kushwaha on 23/01/10.
//  Copyright ChromeInfotech 2010. All rights reserved.
//  mail:dharmendras@chromeinfotech.com
//


#import <Foundation/Foundation.h>
#import <MapKit/MKAnnotation.h>


 @interface MyAnnotation : NSObject <MKAnnotation> 
	{
		CLLocationCoordinate2D coordinate;
		NSInteger ann_tag;
		NSString *title;
		NSString *subtitle;
		NSString* userData;


	}
 @property (nonatomic, assign) CLLocationCoordinate2D coordinate;
 @property (nonatomic,assign)	NSInteger ann_tag;
 @property (nonatomic,assign) NSString *title;
@property (nonatomic,assign) NSString *subtitle;
@property (nonatomic,assign) NSString *userData;




@end
