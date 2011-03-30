//
//  SharedInstance.h
//  MyappFinder
//
//  Created by gaurav sinha on 06/02/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SharedInstance : NSObject 
{
	NSUInteger board[100];
	NSMutableArray *arrayShared;
}
+ (SharedInstance *) sharedInstance;
-(void)settheMutablearray:(NSMutableArray*)array;
-(NSMutableArray*)gettheArray;
- (NSUInteger) getFieldValueAtPos:(NSUInteger)x;
- (void) setFieldValueAtPos:(NSUInteger)x ToValue:(NSUInteger)newVal;

@end
