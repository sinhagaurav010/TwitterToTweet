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
#import "MGTwitterEngine.h"
#import "XMLParser.h"
#import "AsyncImageView.h"

@interface TwitterViewController : UIViewController<UITableViewDelegate,UITableViewDataSource> {
	IBOutlet UIButton *buttonToTwit;
    TreeNode *root;
    IBOutlet UITableView *_tableView;
}
-(IBAction)clickToTwit:(id)sender;
-(void)friends_timeline_callback:(NSData *)data;

@end
