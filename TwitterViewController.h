//
//  TwitterViewController.h
//  TwitterToTwit
//
//  Created by gaurav sinha on 17/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//  Company VINSOL
// Email:gaurav.sinha@vinsol.com



#import <UIKit/UIKit.h>
#import "TwitterRushViewController.h"

@interface TwitterViewController : UIViewController {
	IBOutlet UIButton *buttonToTwit;
}
-(IBAction)clickToTwit:(id)sender;
@end
