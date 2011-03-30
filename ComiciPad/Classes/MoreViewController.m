    //
//  MoreViewController.m
//  ComiciPad
//
//  Created by CHROME INFOTECH  on 20/09/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MoreViewController.h"
#import  "CastViewController.h"
#import  "GalleryViewController.h"
@implementation MoreViewController

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{
	CGRect frameOfBackGroundimage				=   CGRectMake(0, 0, 768, 1024);
	UIImageView *backGroundimage				=	[[UIImageView alloc] initWithFrame:frameOfBackGroundimage];
	backGroundimage.backgroundColor				=	[UIColor blackColor];
    [self.view addSubview:backGroundimage];
	
	homeButton									= [[UIButton alloc]initWithFrame:CGRectMake(670, 30, 103, 42)];
	[homeButton addTarget:self action:@selector(homeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
	[homeButton setTitle:@"HOME"  forState:(UIControlState)UIControlStateNormal];
	homeButton.font								= [UIFont boldSystemFontOfSize:25];
	[self.view addSubview:homeButton];
    
	
	UILabel *labelTitle							=	[[UILabel alloc]initWithFrame:CGRectMake(20,40, 398, 30)];
	labelTitle.text								=	@"More";
	//labelTitle.text							=[titlestrng stringByAppendingFormat:[[arrayOfDictionaryforvideo objectAtIndex:i]objectForKey:@"title"]];	;
	labelTitle.textColor						= [UIColor whiteColor];
	labelTitle.backgroundColor					= [UIColor clearColor];
	labelTitle.font								= [UIFont boldSystemFontOfSize:25];
	[self.view addSubview:labelTitle];
    
	UILabel *labelExtra							=	[[UILabel alloc]initWithFrame:CGRectMake(20,150, 398, 30)];
	labelExtra.text								=	@"Extras";
	//labelTitle.text							=[titlestrng stringByAppendingFormat:[[arrayOfDictionaryforvideo objectAtIndex:i]objectForKey:@"title"]];	;
	labelExtra.textColor						= [UIColor whiteColor];
	labelExtra.backgroundColor					= [UIColor clearColor];
	labelExtra.font								= [UIFont boldSystemFontOfSize:25];
	[self.view addSubview:labelExtra];
	
	//////////////////////////////for the cast button
	UIButton *buttonForComics					= [[UIButton alloc] initWithFrame: CGRectMake(20,210,220,230)];
	NSString    *imageName						=	@"cast.png";
	[buttonForComics setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
	[buttonForComics addTarget:self action:@selector(getinocast:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:buttonForComics];
	
	UILabel *labelCharacter						=	[[UILabel alloc]initWithFrame:CGRectMake(278,210, 398, 30)];
	labelCharacter.text							=	@"Concept Art";
	//labelTitle.text							=[titlestrng stringByAppendingFormat:[[arrayOfDictionaryforvideo objectAtIndex:i]objectForKey:@"title"]];	;
	labelCharacter.textColor					= [UIColor whiteColor];
	labelCharacter.backgroundColor				= [UIColor clearColor];
	labelCharacter.font							= [UIFont boldSystemFontOfSize:25];
	[self.view addSubview:labelCharacter];
	
	
	UITextView *textView						= [[UITextView alloc] initWithFrame:CGRectMake(270,246, 450, 162)];
	textView.textColor							= [UIColor whiteColor];
	textView.font								= [UIFont fontWithName:@"Arial" size:25];
	//textView.delegate = self;
	textView.backgroundColor					= [UIColor clearColor];
	textView.text								= @"Description: Want to know more about your favorite heros and villians? Find it right here! Learn the origin and history of Blade of the Last Gods!";	
	textView.editable=NO;
	textView.scrollEnabled						=NO;

	[self.view addSubview:textView];
	//////////////////////////////////////////////////////////////////
	
	//////////////////////////////for the gallery button
    UIButton *buttonFoGallery					= [[UIButton alloc] initWithFrame: CGRectMake(20,487,220,230)];
	imageName									=		@"gallery.png";
	[buttonFoGallery setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
	[buttonFoGallery addTarget:self action:@selector(getintogallery:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:buttonFoGallery];
	
	UILabel *labelGallery						=	[[UILabel alloc]initWithFrame:CGRectMake(278,487, 398, 30)];
	labelGallery.text							=	@"Gallery";
	//labelTitle.text							=[titlestrng stringByAppendingFormat:[[arrayOfDictionaryforvideo objectAtIndex:i]objectForKey:@"title"]];	;
	labelGallery.textColor						= [UIColor whiteColor];
	labelGallery.backgroundColor				= [UIColor clearColor];
	labelGallery.font							= [UIFont boldSystemFontOfSize:25];
	[self.view addSubview:labelGallery];
	
	
	UITextView *textViewGallery					= [[UITextView alloc] initWithFrame:CGRectMake(270,523, 450, 162)];
	textViewGallery.textColor					= [UIColor whiteColor];
	textViewGallery.font						= [UIFont fontWithName:@"Arial" size:25];
	//textView.delegate = self;
	textViewGallery.backgroundColor				= [UIColor clearColor];
	textViewGallery.text						= @"Description: ANME takes you inside of Blade of the Last Gods with behind the scenes art, story boards, and more in the Gallery!";	
	textViewGallery.editable					= NO;
	textViewGallery.scrollEnabled				= NO;
	[self.view addSubview:textViewGallery];
	//////////////////////////////////////////////////////////////////

	UIButton *buttonFowallpaper					= [[UIButton alloc] initWithFrame: CGRectMake(20,759,220,230)];
	imageName									=		@"Wallpaper2_thumb.jpg";
	[buttonFowallpaper setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
	[buttonFowallpaper addTarget:self action:@selector(getintoWallpaper:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:buttonFowallpaper];
	
	UILabel *labelWallpaper						=	[[UILabel alloc]initWithFrame:CGRectMake(278,759, 398, 30)];
	labelWallpaper.text							=	@"Wallpapers";
	//labelTitle.text							=[titlestrng stringByAppendingFormat:[[arrayOfDictionaryforvideo objectAtIndex:i]objectForKey:@"title"]];	;
	labelWallpaper.textColor					= [UIColor whiteColor];
	labelWallpaper.backgroundColor				= [UIColor clearColor];
	labelWallpaper.font							= [UIFont boldSystemFontOfSize:25];
	[self.view addSubview:labelWallpaper];
	
	
	UITextView *textViewWallpaper					= [[UITextView alloc] initWithFrame:CGRectMake(270,795, 450, 162)];
	textViewWallpaper.textColor					= [UIColor whiteColor];
	textViewWallpaper.font						= [UIFont fontWithName:@"Arial" size:25];
	//textView.delegate = self;
	textViewWallpaper.backgroundColor			= [UIColor clearColor];
	textViewWallpaper.text						=@"Description: Decorate your device with cool art from ANME.TV! boards, and more in the Gallery!";	
	textViewWallpaper.editable					=NO;
	textViewWallpaper.scrollEnabled						=NO;
	[self.view addSubview:textViewWallpaper];
	if(backGroundimage)
	{
		[backGroundimage release];
		backGroundimage = nil;
	}
	if(labelTitle)
	{
		[labelTitle release];
		labelTitle = nil;
	}
	if(labelExtra)
	{
		[labelExtra release];
		labelExtra = nil;
	}	
	if(buttonForComics)
	{
		[buttonForComics release];
		buttonForComics = nil;
	}
	if(labelCharacter)
	{
		[labelCharacter release];
		labelCharacter = nil;
	}
	if(textView)
	{
		[textView release];
		textView = nil;
	}
	if(buttonFoGallery)
	{
		[buttonFoGallery release];
		buttonFoGallery = nil;
	}
	if(labelGallery)
	{
		[labelGallery release];
		labelGallery = nil;
	}
	if(textViewGallery)
	{
		[textViewGallery release];
		textViewGallery = nil;
	}
	if(buttonFowallpaper)
	{
		[buttonFowallpaper release];
		buttonFowallpaper = nil;
	}
	if(labelWallpaper)
	{
		[labelWallpaper release];
		labelWallpaper = nil;
	}
	if(textViewWallpaper)
	{
		[textViewWallpaper release];
		textViewWallpaper = nil;
	}
	
	//NSString    *imageName					=	@"001mai Lin.jpg";
	[super viewDidLoad];
}
////////////////////////////////////////////////////////////////////////


////////////////////////If user want to go to home button
-(IBAction)homeButtonClick:(id)sender
{
	//ComicViewController *obj			=	[ComicViewController new];
	//[self.navigationController pushViewController:obj animated:YES];
	[self.navigationController popViewControllerAnimated:YES];
}
////////////////////////////////////////////////////////////////////////


////////////////////////If user have choosen gallery button
-(IBAction)getintogallery:(id)sender
{
	GalleryViewController *galleryViewControllerobj		=		[GalleryViewController new];
	[self.navigationController pushViewController:galleryViewControllerobj animated:YES];
	if(galleryViewControllerobj)
	{
		[galleryViewControllerobj release];
		galleryViewControllerobj = nil;
	}
}
////////////////////////////////////////////////////////////////////////


////////////////////////If user have choosen cast button
-(IBAction)getinocast:(id)sender{
	CastViewController *castViewControllerobj		=		[CastViewController new];
	[self.navigationController pushViewController:castViewControllerobj animated:YES];
	if(castViewControllerobj)
	{
		[castViewControllerobj release];
		castViewControllerobj = nil;
	}

}
////////////////////////////////////////////////////////////////////////////////////////////////


////////////////////////If user have choosen wallpaper button
-(IBAction)getintoWallpaper:(id)sender{
	WallpaperViewController *wallpaperViewControllerobj		=		[WallpaperViewController new];
	[self.navigationController pushViewController:wallpaperViewControllerobj animated:YES];
	if(wallpaperViewControllerobj)
	{
		[wallpaperViewControllerobj release];
		wallpaperViewControllerobj = nil;
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return NO;
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	if(homeButton)
	{
		[homeButton release];
		homeButton = nil;
	}
    [super dealloc];
}


@end
