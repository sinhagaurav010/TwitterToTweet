//
//  MainMenuController.h
//  VOA
//
//  Created by Dharmendra Singh Kushwaha on 29/04/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailsPageController.h"
#import "Event_Object.h"
#import "Global.h"
#import "SplashScreenController.h"

#define NAVIGATION_BAR_COLOR [[UIColor alloc] initWithRed:.15 green:.33 blue:.55 alpha:1.0]


@interface UINavigationBar(CustomImage)
+ (void) initImageDictionary;
- (void) drawRect:(CGRect)rect;
- (void) setImage:(UIImage*)image;
@end



@interface MainMenuController : UIViewController<UITableViewDelegate,UITableViewDataSource> {
	UITableView *TableView;
	UIButton *infoButton;
	
	//Event_Object *myObject;
	NSInteger numbereOfRows;
	NSInteger sectionRows;
	NSInteger sectionNumber;
	
	UINavigationBar *navigationBar;
	NSTimer *nextTimer;
	NSTimer *previousTimer;
	
	UIActivityIndicatorView *spinner;

}

-(void)ArrayInitalization;
@end
