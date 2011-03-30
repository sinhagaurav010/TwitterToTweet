//
//  ZoekenViewController.m
//  DemoProject
//
//  Created by CHROME INFOTECH  on 03/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ZoekenViewController.h"
#import "Global.h"
#import  "SearchTableViewController.h"
#import "SubDiscriptionViewController.h"
#define DB_NAME @"ichemAlertDataBase.sqlite"
#define debug 1
@implementation ZoekenViewController
//////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////
////////parsing of Stoffenijlist.xml


- (ZoekenViewController *) initXMLParser {
	
	//i=0;
	
	data_arry_Sottefn		=	[NSMutableArray  new];
	dataarry_Lang			=	[NSMutableArray new];
	dataarry_Name			=	[NSMutableArray new];
	[super init];
	
	appDelegate				= (DemoProjectAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	return self;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName 
	attributes:(NSDictionary *)attributeDict {
	
	if([elementName isEqualToString:@"Matters"]) {
	}
	
	else if([elementName isEqualToString:@"Matter"]) {
		objs					=	[Stoffen  new];
	}
	
		if([elementName isEqualToString:@"Name"]){
			[dataarry_Lang addObject: [attributeDict objectForKey:@"lang"]] ;
		}	

}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string 
{ 
	
	if(!currentElementValue) 
	{
		currentElementValue		= [[NSMutableString alloc] initWithString:string];
	}
	
	
	else
	{
		[currentElementValue  appendString:string];
	}
	}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
	
	if([elementName isEqualToString:@"Matters"]){
		return;
	}

	if([elementName isEqualToString:@"Matter"]) 
	{
		if(objs!=NULL){
			
			[data_arry_Sottefn  addObject:objs];
		}
			
	}
	
	if([elementName isEqualToString:@"UN"]){
		objs.dataarry_UN			=	[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
		
	}
	
	if([elementName isEqualToString:@"GEVI"]){
		objs.dataarry_GEVI			=  [currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
	}
	
	if([elementName isEqualToString:@"Name"]){
		[dataarry_Name addObject:[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]]];
	}
	
	if([elementName isEqualToString:@"PackageGroup"]){
		objs.dataarry_PackageGroup	=	currentElementValue;
		//[dataarry_PackageGroup addObject:currentElementValue];
	}
	
	if([elementName isEqualToString:@"Class"]){
		objs.dataarry_Class			=	[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
	
	}
	
	if([elementName isEqualToString:@"Classification"]){
		objs.dataarry_Classification=	[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
			NSLog(@"classification: %@", objs.dataarry_Classification);
		
	}
	
	if([elementName isEqualToString:@"Symbols"]){
		
		objs.dataarry_Symbols		=	[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
		
	}
	
	if([elementName isEqualToString:@"SUBGEVI"]){
		objs.dataarry_SUBGEVI		=	[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];

	}
	
	else {	
			}
		
	[currentElementValue release];
	currentElementValue = nil;
	
		
}
/////////////////////////////////////////////////////
//////////////////

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

////////////////////////////////////
///when vind buuton is pressed



-(IBAction)Vindpressed:(id)argName
{
	/////////////////////////////////////////////////////
	///////if temp =1 UN search ,temp=2 GEVI search  ,temp=3 UN & GEVI search
	
	int temp   =	4;
	if(txt_GE.text.length>0  && ![txt_GE.text isEqualToString:@"GEVI-nummer"])// && ([txt_UN.text isEqualToString:@""] || [txt_UN.text isEqualToString:@"UN-nummer"]))
	{
		temp		=0;	
	
	}
	
	if(txt_UN.text.length>0 && ![txt_UN.text isEqualToString:@"UN-nummer"])// && ([txt_GE.text isEqualToString:@""] || [txt_GE.text isEqualToString:@"GEVI-nummer"]))
	{
		temp=1;	
	}
	
	else if(txt_GE.text.length>0 && ![txt_GE.text isEqualToString:@"GEVI-nummer"] && txt_UN.text.length>0 && ![txt_UN.text isEqualToString:@"UN-nummer"])
	{
		temp=2;
	}
	
	
		////////////////////////////////////////////////////
		 ///////////////////////////////////////////////////////////
	//To check whether GEVI no. exit or not if Yes success =1 and flag search become 2 other wise show msg.
	
	
	
	 if(temp==0){
				int success					=0;
	
	string_GV_search  =   txt_GE.text;/////////////take string from text_ge
			
    ////////////////////////////////////////////
	//open database to chech whethe no. exit or not
			
			
	NSArray *paths				= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory= [paths objectAtIndex:0];
	NSString *path				= [documentsDirectory stringByAppendingPathComponent:DB_NAME];
			
    datafrmUNtabl0				=[NSMutableArray new];
	datafrmUNtabl6              =	[NSMutableArray new];
			
	// Open the database. The database was prepared outside the application.
	
	if (sqlite3_open([path UTF8String], & database) <= SQLITE_OK) 
	{
		
		// Get the primary key for all books.
		const char *sqlStatement = "SELECT * FROM StoffenDataTable WHERE GEVI = ? ";
		sqlite3_stmt *compiledStatement;
		int error_code = sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL);
		if(error_code == SQLITE_OK) {
			// Loop through the results and add them to the feeds arra
			sqlite3_bind_text(compiledStatement,1,[string_GV_search UTF8String],-1,SQLITE_TRANSIENT);
			while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
			success=1;
			// Read the data from the result row
			[datafrmUNtabl0 addObject: [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)]];
			[datafrmUNtabl6 addObject: [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 6)]];
			}
		} 	
				// "Finalize" the statement - releases the resources associated with the statement.
				sqlite3_finalize(compiledStatement);
		
	} 
	
	
	else {
		
		// Even though the open failed, call close to properly clean up resources.
		
		        sqlite3_close(database);
				NSAssert1(0, @"Failed to open database with message '%s'.", sqlite3_errmsg(database));
				// Additional error handling, as appropriate...
	}
			
	///////////////////////////////////
	/////if success = 0 showing alert
			
			
	if(success==0){
	
		UIAlertView *alert	= [[UIAlertView alloc]initWithTitle:@"info" message:@"Voer een geldig GEVI- of UN-nummeukiukiukr in" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil]	;
		[alert show];
		[alert release];
		
	}	
	
	else{
					flag_search=2;
		
	//////////////////////////////////////////////////////////////////////
		////////if number of element in search >1 viewController will be seachView Controller otherwise Subdiscriptin Viewcontroller
				if([datafrmUNtabl6 count]>1){
			
			UIBarButtonItem *newBackButton	 = [[UIBarButtonItem alloc] initWithTitle: @"home" style: UIBarButtonItemStyleBordered target: nil action: nil];
			[[self navigationItem] setBackBarButtonItem: newBackButton];
			
			SearchTableViewController *obj	 =	[SearchTableViewController new];
			[self.navigationController pushViewController:obj animated:YES ];
		}
		
		
		else{
			
			UIBarButtonItem *newBackButton   = [[UIBarButtonItem alloc] initWithTitle: @"Terug" style: UIBarButtonItemStyleBordered target: nil action: nil];
									
			[[self navigationItem] setBackBarButtonItem: newBackButton];
			
			searchdt						  =	[datafrmUNtabl0 objectAtIndex:0];
            stofdata						  =	[datafrmUNtabl6 objectAtIndex:0];
			
			SubDiscriptionViewController *obj =	[SubDiscriptionViewController new];
			[self.navigationController pushViewController:obj animated:YES];
			
		}
		
	}
		
	
		}
	
	/////////////////////////////////////////////////////////////
	//for existence of UN number if it exist then flagsearch =1
	
	
    if(temp==1){
	     		int success=0;
				string_UN_search					=   txt_UN.text;
				NSArray *paths						= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
				NSString *documentsDirectory		= [paths objectAtIndex:0];
				NSString *path						= [documentsDirectory stringByAppendingPathComponent:DB_NAME];
		
		// Open the database. The database was prepared outside the application.
		
		        datafrmUNtabl0=[NSMutableArray new];
				datafrmUNtabl6=	[NSMutableArray new];
				if (sqlite3_open([path UTF8String], & database) <= SQLITE_OK) {
						// Get the primary key for all books.
						NSLog(@"database opened suuccessfully");
						NSLog(@"string_UN_search = %@",string_UN_search);
						const char *sqlStatement		= "SELECT * FROM StoffenDataTable WHERE UN = ? ";
						sqlite3_stmt *compiledStatement;
						int error_code					= sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL);
						if(error_code == SQLITE_OK) {
						// Loop through the results and add them to the feeds array
						sqlite3_bind_text(compiledStatement,1,[string_UN_search UTF8String],-1,SQLITE_TRANSIENT);
				
							while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
					                     success					=1;
										// Read the data from the result row
										[datafrmUNtabl0 addObject: [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)]];
										[datafrmUNtabl6 addObject: [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 6)]];
				}
				} 	
			
			
			// "Finalize" the statement - releases the resources associated with the statement.
						sqlite3_finalize(compiledStatement);
				} 
		
		
		else {
			// Even though the open failed, call close to properly clean up resources.
						sqlite3_close(database);
						NSAssert1(0, @"Failed to open database with message '%s'.", sqlite3_errmsg(database));
						// Additional error handling, as appropriate...
		}
		if(success==0){
			            UIAlertView *alert	          = [[UIAlertView alloc]initWithTitle:@"info" message:@"Voer een geldig GEVI- of UN-nummer in" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil]	;
						[alert show];
						[alert release];
			
		}	
		
		else{
		
			                              flag_search =1;
			
						//////////////////////////////////////////////////////////////////////
			////////if number of element in search >1 viewController will be seachView Controller otherwise Subdiscriptin Viewcontroller
			
			if([datafrmUNtabl6 count]>1){
			
							UIBarButtonItem *newBackButton	   = [[UIBarButtonItem alloc] initWithTitle: @"home" style: UIBarButtonItemStyleBordered target: nil action: nil];
							[[self navigationItem] setBackBarButtonItem: newBackButton];
							SearchTableViewController *obj	  =	[SearchTableViewController new];
							[self.navigationController pushViewController:obj animated:YES ];
			}
			
			
			else
			{
				UIBarButtonItem *newBackButton   = [[UIBarButtonItem alloc] initWithTitle: @"terug" style: UIBarButtonItemStyleBordered target: nil action: nil];
				[[self navigationItem] setBackBarButtonItem: newBackButton];
				
				searchdt						  =	[datafrmUNtabl0 objectAtIndex:0];
				stofdata						  =	[datafrmUNtabl6 objectAtIndex:0];
				
				SubDiscriptionViewController *obj =	[SubDiscriptionViewController new];
				[self.navigationController pushViewController:obj animated:YES];
			
			}
			}
            }

	////////////////////////////////////////////////////////////////////////
	
	
	
	/////////////////////////////////////////////////////////////
	//for existence of UN and GEVI number if it exist then flagsearch =5
	
	
	if(temp==2){
		        geviFrSrchFlg3								=	[NSMutableArray new];
				dataaryfrflgsrch3							=	[NSMutableArray new];
				int success=0;
		
		
		
				string_UN_search							=   txt_UN.text;
				string_GV_search							=	 txt_GE.text; 	
		
				NSArray *paths								=	NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
				NSString *documentsDirectory				= [paths objectAtIndex:0];
				NSString *path = [documentsDirectory stringByAppendingPathComponent:DB_NAME];
		
		// Open the database. The database was prepared outside the application.
		
		if (sqlite3_open([path UTF8String], & database) <= SQLITE_OK) 
		{
			// Get the primary key for all books.
			const char *sqlStatement				= "SELECT * FROM StoffenDataTable WHERE UN = ? AND GEVI = ?";
		    sqlite3_stmt *compiledStatement;
			int error_code = sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL);
			if(error_code == SQLITE_OK) {
			// Loop through the results and add them to the feeds array
				sqlite3_bind_text(compiledStatement,1,[string_UN_search UTF8String],-1,SQLITE_TRANSIENT);
				sqlite3_bind_text(compiledStatement,2,[string_GV_search UTF8String],-1,SQLITE_TRANSIENT);
				while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
				success=1;
					// Read the data from the result row
					//NSString *aNewValue = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)];
					[dataaryfrflgsrch3	addObject:	[NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement,6)]];
					[geviFrSrchFlg3		addObject:	[NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement,1)]];
				}
			} 	
			// "Finalize" the statement - releases the resources associated with the statement.
		sqlite3_finalize(compiledStatement);
		} 
		
		else 
		{
			// Even though the open failed, call close to properly clean up resources.
			sqlite3_close(database);
			NSAssert1(0, @"Failed to open database with message '%s'.", sqlite3_errmsg(database));
		   // Additional error handling, as appropriate...
		}
	
		if(success==0)
		{
		UIAlertView *alert								= [[UIAlertView alloc]initWithTitle:@"info" message:@"Voer een geldig GEVI- of UN-nummer in" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil]	;
	    [alert show];
        [alert release];
		}	
		
		else{
		
			flag_search	=5;
			if([geviFrSrchFlg3 count]>1){
			
				UIBarButtonItem *newBackButton				= [[UIBarButtonItem alloc] initWithTitle: @"home" style: UIBarButtonItemStyleBordered target: nil action: nil];
				//	self.newBackButton.tintColor = [UIColor blackColor];
				[[self navigationItem] setBackBarButtonItem: newBackButton];
				SearchTableViewController *obj				=	[SearchTableViewController new];
				[self.navigationController pushViewController:obj animated:YES ];
			}
			
			else {
				
				UIBarButtonItem *newBackButton				= [[UIBarButtonItem alloc] initWithTitle: @"terug" style: UIBarButtonItemStyleBordered target: nil action: nil];
				[[self navigationItem] setBackBarButtonItem: newBackButton];
				searchdt									=	[geviFrSrchFlg3 objectAtIndex:0];
				stofdata									=	[dataaryfrflgsrch3 objectAtIndex:0];
				SubDiscriptionViewController *obj			=	[SubDiscriptionViewController new];
				[self.navigationController pushViewController:obj animated:YES];
			
			}

			
		}
	
	}
		
}



///////////////////////////////////////
////////////////////////////////
//to dissmiss the keyboard


-(IBAction)userdidenteringtext:(id)sender
{
	[sender resignFirstResponder];
	
}

/////////////////////////////////////////////////
//////////done button(Annuleer) to set the scroll offset 



-(IBAction)doneButtonClick:(id)sender
{  
	NSLog(@"errtg%@",txt_GE.text);
	
	if([txt_GE.text isEqual:@""])
	{
	txt_GE.text	=@"GEVI-nummer";
	}
	
	if([txt_UN.text isEqual:@""])
	{
		txt_UN.text	=@"UN-nummer";
	}
	
		
		[scrll setContentOffset:CGPointMake(0.0, 0.0) animated:YES];
		UIImage *image										= [UIImage imageNamed: @"text-ichem.png"];
		UIImageView *imageView								= [[UIImageView alloc] initWithImage: image];
		self.navigationItem.titleView						= imageView;
		doneButton.hidden									=		YES;
		[txt_GE resignFirstResponder];
		[txt_UN resignFirstResponder];
	
	}
	
////////////////////////////////////////////////////////
	
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 

{	
	//button.enabled=NO;

		searchdt											=	[NSMutableArray new];
		stofdata											=	[NSMutableArray new];
	
		txt_GE.text	=	@"GEVI-nummer";
		txt_UN.text	=	@"UN-nummer";
	
	 	UIImage *image										=	[UIImage imageNamed: @"text-ichem.png"];
		UIImageView *imageView								=	[[UIImageView alloc] initWithImage: image];
		self.navigationItem.titleView						=	imageView;
		
		CGRect frame										=	CGRectMake(0,0 ,320,480);
		scrll.contentSize									=	frame.size;
		
		[super viewDidLoad];
}


//////////////////////////////////////////////
/////////It will call when GEVI or Un text field start editing



- (BOOL)textFieldDidBeginEditing:(UITextField *)textField{  // became first responder
	
		[scrll setContentOffset:CGPointMake(0.0, 140) animated:YES];
	
		self.navigationItem.titleView						= nil;
		self.navigationItem.title							=	@"Voer nummer(s) in";
		 doneButton = [[UIButton alloc]initWithFrame:CGRectMake(250, 25.0, 90, 32)];
		[doneButton setBackgroundImage:[UIImage imageNamed:@"Annuleer-button.png"] forState:UIControlStateNormal];
		[doneButton addTarget:self action:@selector(doneButtonClick:) forControlEvents:UIControlEventTouchUpInside];
		[doneButton setTitle:@"Annuleer"  forState:(UIControlState)UIControlStateNormal];
		doneButton.font = [UIFont boldSystemFontOfSize:13];
		self. navigationItem.rightBarButtonItem				= [[UIBarButtonItem alloc] initWithCustomView:doneButton];
	
	return YES;	

}

//////////////////////////////////////////////
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return NO;}


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


- (void)dealloc 
{
	[currentElementValue	release];
 	[pictureList_String		release];
	[scrll                  release];
	[txt_GE                 release];
	[button                 release];
	[txt_UN                 release];
	[button_Annuleer    release];
    [super dealloc];
}


@end
