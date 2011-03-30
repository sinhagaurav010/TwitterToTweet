    //
//  FullImageGalleryViewController.m
//  ComiciPad
//
//  Created by CHROME INFOTECH  on 23/09/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "FullImageGalleryViewController.h"
#import "Global.h"

@implementation FullImageGalleryViewController

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
- (void)viewDidLoad {
	
	scrollView						=	[UIScrollView new];
	scrollView.frame				=	CGRectMake(0, 0, 768,1004);
	scrollView.contentSize			=CGSizeMake(768*[mArrayFrFullImageinWallpaper count],1004);
	[self.view addSubview:scrollView];
	
	for(int i=0;i<[mArrayFrFullImageinWallpaper count];i++)
	{
		UIImageView *image			= [[UIImageView alloc]initWithFrame:CGRectMake(i*768,0,768,1004)];
		imageName					=[mArrayFrFullImageinWallpaper objectAtIndex:i];
		image.image					= [UIImage imageNamed:imageName];
		[scrollView addSubview:image];
		if(image)
		{
			[image release];
			image = nil;
		}
		

	}	
	[scrollView setContentOffset:CGPointMake(768*imageNumClickInWallpaper,0) animated:YES];
	scrollView.delegate				=	self;
	page							=	imageNumClickInWallpaper;
	
	homeButton						= [[UIButton alloc]initWithFrame:CGRectMake(670, 30, 103, 42)];
	[homeButton addTarget:self action:@selector(homeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
	[homeButton setTitle:@"HOME"  forState:(UIControlState)UIControlStateNormal];
	homeButton.font					= [UIFont boldSystemFontOfSize:25];
	homeButton.backgroundColor		=[UIColor blackColor];
	[homeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[self.view addSubview:homeButton];
	
	UIButton *saveButton			= [[UIButton alloc]initWithFrame:CGRectMake(0, 30, 103, 42)];
	[saveButton addTarget:self action:@selector(clicktosave:) forControlEvents:UIControlEventTouchUpInside];
	[saveButton setTitle:@"SAVE"  forState:(UIControlState)UIControlStateNormal];
	saveButton.font					= [UIFont boldSystemFontOfSize:25];
	saveButton.backgroundColor		=[UIColor blackColor];
	[saveButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[self.view addSubview:saveButton];
	if(saveButton)
	{
		[saveButton  release];
		saveButton  =  nil;
	}
	
    [super viewDidLoad];
}

///////////////Function to save the image
-(void)imagetosave
{
	imageName						=[mArrayFrFullImageinWallpaper objectAtIndex:page];
	UIImage *image					=[UIImage imageNamed:imageName];
	UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}


///////////////If user want to go to home ,press home button 
-(IBAction)homeButtonClick:(id)sender
{
	[self.navigationController popViewControllerAnimated:YES];
}


///////////////If user want to save the image in the ipad photo gallery
-(IBAction)clicktosave:(id)sender
{	
	//////////On pressing this button action sheet pop up first
	UIActionSheet *popupQuery = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel " destructiveButtonTitle:nil otherButtonTitles:@"Save", nil];
    popupQuery.actionSheetStyle = UIBarStyleBlack;
    [popupQuery showInView:self.view];
	if(popupQuery)
	{
		[popupQuery release];
		popupQuery=nil;
	}
}


///////////////If due to some reason image could'nt save in the photo gallery alert view would pop up
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
	UIAlertView *alert;
	if (error)
		alert = [[UIAlertView alloc] initWithTitle:@"Error" 
										   message:@"Unable to save image to Photo Album." 
										  delegate:self cancelButtonTitle:@"Ok" 
								 otherButtonTitles:nil];
	else // All is well
		alert = [[UIAlertView alloc] initWithTitle:@"Success" 
										   message:@"Image saved to Photo Album." 
										  delegate:self cancelButtonTitle:@"Ok" 
								 otherButtonTitles:nil];
	[alert show];
	
	if(alert)
	{
	   [alert release];
		alert = nil;
	}
}


//////////To set the button for action sheet
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
	switch(buttonIndex) {
	case 1:
		break;
	case 0:
		[self imagetosave];
		break;
	default:
		break;
	}
    	
}


//////////To control the scrolling of the scroll view
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView1
{
	page			= floor((scrollView1.contentOffset.x - 768 / 2) / 768  ) + 1;
	[scrollView1 setContentOffset:CGPointMake(768*page,0) animated:YES];

}


/*
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	
	UITouch *touchpoints		= [touches anyObject];
    currentPosition				= [touchpoints locationInView:self.view];
	
	
}
////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////
//on touching event ended
/////////////////////////////////////////////////////////////////////////
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touchpoints		= [touches anyObject];
	finalPosition				= [touchpoints locationInView:self.view];
	
	if (finalPosition.x<currentPosition.x-10)
	{
		scrollView.scrollEnabled			=YES;
		[scrollView setContentOffset:CGPointMake(768*(imageNumClickInWallpaper+1),0) animated:YES];

	}
		
}
*/
/*
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex { 
	switch(buttonIndex) {
		case 0:
			//cancel
			break;
		case 1:
			[self imagetosave];
			break;
		default:
			break;
	}
}*/
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
	if(scrollView)
	{
		[scrollView  release];
		scrollView  =  nil;
	}
	if(homeButton)
	{
		[homeButton  release];
		homeButton  =  nil;
	}
	if(imageName)
	{
		[imageName  release];
		imageName  =  nil;
	}
	
	
    [super dealloc];
}


@end
