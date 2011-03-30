//
//  SearchTableViewController.m
//  DemoProject
//
//  Created by CHROME INFOTECH  on 05/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import  "SearchTableViewController.h"
#import "SubDiscriptionViewController.h"
#import  "Global.h"
#import  "ogs.h"
#import  "ZoekenViewController.h"
#define DB_NAME @"ichemAlertDataBase.sqlite"

@implementation SearchTableViewController

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/////////////////////////////////////////////////////////////////
//Insert element in ogsdatatable


/*-(void)insertElementInOgs
{
	NSLog(@"edede");
	NSArray  *paths					=	NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	
	NSString *documentsDirectory	=	[paths objectAtIndex:0];
	
	NSString *path					=	[documentsDirectory stringByAppendingPathComponent:@"ICHEMBase.sqlite"];
	
	if (sqlite3_open([path UTF8String], & database) <= SQLITE_OK     ) {
		// Get the primary key for all books.
		
		for(int i=0;i<[data_arry_ogs count];i++)
		{
			
			NSLog(@"edede");
			
			ogs *obj		=	[ogs new];
			
			obj				=	[data_arry_ogs objectAtIndex:i];
			
			
			NSLog(@"rggr%@",obj.openbare_veiligheid);
			
				NSString *sql = [NSString stringWithFormat:@"INSERT INTO Ogs_Table (gevino,omschrijving,brand_explosie,gezondheid,openbare_veiligheid,beschermende_kleding,evacuatie,brand,lekkage,eerstehulp,SUBGEVI,SUBGEVI_nummer) VALUES ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')",obj.gevino,obj.omschrijving,obj.brand_explosie,obj.gezondheid,obj.openbare_veiligheid,obj.beschermende_kleding,obj.evacuatie,obj.brand,obj.lekkage,obj.eerstehulp,obj.SUBGEVI,obj.SUBGEVI_nummer];                                    
			//sqlite3_stmt *insertStmt;
			// Preparing a statement compiles the SQL query into a byte-code program in the SQLite library.
			// The third parameter is either the length of the SQL string or -1 to read up to the first null terminator.        
			//	if(sqlite3_prepare_v2(database, [sql ] , -1, &insertStmt, NULL) != SQLITE_OK)
			//	{
			//		//sqlite3_bind_text( updateStmt, 1, [Name editedText], -1, SQLITE_TRANSIENT);
			//		
			//		NSAssert1(0, @"Error while creating insert statement. '%s'", sqlite3_errmsg(database));
			//	}
			//	
			// "Finalize" the statement - releases the resources associated with the statement.
			
			sqlite3_exec(database, [sql UTF8String], nil, nil, nil);
			//sqlite3_step(insertStmt);
			//sqlite3_reset(insertStmt);
			//sqlite3_finalize(insertStmt);
		}
	}
	
	else 
		
	{
		
		// Even though the open failed, call close to properly clean up resources.
		
		sqlite3_close(database);
		
		NSAssert1(0, @"Failed to open database with message '%s'.", sqlite3_errmsg(database));
		
		
		
		// Additional error handling, as appropriate...
		
	}
	
}
*/
	
	////////////////////////////////////////////////////////////////
//////////Parsing code for Ogs Xml file

		

- (SearchTableViewController *) initXMLParser {
	
	data_arry_ogs				=  [NSMutableArray new];
		[super init];
		appDelegate				= (DemoProjectAppDelegate *)[[UIApplication sharedApplication] delegate];
		return self;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName 
	attributes:(NSDictionary *)attributeDict {
	
		if([elementName isEqualToString:@"ogs"]) {
		}
	
	else if([elementName isEqualToString:@"gevi"]) 
		{
			aOgs				=  [ogs new];
		}	
	
	
       }

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string 
{ 
	if(!currentElementValue) 
	{
		currentElementValue	= [[NSMutableString alloc] initWithString:string];
	}
	else
	{
		[currentElementValue appendString:string];
	}
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
	
	if([elementName isEqualToString:@"ogs"])
	{
			return;
	}
	if([elementName isEqualToString:@"gevi"]) 
	{
	if(aOgs!=NULL)
	{
			[data_arry_ogs  addObject:aOgs];
	}
		
	}
	
	if([elementName isEqualToString:@"gevi-nummer"]){
		aOgs.gevino				= currentElementValue;
	}
	
	if([elementName isEqualToString:@"omschrijving"]){
			aOgs.omschrijving		=	currentElementValue;
				
	}
	if([elementName isEqualToString:@"brand-explosie"]){
			aOgs.brand_explosie		=	currentElementValue;
    }
	
	if([elementName isEqualToString:@"gezondheid"]){
		aOgs.gezondheid		=	currentElementValue;
	}
	
	if([elementName isEqualToString:@"openbare-veiligheid"])
		{
		aOgs.openbare_veiligheid=	currentElementValue;
					    }
	
	if([elementName isEqualToString:@"beschermende-kleding"]){
		aOgs.beschermende_kleding=	currentElementValue;
	}
	
	if([elementName isEqualToString:@"evacuatie"]){
		aOgs.evacuatie			    =	currentElementValue;
			
			}
	
	if([elementName isEqualToString:@"brand"]){
		aOgs.brand				    =	currentElementValue;
						
		}
		if([elementName isEqualToString:@"lekkage"]){		
		aOgs.lekkage			=	currentElementValue;
		}
	
	if([elementName isEqualToString:@"eerstehulp"]){
				aOgs.eerstehulp	 =	currentElementValue;
					
		
	}
	if([elementName isEqualToString:@"sub-gevi"]){
				aOgs.SUBGEVI	=	currentElementValue;
				
	}
	if([elementName isEqualToString:@"sub-gevi-nummer"]){
		aOgs.SUBGEVI_nummer		=	currentElementValue;
				
	}
	
	else {}
	
	[currentElementValue release];
	 currentElementValue				= nil;
	
	}


-(IBAction)doneButtonClick:(id)sender{
		[self.navigationController popViewControllerAnimated: YES];

}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	 [self navigationController].navigationBar.tintColor = [UIColor blackColor];
		searchdt						=	[NSString new];
		dataarrygv						=	[NSMutableArray new];
		self.navigationItem.title		=		@"Gevonden stoffen";
		[self.navigationItem setHidesBackButton:NO];
	
	UIBarButtonItem *newBackButton	= [[UIBarButtonItem alloc] initWithTitle: @"Terug" style: UIBarButtonItemStyleBordered target: nil action: nil];
	[[self navigationItem] setBackBarButtonItem: newBackButton];
	[newBackButton release];
   
	//////////////////////////////////////////
	//////////////////////////////////////////
	//To recieve the data  from the ichem data base by GEVI nummer
	
	if(flag_search==2){
		datasearch_column1				=   [NSMutableArray new];
		datasearch_column2				=   [NSMutableArray new];
		materiallist					=	[NSMutableArray new];
			
		NSArray *paths					= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
		NSString *documentsDirectory	= [paths objectAtIndex:0];
		NSString *path					= [documentsDirectory stringByAppendingPathComponent:DB_NAME];
		// Open the database. The database was prepared outside the application.
			
		if (sqlite3_open([path UTF8String], & database) <= SQLITE_OK) {
				
				NSLog(@"database opened suuccessfully");
				NSLog(@"string_GV_search	= %@",string_GV_search);
		        const char *sqlStatement	= "SELECT * FROM StoffenDataTable WHERE GEVI = ? ";
			
				sqlite3_stmt *compiledStatement;
				int error_code = sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL);
			
				if(error_code == SQLITE_OK) {
					
						sqlite3_bind_text(compiledStatement,1,[string_GV_search UTF8String],-1,SQLITE_TRANSIENT);
						while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
								// Read the data from the result row
												                 
								[datasearch_column1 addObject: [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)]];
								[datasearch_column2 addObject: [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 6)]];
			
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
	    }
	
	
	//////////////////////////////////////////
	//////////////////////////////////////////
	//To recieve the data  from the ichem data base by UN nummer
	
	if(flag_search==1){
			    datasearch_column1			 =   [NSMutableArray new];
				datasearch_column2			 =   [NSMutableArray new];
				materiallist				 =		[NSMutableArray new];
		
				NSArray *paths				 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
				NSString *documentsDirectory = [paths objectAtIndex:0];
				NSString *path = [documentsDirectory stringByAppendingPathComponent:DB_NAME];
		
		// Open the database. The database was prepared outside the application.
				if (sqlite3_open([path UTF8String], & database) <= SQLITE_OK){
						// Get the primary key for all books.
						
						NSLog(@"string_UN_search = %@",string_UN_search);
						const char *sqlStatement = "SELECT * FROM StoffenDataTable WHERE UN = ? ";
						sqlite3_stmt *compiledStatement;
					
						int error_code = sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL);
						
						if(error_code == SQLITE_OK) {
						// Loop through the results and add them to the feeds array
							sqlite3_bind_text(compiledStatement,1,[string_UN_search UTF8String],-1,SQLITE_TRANSIENT);
							while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
						// Read the data from the result row
		                 	//NSString *aNewValue = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)];

			[dataarrygv addObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)]];
			[datasearch_column1 addObject: [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 0)]];
			[datasearch_column2 addObject: [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 6)]];
								
			}
			} 	
			sqlite3_finalize(compiledStatement);
		     } 
		
		
		else {
		
			// Even though the open failed, call close to properly clean up resources.
								sqlite3_close(database);
									NSAssert1(0, @"Failed to open database with message '%s'.", sqlite3_errmsg(database));
									// Additional error handling, as appropriate...
		    }
		    }
	
	//////////////////////////////////////////////////
	//////////////////////////////////////////////////
	//To receive data from ichemdata base search by UN and GEVI nummer both
	
	
	
	if(flag_search==5){
		        materiallist		=	[NSMutableArray new];
				datasearch_column2	=	[NSMutableArray new];
				datasearch_column1  =   [NSMutableArray new];
		
			for(int i=0;i<[geviFrSrchFlg3 count];i++){
					[datasearch_column2 addObject:[dataaryfrflgsrch3 objectAtIndex:i]];
						[datasearch_column1 addObject:[geviFrSrchFlg3 objectAtIndex:i]];
	
			}
		
	        }
		       for(int i=0;i<[datasearch_column1 count];i++)
			{
		           [materiallist addObject:[datasearch_column1 objectAtIndex:i]];
		        	NSLog(@"dffsdf%@",[materiallist objectAtIndex:i]);
			}
	
			[tableFornaterial reloadData];
        	[super viewDidLoad];
          }

//////////////////////////////////////
//Table to search the material


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	return [materiallist count];
      }


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	//static NSString *CellIdentifier = @"Cell";
		UITableViewCell *cell;// = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
		//if (cell == nil) {
		cell				= [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:nil] autorelease];
		[cell.textLabel setFont:[UIFont boldSystemFontOfSize:13.0]];
	    
		// Set up the cell...
		NSString *cellValue = [materiallist objectAtIndex:indexPath.row];
		cell.textLabel.text = [NSString stringWithFormat:@"%@   %@", cellValue,[datasearch_column2 objectAtIndex:indexPath.row]];
	
	    //cell.detailTextLabel.text=[datasearch_column2 objectAtIndex:indexPath.row];
		return cell;
       }







- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if(flag_search==2){	
			searchdt         =    [materiallist objectAtIndex:indexPath.row];
	   }
	
	if(flag_search==1){
		searchdt	         =	[dataarrygv objectAtIndex:indexPath.row];	
	   }
	
	if(flag_search==5){
			searchdt		 =	[dataaryfrflgsrch3 objectAtIndex:indexPath.row];
	   }
	
		stofdata			 =	[datasearch_column2 objectAtIndex:indexPath.row];
	
	SubDiscriptionViewController *dvController = [[SubDiscriptionViewController alloc] init];//WithNibName:@"DetailView" bundle:[NSBundle mainBundle]];
	[self.navigationController pushViewController:dvController animated:YES];
	[dvController release];
	dvController = nil;
   
    }

- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath
    {
			return UITableViewCellAccessoryDisclosureIndicator;
    }


	//RootViewController.m
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
			[self tableView:tableView didSelectRowAtIndexPath:indexPath];

    }
///////////////////////////////////////////////////////////////////////////////////

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return NO;}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}
- (void)dealloc {
	 	[materiallist release];
	 	[currentElementValue release];
	 	[tableFornaterial release];
	 	[dataarrygv release];
	 	[super dealloc];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}



@end
