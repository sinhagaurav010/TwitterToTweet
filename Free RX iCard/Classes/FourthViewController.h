//
//  FourthViewController.h
//  Free RX iCard
//
//  Created by J Brian Oliver on 12/14/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>


@interface FourthViewController : UIViewController <MFMailComposeViewControllerDelegate> {

}

-(IBAction)sendMail;

@end
