//
//  SaveTheFieldController.h
//  ProjectBluePrint
//
//  Created by gaurav sinha on 02/02/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Global.h"

@interface SaveTheFieldController : NSObject {

}
+(BOOL)CheckingTheExistenceOfKey;
+(NSString *)parseTheJSON:(NSString*)stringToParse;
+(void)saveTheSessionId:(NSString*)string;
+(NSString*)getTheSessionId;
+(NSMutableDictionary*)parseTheJSN:(NSString*)string;
+(NSURLRequest*)ReturnNSURL:(NSString*)stringURL;


@end
