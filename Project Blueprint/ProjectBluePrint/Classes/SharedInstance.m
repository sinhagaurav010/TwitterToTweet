//
//  SharedInstance.m
//  MyappFinder
//
//  Created by gaurav sinha on 06/02/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SharedInstance.h"


@implementation SharedInstance
static SharedInstance *_sharedInstance;

-init
{
	if (self = [super init])
	{
		// custom initialization
		//memset(board, 0, sizeof(board));
	}
	return self;
}
+ (SharedInstance *) sharedInstance
{
	if (!_sharedInstance)
	{
		_sharedInstance = [[SharedInstance alloc] init];
	}
	
	return _sharedInstance;
}

- (NSUInteger) getFieldValueAtPos:(NSUInteger)x
{
	return board[x];
}
/////Set the nsmutable array which has got from the parsing
-(void)settheMutablearray:(NSMutableArray*)array
{
	arrayShared = [NSMutableArray new];
	arrayShared = array;
}

//return the array which was parsed
-(NSMutableArray*)gettheArray
{
	return arrayShared;
}


///////At 1 -cell number is stored of nearby when user is clicked to find its details
- (void) setFieldValueAtPos:(NSUInteger)x ToValue:(NSUInteger)newVal
{
	board[x] = newVal;
}

@end
