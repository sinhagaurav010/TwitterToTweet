//
//  ZoekhulpViewController.m
//  DemoProject
//
//  Created by CHROME INFOTECH  on 03/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ZoekhulpViewController.h"


@implementation ZoekhulpViewController

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
	
	NSString   *html	=	[NSString stringWithFormat:@"<html><head></head><body>"];
	[myWebfrGV setBackgroundColor:[UIColor clearColor]];
	[myWebfrUN setBackgroundColor:[UIColor clearColor]];
	[myWebfrGV setOpaque:YES];
	    NSString  *strngfrGV					=	[NSString new];  
		NSString *tempStr						=	@"Het <b>gevaarsidentificatienummer</b> (GEVI-nummer)bestaat uit minimaal 2 en maximaal 3 cijfers. Indienvan toepassing wordt een letter X toegevoegd.De volgorde van het nummer is bepalend voor hetgevaar. Dubbele nummers houden in: is sterkerof zeer brandbaar. 33 is een zeer brandbarevloeistofstof. 368 = brandbare vloeistof die tevensgiftig en bijtend is (brandbaar is hoofdgevaar	meer giftig dan bijtend). De betekenis van de cijferskomen overeen met de cijfers van de gevarenklasse.	De volgende bijzondere GEVI-nummers zijn er:";
		NSString *mater							=	[NSString stringWithFormat:@"<font size=\"3\"><p>%@</font>",tempStr,nil];
		NSString*strng							=	[NSString new];
		strng									=	@"</body></html>";
		NSString *strImageUN					=	[NSString new];
		strImageUN								=	@"<CENTER><img src=";
		strImageUN								=	[strImageUN stringByAppendingFormat:@"ovel-top.png"];
		strImageUN								=	[strImageUN stringByAppendingFormat:@"></CENTER>"];
			
	
		strngfrGV								=	[html stringByAppendingFormat:strImageUN] ;
	    strngfrGV								=	[strngfrGV stringByAppendingFormat:mater] ;
		strngfrGV								=	[strngfrGV stringByAppendingFormat:strng] ;
		NSString *path							= [[NSBundle mainBundle] bundlePath];
		NSURL *baseURL							= [NSURL fileURLWithPath:path];
		[myWebfrGV loadHTMLString:strngfrGV baseURL:baseURL];

	    NSString *srtfrUn						=	[NSString new];  
		NSString *tempStr1						=	@"Het <b>stofidentificatienummer</b> is het onderste getalop het oranje bord. Het nummer bestaat uit viercijfers en is gebaseerd op de stofnummers van de	lijst gevaarlijke stoffen van de Verenigde NatiesDit nummer wordt daarom ook wel het UN-nummergenoemd. X toegevoegd.De volgorde van het nummer is bepalend voor hetgevaar. Dubbele nummers houden in: is sterkerof zeer brandbaar. 33 is een zeer brandbarevloeistofstof. 368 = brandbare vloeistof die tevensgiftig en bijtend is (brandbaar is hoofdgevaar	meer giftig dan bijtend). De betekenis van de cijferskomen overeen met de cijfers van de gevarenklasse.	De volgende bijzondere GEVI-nummers zijn er:";
		NSString *mater1						=	[NSString stringWithFormat:@"<font size=\"3\"><p>%@</font>",tempStr1,nil];
		NSString *strngbody						=	[NSString new];
		NSString *strImage						=	[NSString new];
		strImage								=	@"<CENTER><img src=";
		strImage								=	[strImage stringByAppendingFormat:@"overl-bottom.png"];
		strImage								=	[strImage stringByAppendingFormat:@"></CENTER>"];
		strngbody								=	@"</body></html>";
		srtfrUn									=	[html stringByAppendingFormat:strImage] ;
		srtfrUn									=	[srtfrUn stringByAppendingFormat:mater1] ;
		srtfrUn									=	[srtfrUn stringByAppendingFormat:strngbody] ;
		[myWebfrUN loadHTMLString:srtfrUn baseURL:baseURL];
		
	    CGRect frame							= CGRectMake(0,0, 600, 200);
		myScroll.contentSize					= frame.size;
		
	    self.navigationItem.title				=	@"Zoekhulp";
		lable_un2.hidden=YES;
	    [button_GV setImage:[UIImage imageNamed:@"whiteDot.png"] forState:UIControlStateNormal];
		[button_UN setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
    
	
	
	[super viewDidLoad];
}

-(IBAction)rightButtonpress:(id)argName{   
	     lable_un2.hidden						=NO;
		rightButton.hidden						=YES;
		lable_un.hidden							=YES;
		lable_gevi.hidden						=YES;
		[myScroll setContentOffset:CGPointMake(314.0, 0.0) animated:YES];
	    [button_GV setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
		[button_UN setImage:[UIImage imageNamed:@"whiteDot.png"] forState:UIControlStateNormal];
}

////////////////////////
//If UN button is pressed



-(IBAction)button_unpress:(id)argName{
	
	    lable_un2.hidden						=NO;
		lable_un.hidden							=YES;
		lable_gevi.hidden						=YES;
		rightButton.hidden						=	YES;
		[myScroll setContentOffset:CGPointMake(314.0, 0.0) animated:YES];
	    [button_GV setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
		[button_UN setImage:[UIImage imageNamed:@"whiteDot.png"] forState:UIControlStateNormal];
}

///////////////////////////////
//if gevi button is pressed



-(IBAction)button_gvpress:(id)argName{
	    lable_un2.hidden						=YES;
		[myScroll setContentOffset:CGPointMake(0.0,0.0) animated:YES];
		rightButton.hidden						=	NO;
		lable_un.hidden							=NO;
		lable_gevi.hidden						=NO;
		[button_GV setImage:[UIImage imageNamed:@"whiteDot.png"] forState:UIControlStateNormal];
		[button_UN setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
}




////////////////////////////////////////////
//To control event with scrolling


- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
	//NSLog(@"cdcvdsvdvdfsvdsfvdfvdf");
	int page								        = floor((scrollView.contentOffset.x - 297.0 / 2) / 297.0) + 1;
		if(page==0){
				rightButton.hidden					=	NO;
				lable_un2.hidden					=	YES;
				[myScroll setContentOffset:CGPointMake(0.0,0.0) animated:YES];
				lable_un.hidden						=	NO;
				lable_gevi.hidden					=	NO;
				[button_GV setImage:[UIImage imageNamed:@"whiteDot.png"] forState:UIControlStateNormal];
				[button_UN setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
		
	}	
	
		if(page==1){
		       rightButton.hidden					=	YES;
		       lable_un2.hidden					    =NO;
				lable_un.hidden						=YES;
				lable_gevi.hidden					=YES;
		        [myScroll setContentOffset:CGPointMake(314.0, 0.0) animated:YES];
				[button_GV setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
				[button_UN setImage:[UIImage imageNamed:@"whiteDot.png"] forState:UIControlStateNormal];
		
		//[myScroll setContentOffset:pagePoint animated:YES];
		
	}
}
	/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

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
	[button_UN release];
	[button_GV  release]; 
	[lable_un    release];
	[lable_gevi   release];
	[lable_un2     release];
	[myScroll     release];
	[myWebfrUN     release];
	[myWebfrGV      release];
	[rightButton    release];
    [super dealloc];
}


@end
