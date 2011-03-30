//
//  InfonmatViewController.m
//  DemoProject
//
//  Created by CHROME INFOTECH  on 17/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "InfonmatViewController.h"


@implementation InfonmatViewController

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
	NSString   *html						=	[NSString stringWithFormat:@"<html><head></head><body>"];
	NSString *srtfrUn						=	[NSString new];  
	
	NSString *tempStr1						=	@"Het <b>stofidentificatienummer</b> is het onderste getalop het oranje bord. Het nummer bestaat uit viercijfers en is gebaseerd op de stofnummers van de	lijst gevaarlijke stoffen van de Verenigde NatiesDit nummer wordt daarom ook wel het UN-nummergenoemd. X toegevoegd.De volgorde van het nummer is bepalend voor hetgevaar. Dubbele nummers houden in: is sterkerof zeer brandbaar. 33 is een zeer brandbarevloeistofstof. 368 = brandbare vloeistof die tevensgiftig en bijtend is (brandbaar is hoofdgevaar	meer giftig dan bijtend). De betekenis van de cijferskomen overeen met de cijfers van de gevarenklasse.	De volgende bijzondere GEVI-nummers zijn er:";
	
	NSString *mater1						=	[NSString stringWithFormat:@"<font size=\"3\"><p>%@</font>",tempStr1,nil];
	
	NSString *strngbody						=	[NSString new];
	
	NSString *strImage						=	[NSString new];
	
	strImage								=	@"<CENTER><img src=";
	
	strImage								=	[strImage stringByAppendingFormat:@"overl-bottom.png"];
	
	strImage								=	[strImage stringByAppendingFormat:@"></CENTER>"];
	
	
	
	//strImage				=	[strImage stringByAppendingFormat:mater1];
	
	strngbody								=	@"</body></html>";
	
	srtfrUn									=	[html stringByAppendingFormat:strImage] ;
	
	srtfrUn									=	[srtfrUn stringByAppendingFormat:mater1] ;
	
	srtfrUn									=	[srtfrUn stringByAppendingFormat:strngbody] ;
	
	//[webView loadHTMLString:htmlString baseURL:baseURL];
	
	//[web_Stof reload];
	
	NSString *path							= [[NSBundle mainBundle] bundlePath];
	
	NSURL *baseURL							= [NSURL fileURLWithPath:path];
	
	
	
	[myWebView loadHTMLString:srtfrUn baseURL:baseURL];
    [super viewDidLoad];
}



// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
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
    [super dealloc];
}


@end
