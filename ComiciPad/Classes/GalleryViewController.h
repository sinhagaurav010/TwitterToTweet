//
//  GalleryViewController.h
//  ComiciPad
//
//  Created by CHROME INFOTECH  on 20/09/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
////////////////////////////////////////
//@Discription:This class is for the gallery section of more button
//////////////////////////////////////////

#import <UIKit/UIKit.h>
#import "Global.h"
#import   "FullImgeViewController.h"
@interface GalleryViewController : UIViewController {
	
	IBOutlet UIButton	*homeButton;
	NSMutableString		*currentElementValue;
	NSArray				*ComponentOfConceptart;
	NSArray				*ComponentOfConceptartThumb;
	NSArray				*ComponentOfProductionart;
	NSArray				*ComponentOfProductionartThumb;
	NSArray				*ComponentOfPromoart;
	NSArray				*ComponentOfPromoartThumb;
	
}
@end
