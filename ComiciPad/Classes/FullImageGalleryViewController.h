//
//  FullImageGalleryViewController.h
//  ComiciPad
//
//  Created by CHROME INFOTECH  on 23/09/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
////////////////////////////////////////
//@Discription:This class is to show the full image of the thumbnail of wallpaper
//////////////////////////////////////////

@interface FullImageGalleryViewController : UIViewController {
	UIButton		*homeButton;
	NSString		*imageName;
	CGPoint			finalPosition	;
	CGPoint			currentPosition;
	UIScrollView    *scrollView	;
	int page;
}

@end
