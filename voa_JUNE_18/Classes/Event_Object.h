//
//  Event_Object.h
//  VOA
//
//  Created by Dharmendra Singh Kushwaha on 03/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Event_Object : NSObject {
	
	NSString *event_Date;
	NSString *event_DayName;
	NSString *event_Title;
	NSString *event_Starttime;
	NSString *event_Endtime;
	NSString *event_EventImage;
	NSString *event_OrganizationImage;
	NSString *event_OrganizationFooter;
	NSString *event_Description;
	NSString *event_Organization;
	NSString *event_Location;
	NSString *event_Location_Name;
	NSString *event_Location_Latitude;
	NSString *event_Location_Longitude;
	NSString *url_String;
}

@property(nonatomic,copy)NSString *event_Date;
@property(nonatomic,copy)NSString *event_DayName;
@property(nonatomic,copy)NSString *event_Title;
@property(nonatomic,copy)NSString *event_Starttime;
@property(nonatomic,copy)NSString *event_Endtime;
@property(nonatomic,copy)NSString *event_EventImage;
@property(nonatomic,copy)NSString *event_OrganizationImage;
@property(nonatomic,copy)NSString *event_OrganizationFooter;
@property(nonatomic,copy)NSString *event_Description;
@property(nonatomic,copy)NSString *event_Organization;
@property(nonatomic,copy)NSString *event_Location_Name;
@property(nonatomic,copy)NSString *event_Location_Latitude;
@property(nonatomic,copy)NSString *event_Location_Longitude;
@property(nonatomic,copy)NSString *url_String;

@end
