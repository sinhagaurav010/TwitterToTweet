//
//  VideoViewController.h
//  ComiciPad
//
//  Created by CHROME INFOTECH  on 09/09/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//	Email  :gauravs@chromeinfotech
//
///////////////////////////////////////////////////
//@Discription
///This class is for the video section of the project
/////////////////////////////////////////////////////


#import <UIKit/UIKit.h>
#import	"Global.h"
#import <MediaPlayer/MediaPlayer.h>
@interface VideoViewController : UIViewController {
	
	BOOL						touch;
	UIButton					*homeButton;
	NSMutableString				*currentElementValue;
	MPMoviePlayerController		*videoPlayer;
	NSURL						*videoURL;
	CGRect						frameOfMovie;
	UIWindow					* moviePlayerWindow;
	UIButton					* overlayFrDoneButton;
	UIButton					* overlayFrBckButton;
	UIButton					* overlayNxtButton;
	UIScrollView				*scrollView	;
	int							videoNum;
	CGPoint						currentPosition;
	CGRect						frameOfAnimation;
	UIView						*myview	;
	NSTimer						*timerFade;
	BOOL landmode;
	BOOL portrMode;
	NSMutableArray    *arrayForText;
}

@end
