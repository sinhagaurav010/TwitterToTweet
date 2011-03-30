//
//  InsidecomicsViewController.h
//  ComiciPad
//
//  Created by CHROME INFOTECH  on 07/09/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
////////////////////////////////
//Discription
//This class is for the pages of the comics
//In this class page curling and uncurling effect is there
//////////////////////////


#import <UIKit/UIKit.h>
#import "Global.h"
#import <QuartzCore/QuartzCore.h>

@class InsidecomicsViewController;



@interface InsidecomicsViewController : UIViewController {
	
	BOOL			click;
	UIButton		* homeButton;
	UIButton		* bookMark	;
	NSTimer			*timerFade		;
	UIView			*subView;
	CGPoint			finalPosition	;
	CGPoint			currentPosition;	
	NSMutableArray  *arrayForStorypages;
	int				touch	;
	UIImageView		*imageview1	;
	UIImageView		*imageview2;	
	CGRect			frameOfAnimation;
	UIView			*viewForPages	;
	CATransition	*transitionCurling	;
	CATransition	*transitionUncurling;
	//NSTimer			*timeToViewDown;
}

@end
