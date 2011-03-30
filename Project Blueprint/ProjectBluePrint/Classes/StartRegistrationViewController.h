//
//  StartRegistrationViewController.h
//  ProjectBluePrint
//
//  Created by gaurav sinha on 02/02/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SaveTheFieldController.h"
#import <AVFoundation/AVFoundation.h>
#import "ASIFormDataRequest.h"
#import "ASIHTTPRequest.h"
#import "SigningListViewController.h"
#import "MBProgressHUD.h"

@interface StartRegistrationViewController : UIViewController <MBProgressHUDDelegate>
{
	////For Asihttp request
	ASIHTTPRequest *getDeviceSessionRequest;
	UIActivityIndicatorView *spinner;   
	IBOutlet UIButton *buttonLogin;
	IBOutlet UITextField *textFieldUserName;
	IBOutlet UITextField *textFieldPassword;
}
-(IBAction)PressToLogin:(id)sender;
-(void)alertView:(NSString*)string;

@end
