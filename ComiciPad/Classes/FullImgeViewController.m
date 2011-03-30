    //
//  FullImgeViewController.m
//  ComiciPad
//
//  Created by CHROME INFOTECH  on 22/09/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "FullImgeViewController.h"
#import "Global.h"

@implementation FullImgeViewController

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
	CGRect frameOfbackGroundimage			=   CGRectMake(0, 0, 768, 1024);
	UIImageView *backGroundimage			=	[[UIImageView alloc] initWithFrame:frameOfbackGroundimage];
	backGroundimage.backgroundColor			=	[UIColor blackColor];
    [self.view addSubview:backGroundimage];
	
	scrollView							=	[UIScrollView new];
	///////For the promo art		
	if (artNum==0) 
	{
		scrollView.frame				=	CGRectMake(0, 0, 768,1004);
		scrollView.contentSize			=CGSizeMake(768*[mArrayFrPromoArt count],1004);
		[self.view addSubview:scrollView];
		
		for(int i=0;i<[mArrayFrPromoArt count];i++)
		{
			UIImageView *image			= [[UIImageView alloc]initWithFrame:CGRectMake(i*768,0,768,1004)];
			imageName					=[mArrayFrPromoArt objectAtIndex:i];
			image.image					= [UIImage imageNamed:imageName];
			[scrollView addSubview:image];
			if(image)
			{
				[image release];
				image = nil;
			}
		}	
		[scrollView setContentOffset:CGPointMake(768*imageNumOfPromoart,0) animated:YES];
		scrollView.delegate				=	self;
	}
	///////For the production art
	if (artNum==1) 
	{
		scrollView.frame				=	CGRectMake(0, 0, 768,1004);
		scrollView.contentSize			=CGSizeMake(768*[mArrayFrProductionArt count],1004);
		[self.view addSubview:scrollView];
		
		for(int i=0;i<[mArrayFrProductionArt count];i++)
		{
			UIImageView *image			= [[UIImageView alloc]initWithFrame:CGRectMake(i*768+109,106,550,792)];
			imageName					=[mArrayFrProductionArt objectAtIndex:i];
			image.image					= [UIImage imageNamed:imageName];
			[scrollView addSubview:image];
			if(image)
			{
				[image release];
				image = nil;
			}
		}	
		[scrollView setContentOffset:CGPointMake(768*imageNumOfProductionart,0) animated:YES];
		scrollView.delegate				=	self;
	}
	
	///////For the concept art
    if (artNum==2) 
	{
		scrollView.frame				=	CGRectMake(0, 0, 768,1004);
		scrollView.contentSize			=CGSizeMake(768*[mArrayFrConceptArt count],1004);
		[self.view addSubview:scrollView];
		
		for(int i=0;i<[mArrayFrConceptArt count];i++)
		{
			UIImageView *image			= [[UIImageView alloc]initWithFrame:CGRectMake(i*768,0,768,1004)];
			imageName					=[mArrayFrConceptArt objectAtIndex:i];
			image.image					= [UIImage imageNamed:imageName];
			[scrollView addSubview:image];
			if(image)
			{
				[image release];
				image = nil;
			}
	}	
		[scrollView setContentOffset:CGPointMake(768*imageNumOfConceptart,0) animated:YES];
		scrollView.delegate	=	self;
  }
	
	homeButton							= [[UIButton alloc]initWithFrame:CGRectMake(670, 30, 103, 42)];
	[homeButton addTarget:self action:@selector(homeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
	[homeButton setTitle:@"HOME"  forState:(UIControlState)UIControlStateNormal];
	homeButton.font						= [UIFont boldSystemFontOfSize:25];
	[homeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	homeButton.backgroundColor = [UIColor blackColor];
	[self.view addSubview:homeButton];
	[super viewDidLoad];
}

//////If user want to go to 
-(IBAction)homeButtonClick:(id)sender
{
	[self.navigationController popViewControllerAnimated:YES];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return NO;
}

////////To control the scrolling of the scroll view
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView1{
	int page								= floor((scrollView1.contentOffset.x - 768 / 2) / 768  ) + 1;
	[scrollView1 setContentOffset:CGPointMake(768*page,0) animated:YES];
	
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
	if(imageName)
	{
		[imageName release];
		imageName = nil;
	}
	
	if(scrollView)
	{
		[scrollView release];
		scrollView = nil;
	}
	 
    [super dealloc];
}


@end
