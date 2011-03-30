//
//  informatViewController.m
//  DemoProject
//
//  Created by CHROME INFOTECH  on 18/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "informatViewController.h"


@implementation informatViewController

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
	
	[self.navigationController setNavigationBarHidden:YES];		
	
	NSString   *html						=	[NSString stringWithFormat:@"<html><head></head><body>"];
	[myWeb setBackgroundColor:[UIColor clearColor]];
	[myWeb setOpaque:NO];
	NSString  *strngfrGV					=	[NSString new];  
	NSString *tempStr						=	@"Ibusciminum ilite dolent aut ped utem lis deliquo sapiste nustiae ea conse aut mooccab iminullam, nonsedi psusci berspiciumvoluptatur? Venia doluptiunt et aut voluptaturma voluptas everfer iatius elliqua eperum netquideliquis exerum dolorup iduntia perchillesciae peritaecae digenis niametur sedquam quo doluptas enis delent aut am nonseperio con con repel et inis etus cum voluptasim fuga. Et odiandandent acestio vollaccaeconsectatus et re, siti am lacerio cor sed quelautet, simi, idit odist autempo rrorepe reptateporerum que et evenem cus.";
	NSString *mater							=	[NSString stringWithFormat:@"<BR><BR><font size=\"3\"><p>%@</font>",tempStr,nil];
	NSString*strng							=	[NSString new];
	strng									=	@"</body></html>";
	NSString *strImageUN					=	[NSString new];
	strImageUN								=	@"<CENTER><img src=";
	strImageUN								=	[strImageUN stringByAppendingFormat:@"sdu-logo.png"];
	strImageUN								=	[strImageUN stringByAppendingFormat:@"></CENTER>"];
	
	
	strngfrGV								=	[html stringByAppendingFormat:mater] ;
	strngfrGV								=	[strngfrGV stringByAppendingFormat:strImageUN] ;
	strngfrGV								=	[strngfrGV stringByAppendingFormat:strng] ;
	NSString *path							= [[NSBundle mainBundle] bundlePath];
	NSURL *baseURL							= [NSURL fileURLWithPath:path];
	[myWeb loadHTMLString:strngfrGV baseURL:baseURL];
	
    [super viewDidLoad];
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
    [super dealloc];
}


@end
