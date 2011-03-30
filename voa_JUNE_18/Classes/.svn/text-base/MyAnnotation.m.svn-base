//
//  MyAnnotation.m
//  VOA
//
//  Created by Dharmendra Singh Kushwaha on 02/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MyAnnotation.h"

@implementation MyAnnotation

@synthesize coordinate,title,subtitle;

-init
{
	return self;
}

-initWithCoordinate:(CLLocationCoordinate2D)inCoord
{
	coordinate = inCoord;
	return self;
}

-(void)dealloc 
{
	[title release];
	[subtitle release];
	[super dealloc];
}

@end
