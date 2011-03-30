//
//  AdverismentViewController.h
//  ProjectBluePrint
//
//  Created by gaurav sinha on 07/02/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIFormDataRequest.h"
#import "ASIHTTPRequest.h"
#import "Global.h"
#import "SharedInstance.h"
#import "SaveTheFieldController.h"
#import "MBProgressHUD.h"
@interface AdverismentViewController : UIViewController<MBProgressHUDDelegate,UIWebViewDelegate> 
{
	ASIHTTPRequest *getDeviceSessionRequest;
	UIActivityIndicatorView *spinner; 
	MBProgressHUD *HUD;
	SharedInstance *share;
	BOOL modeForWeb;
	NSString *stringUrlWeb;
	IBOutlet UIWebView *webView;
}
-(void)ASIHttpCall:(NSString*)stringUrl:(NSMutableData*)postData;
+ (UIImage *)captureView: (UIView *)view inSize: (CGSize)size;

@end
