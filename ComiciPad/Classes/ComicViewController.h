//
//  ComicViewController.h
//  ComiciPad
//
//  Created by CHROME INFOTECH  on 06/09/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ComicViewController : UIViewController {
	
	IBOutlet UIButton *comic_Button;
	IBOutlet UIButton *video_Button;
	IBOutlet UIButton *game_Button;
	IBOutlet UIButton *more_Button;
	

}

-(IBAction)Presscomicbutton:(id)argName;
-(IBAction)Pressgamebutton:(id)argName;
-(IBAction)Pressvideobutton:(id)argName;
-(IBAction)Pressmorebutton:(id)argName;



@end
