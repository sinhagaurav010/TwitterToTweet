//
//  LoginViewController.h
//  ProjectBluePrint
//
//  Created by gaurav sinha on 28/01/11.
//  Copyright 2011 Vinsol. All rights reserved.
//  Email:gaurav.sinha@vinsol.com

#import <UIKit/UIKit.h>


@interface LoginViewController : UIViewController 
{
	IBOutlet UIButton  *ContinueButton;
	IBOutlet UIButton  *ReregisterButton;
}

-(IBAction)ClickToContinue:(id)sender;
-(IBAction)ClickToReregister:(id)sender;
@end
