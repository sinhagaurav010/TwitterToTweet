//
//  TwitterViewController.m
//  TwitterToTwit
//
//  Created by gaurav sinha on 17/03/11.
//  Company VINSOL
// Email:gaurav.sinha@vinsol.com


#import "TwitterViewController.h"
#import "TwitterRequest.h"
//#import <libxml/xmlmemory.h>
#import "XMLParser.h"
#import "ExampleCell.h"

@implementation TwitterViewController

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{
    [self.navigationItem setTitle:@"Twitter"];
    
    TwitterRequest *tr = [[TwitterRequest alloc] init];    

    [tr friends_timeline:self requestSelector:@selector(public_timeline_callback:)];
    
    [super viewDidLoad];
}
-(void)public_timeline_callback:(NSData *)data
{
    NSString *string = [[NSString alloc]initWithData:data encoding:NSASCIIStringEncoding];
    
    NSLog(@"%@",string);
    
    XMLParser *obj = [XMLParser new];
    
    root = [obj parseXMLFromData:data];

    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    [self.view addSubview:_tableView];
    
    _tableView.delegate = self;
    
    _tableView.dataSource = self;
   
   // TreeNode *child = [[root children] objectAtIndex:0];
   // NSLog(@"%@---%@",childchildchild.key,childchildchild.leafvalue);
    //    xmlDocPtr doc = xmlParseMemory([string UTF8String], [string lengthOfBytesUsingEncoding:NSUTF8StringEncoding]);
    //    xmlNodePtr root = xmlDocGetRootElement(doc);
}   

#pragma -
#pragma table
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [root.children count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//	
//	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
//	
//	if (nil == cell) {
//        NSLog(@"cf");
    static NSString *CellIdentifier = @"ExampleCell";
    
    ExampleCell *cell = (ExampleCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[ExampleCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    //cell.detailTextLabel.textAlignment = UITextAlignmentCenter;
    }
   
//	}
	

    
//    static NSString *CellIdentifier = @"ImageCell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    
//    if (cell == nil) {
//        cell = [[[UITableViewCell alloc]
//                 initWithFrame:CGRectZero reuseIdentifier:CellIdentifier]
//                autorelease];
//    } else {
//        AsyncImageView* oldImage = (AsyncImageView*)
//        [cell.contentView viewWithTag:999];
//        [oldImage removeFromSuperview];
//    }

   //if(_tableView.dragging == NO && _tableView.decelerating == NO)
   //{
    
    TreeNode *child = [[root children] objectAtIndex:[indexPath row]];
    
    TreeNode *childUses = [[child children] objectAtIndex:11];

    TreeNode *childchildImage = [[childUses children] objectAtIndex:5];
    
	//NSURL* url = [NSURL URLWithString:childchildchild1.leafvalue];
	
    [cell setFlickrPhoto:childchildImage.leafvalue];
    
       
    TreeNode *childchildchild = [[childUses children] objectAtIndex:2];
        
    TreeNode *childDiscrp = [[childUses children] objectAtIndex:4];
	// Set text
        
	if (childchildchild.hasLeafValue)
    {
//        cell.textLabel.font = [UIFont systemFontOfSize:15.0];
//		cell.textLabel.text = childchildchild.leafvalue;
//       // cell.textLabel.textAlignment = UITextAlignmentRight;
//        cell.textLabel.backgroundColor  = [UIColor clearColor]; 
//        
//        cell.detailTextLabel.text = childDiscrp.leafvalue;
//       //cell.detailTextLabel.text = childchildchild.leafvalue;
//       // cell.detailTextLabel.textAlignment = UITextAlignmentRight;
//        cell.detailTextLabel.backgroundColor  = [UIColor clearColor]; 

        [cell setTitle:childchildchild.leafvalue];
        [cell setSubTitle:childDiscrp.leafvalue];
    }
        else
		cell.detailTextLabel.text = @"";
	    
    
//    CGRect frame;
//	frame.size.width=75;
//    frame.size.height=75;
//	frame.origin.x=0; 
//    frame.origin.y=0;
//    
//	AsyncImageView* asyncImage = [[[AsyncImageView alloc]
//                                   initWithFrame:frame] autorelease];
//	asyncImage.tag = 999;
//    
    

//    [asyncImage loadImageFromURL:url];
//
//	[cell.contentView addSubview:asyncImage];
  //s }
	return cell;
}

-(IBAction)clickToTwit:(id)sender
{
	TwitterRushViewController *obj = [[TwitterRushViewController alloc] init];
	[self.navigationController pushViewController:obj animated:YES];
	[obj release];
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
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
