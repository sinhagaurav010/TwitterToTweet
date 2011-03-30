//
//  SigningListViewController.h
//  ProjectBluePrint
//
//  Created by gaurav sinha on 02/02/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "ASIFormDataRequest.h"
#import "ASIHTTPRequest.h"
#import "SharedInstance.h"


@interface SigningListViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
{
	ASIHTTPRequest *getDeviceSessionRequest;
	UITableView *table_View;
	NSInteger count;
	UIActivityIndicatorView *spinner;  
	NSMutableArray *arrayList;
	NSMutableArray *arrayRegister;
	///UITableViewCell *cell;
	NSMutableDictionary *dictionaryList;
	BOOL _fromCell;
	NSMutableArray *arraySignedId;
}
-(void)ASIHttpCall:(NSString*)stringUrl:(NSMutableData*)postString;
//@property (nonatomic, retain) 	UITableViewCell *cell;


@end
