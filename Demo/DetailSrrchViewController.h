//
//  DetailSrrchViewController.h
//  RetailStore
//
//  Created by gaurav sinha on 03/01/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DetailSrrchViewController : UIViewController 
{
	IBOutlet UITextView *des;
	IBOutlet  UILabel   *lab_title;
	IBOutlet UILabel   *lab_updt;
	IBOutlet  UILabel  *price_label;
	IBOutlet  UIImageView *image_vi;
	IBOutlet  UIButton  *buttonBuy;
}
-(IBAction)pressToBuy:(id)sender;
@end
