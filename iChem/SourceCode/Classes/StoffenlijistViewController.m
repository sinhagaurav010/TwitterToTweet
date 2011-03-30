//
//  StoffenlijistViewController.m
//  DemoProject
//
//  Created by CHROME INFOTECH  on 03/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "StoffenlijistViewController.h"
#import "SubDiscriptionViewController.h"
#import "NumberOfitemViewController.h"
#define	DB_NAME @"ichemAlertDataBase.sqlite"
@implementation StoffenlijistViewController
@synthesize table_stofen_2,table_stofen;
////////////////////////////////////////////////////////////
//Function for # section


-(void)FunforNumValue
{
	
/////////////////////////////////
///////////temparrayNO is taken as NSmutable array to store key for dictionary 	
	
	NSMutableArray *temparryNO;
	temparryNO					=	[NSMutableArray new];
	[temparryNO addObject:@"1%"];
	[temparryNO addObject:@"2%"];
	[temparryNO addObject:@"3%"];
	[temparryNO addObject:@"4%"];
	[temparryNO addObject:@"5%"];
	[temparryNO addObject:@"6%"];
	[temparryNO addObject:@"7%"];
	[temparryNO addObject:@"8%"];
	[temparryNO addObject:@"9%"];
	
	
	NSArray *paths					= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory	= [paths objectAtIndex:0];
	NSString *path					= [documentsDirectory stringByAppendingPathComponent:DB_NAME];
	sqlite3_stmt *compiledStatement;
	// Open the database. The database was prepared outside the application.
	
	if (sqlite3_open([path UTF8String], & database) <= SQLITE_OK) 
	{
		// Get the primary key for all books.
	     NSLog(@"database opened suuccessfully");
		for(int i=0;i<[temparryNO count];i++)
	{
		
	const char *sqlStatement = "SELECT * FROM StoffenDataTable WHERE Name1 LIKE ? ";
	int error_code			 = sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL);
	if(error_code == SQLITE_OK) {
	// Loop through the results and add them to the feeds array
	sqlite3_bind_text(compiledStatement,1,[[temparryNO objectAtIndex:i]UTF8String],-1,SQLITE_TRANSIENT);
		
	while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
	//success=1;
	// Read the data from the result ro
		[dataarryfrnum addObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 6)]];
		
	}
	} 	
		// "Finalize" the statement - releases the resources associated with the statement.
		
	//sqlite3_finalize(compiledStatement);
	} 
	sqlite3_finalize(compiledStatement);
	}

	else 
	{
	// Even though the open failed, call close to properly clean up resources.
		sqlite3_close(database);
		NSAssert1(0, @"Failed to open database with message '%s'.", sqlite3_errmsg(database));
		// Additional error handling, as appropriate...
	 }
	     }



///////////////////////////////////////////////////////////////////
//function for dictionary  returning void to get the string by sorting


-(void)functionforstringsorting
{
	    NSArray *paths				 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
		NSString *documentsDirectory = [paths objectAtIndex:0];
		NSString *path				 = [documentsDirectory stringByAppendingPathComponent:DB_NAME];
		// Open the database. The database was prepared outside the application.
		
	tempArray1					 = [NSMutableArray new];
	[tempArray1 addObject:@"A"];
	[tempArray1 addObject:@"B"];
	[tempArray1 addObject:@"C"];
	[tempArray1 addObject:@"D"];
	[tempArray1 addObject:@"E"];
	[tempArray1 addObject:@"F"];
	[tempArray1 addObject:@"G"];
	[tempArray1 addObject:@"H"];
	[tempArray1 addObject:@"I"];
	[tempArray1 addObject:@"J"];
	[tempArray1 addObject:@"K"];
	[tempArray1 addObject:@"L"];
	[tempArray1 addObject:@"M"];
	[tempArray1 addObject:@"N"];
	[tempArray1 addObject:@"O"];
	[tempArray1 addObject:@"P"];
	[tempArray1 addObject:@"Q"];
	[tempArray1 addObject:@"R"];
	[tempArray1 addObject:@"S"];
	[tempArray1 addObject:@"T"];
	[tempArray1 addObject:@"U"];
	[tempArray1 addObject:@"V"];
	[tempArray1 addObject:@"W"];
	[tempArray1 addObject:@"X"];
	[tempArray1 addObject:@"Y"];
	[tempArray1 addObject:@"Z"];
	[tempArray1 addObject:@"#"];
			
	if (sqlite3_open([path UTF8String], & database) <= SQLITE_OK) 
	    {
                        //NSLog(@"string_UN_search = %@",string_UN_search);
						sqlite3_stmt *compiledStatement;
		
		for(int i=0;i<[tempArray count];i++)
				{ 
					
			NSString *strfornum  =	[NSString new];
			strfornum			 =	@"#";
					
			if([[tempArray objectAtIndex:i] isEqualToString:strfornum])
		     {
					//[dataTable addObject:dataarryfrnum];
			        [dictionaryForitem setObject:dataarryfrnum  forKey:[tempArray1 objectAtIndex:i] ];
		     }
					
				else
				{
					NSMutableArray *dataArrar = [[NSMutableArray alloc]init];
		            const char *sqlStatement  = "SELECT * FROM StoffenDataTable WHERE Name1 LIKE  ? GROUP BY Name1 ";
			
			       //sqlite3_stmt *compiledStatement;
		           int error_code = sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL);
		            if(error_code == SQLITE_OK) {
			        // Loop through the results and add them to the feeds array
			       sqlite3_bind_text(compiledStatement,1,[[tempArray objectAtIndex:i] UTF8String],-1,SQLITE_TRANSIENT);
				   while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
				   [dataArrar addObject: [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 6)]];
				}
			
		   }
							
		[dictionaryForitem setObject:dataArrar forKey:[tempArray1 objectAtIndex:i]];
					if (dataArrar)
					{
						[dataArrar release];
						dataArrar	=	nil;
					}
					
		}
		}
				//dictionaryForitem = [NSDictionary dictionaryWithObject:dataarrysort1 forKey:tempArray2];
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
	}





///////////////////////////////////////////////////////////////
/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;UIColor
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.


////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////In this function search string is passed on every entry 



-(NSMutableArray*) fetchData:(NSString*)searchString{
	
	    NSLog(@"searchString :%@", searchString);
        sqlite3_stmt *compiledStatement ;
	    NSArray *paths					= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
		NSString *documentsDirectory    = [paths objectAtIndex:0];
		NSString *path					= [documentsDirectory stringByAppendingPathComponent:DB_NAME];
		NSMutableArray *result			= [[NSMutableArray alloc]init];
		if (sqlite3_open([path UTF8String], & database) <= SQLITE_OK) 
		{	
	  		const char *sqlStatement	= "SELECT * FROM StoffenDataTable  WHERE Name1 LIKE ? GROUP BY Name1 ";
			int error_code				= sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL);
		
				if(error_code == SQLITE_OK) {
						//NSLog(@"dfcdsdsc---------->>>>>>>>>>>>>>");
					    NSString *world			=	@"%";
						NSString *string		= [searchString stringByAppendingString:world];
						NSLog(@"%@", string);
						sqlite3_bind_text(compiledStatement,1,[string UTF8String],-1,SQLITE_TRANSIENT);
					
					     while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
							[result addObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 6)]];
			}
		} 	
	
    return result;
		
	sqlite3_finalize(compiledStatement);
	
	}
	
    sqlite3_close(database);
}


/////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////In this function search string is passed to check how many data on searching





-(NSMutableArray*) funforsamedata:(NSString*)searchString
	{
		
				NSArray *paths				 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
				NSString *documentsDirectory = [paths objectAtIndex:0];
				NSString *path				 = [documentsDirectory stringByAppendingPathComponent:DB_NAME];
		
				sqlite3_stmt *compiledStatement;
				NSMutableArray  *temparydata =	[NSMutableArray new];
		        // Open the database. The database was prepared outside the application.
				
		        if (sqlite3_open([path UTF8String], & database) <= SQLITE_OK) 
		        {
					
		           NSLog(@"database opened suuccessfully");
					//NSLog(@"string_UN_search = %@",string_UN_search);
				    const char *sqlStatement = "SELECT * FROM StoffenDataTable WHERE Name1 LIKE ? ";
					int error_code = sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL);
					
					if(error_code == SQLITE_OK) {
					sqlite3_bind_text(compiledStatement,1,[searchString UTF8String],-1,SQLITE_TRANSIENT);
						
					while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
					[frsamedata addObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 6)]];
					[datafrgevi addObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)]];
		            }
					} 	
		  
				   // "Finalize" the statement - releases the resources associated with the statement.
			        return temparydata;
					sqlite3_finalize(compiledStatement);
				}
			    else 
		         {
		         // Even though the open failed, call close to properly clean up resources.
			    sqlite3_close(database);
				NSAssert1(0, @"Failed to open database with message '%s'.", sqlite3_errmsg(database));
					// Additional error handling, as appropriate...
		          }
                	}
	
	
	
///////////////////////////////////////////////////////////////////////////////		
//////////////////////////////////////////////////////////////////////////////////////

- (void)viewDidLoad 
{
	

	dataTable				=	[NSMutableArray new];
	tag=1;
	////////////////////////////////
	////In first appear table_stoofen is not hidden but 2nd table is hidden
	
		[ self.view addSubview:table_stofen];
	    table_stofen_2.hidden=YES;
		
	    dictionaryForitem		=	[NSMutableDictionary new];
		tempArray				=	[NSMutableArray new];
		
	[tempArray addObject:@"A%"];
	[tempArray addObject:@"B%"];
	[tempArray addObject:@"C%"];
	[tempArray addObject:@"D%"];
	[tempArray addObject:@"E%"];
	[tempArray addObject:@"F%"];
	[tempArray addObject:@"G%"];
	[tempArray addObject:@"H%"];
	[tempArray addObject:@"I%"];
	[tempArray addObject:@"J%"];
	[tempArray addObject:@"K%"];
	[tempArray addObject:@"L%"];
	[tempArray addObject:@"M%"];
	[tempArray addObject:@"N%"];
	[tempArray addObject:@"O%"];
	[tempArray addObject:@"P%"];
	[tempArray addObject:@"Q%"];
	[tempArray addObject:@"R%"];
	[tempArray addObject:@"S%"];
	[tempArray addObject:@"T%"];
	[tempArray addObject:@"U%"];
	[tempArray addObject:@"V%"];
	[tempArray addObject:@"W%"];
	[tempArray addObject:@"X%"];
	[tempArray addObject:@"Y%"];
	[tempArray addObject:@"Z%"];
	[tempArray addObject:@"#"];
	
		dataarryfrnum					=  [NSMutableArray new];
		self.navigationItem.title		=	@"Stoffenlijst";
		[self FunforNumValue];
	    [self functionforstringsorting];
		datafrgevi						=	[NSMutableArray new];
		[super viewDidLoad];
}
//////////////////////////////////////////////////////////////////////////



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

		
	NSInteger numsection;

	if(tag==1){
		                    numsection = [tempArray1 count];
	}
	
			else {
							numsection = 1;
	}
	
    return numsection;	
		
}


//////////////////////////////////////////////////////////


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if(tag==1){
				return [[dictionaryForitem objectForKey:[tempArray1 objectAtIndex:section]] count];
		}
	
	else {
			return [resultRow count];
		}	
	}

///////////////////////////////////////////////////////////////////
////////////title for header section is only for table_stoffen


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
		
	if(tag==1){
			return [tempArray1 objectAtIndex:section];	
		}
		}
	
	
		


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

	
	//static NSString *CellIdentifier = @"Cell";
		UITableViewCell *cell;// = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
		//if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:nil] autorelease];
	    [cell.textLabel setFont:[UIFont boldSystemFontOfSize:13.0]];
		//}	
		// Set up the cell...
		if(tag==1){
	    cell.textLabel.text	= [[dictionaryForitem objectForKey:[tempArray1 objectAtIndex:indexPath.section]] objectAtIndex: indexPath.row];
	     }
		else {
			cell.textLabel.text					= [resultRow objectAtIndex:indexPath.row];//objectForKey:@"name_nl_nl"];
		}
	    //cell.detailTextLabel.text=[datasearch_column2 objectAtIndex:indexPath.row];
		return cell;

}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
	//if ([tableView isEqual:table_stofen]) {
		if(tag==1){
			return tempArray1;
		}
		else{}
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	frsamedata1									=	[NSMutableArray new];
	frsamedata									=	[NSMutableArray new];
	
	/////////////////////////////////////////////////////
	///////To check number of data
		if(tag==1){
			[frsamedata1 addObject: [self funforsamedata:[[dictionaryForitem objectForKey:[tempArray1 objectAtIndex:indexPath.section]] objectAtIndex: indexPath.row]]];
		
	}
   
		else{
			 [frsamedata1 addObject:	[self funforsamedata:[resultRow objectAtIndex:indexPath.row]]];
	 }
	
	 
	if([frsamedata count]>1){
			    UIBarButtonItem *newBackButton				= [[UIBarButtonItem alloc] initWithTitle: @"Home" style: UIBarButtonItemStyleBordered target: nil action: nil];
				
				///////////////////////////////
		        ///////If it is greater than one then it will go to NumberOfitemViewController to tabluate
		       [[self navigationItem] setBackBarButtonItem: newBackButton];
			    NumberOfitemViewController *dvController	= [[NumberOfitemViewController alloc] init];//WithNibName:@"DetailView" bundle:[NSBundle mainBundle]];
				[self.navigationController pushViewController:dvController animated:YES];
	}
	
	else {
	
		UIBarButtonItem *newBackButton				= [[UIBarButtonItem alloc] initWithTitle: @"Terug" style: UIBarButtonItemStyleBordered target: nil action: nil];
		//	self.newBackButton.tintColor = [UIColor blackColor];
		[[self navigationItem] setBackBarButtonItem: newBackButton];
		searchdt									=	[datafrgevi objectAtIndex:0];
		stofdata									=	[frsamedata objectAtIndex:0];
		SubDiscriptionViewController *dvController	= [[SubDiscriptionViewController alloc] init];//WithNibName:@"DetailView" bundle:[NSBundle mainBundle]];
		[self.navigationController pushViewController:dvController animated:YES];
		}
     }

///////////////////////////////////////////////
//////////////////////////////////////////////
//In this function  with every entry table_stoffen_2 reload 




- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{

	//[table_stofen_2 removeAllObjects];// remove all data that belongs to previous search
		resultRow									= [[NSMutableArray alloc]init];
		resultRow									= [self fetchData:searchText];
		tag=0;
		[table_stofen_2 reloadData];
		if (searchBar.text.length >0) {
			table_stofen.hidden						=	YES;
            table_stofen_2.hidden					=	NO;		
		}

	
	else{
			    tag=1;
				[table_stofen reloadData];
				table_stofen.hidden					=	NO;
				table_stofen_2.hidden				=  YES;	
		}
	
	
}
	///////////////////////////////////////////////
	//////////////////////////////////////////////
//When search bar is used to search


- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
	
	// only show the status bar's cancel button while in edit mode
		search_item.showsCancelButton				= YES;
		search_item.autocorrectionType				= UITextAutocorrectionTypeNo;
}


////////////////////////////////////////
/////////When Text has been edited


- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
	search_item.showsCancelButton				= NO;

}

////////////////////////////////////////
/////////When searchBarCancelButton is Clicked


- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
											 tag	=1;
		[table_stofen reloadData];
		table_stofen.hidden							=NO;
		table_stofen_2.hidden						=YES;	
		[search_item resignFirstResponder];
		search_item.text							=@""; 
		table_stofen.hidden							=NO;

}



/////////////////////////////////////////////////////////

/*- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
	
	[self tableView:tableView didSelectRowAtIndexPath:indexPath];
}*/


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
	[table_stofen release];
	[table_stofen_2 release];
	[search_item release];
	[resultRow release];
	//[tag  release];
	
	
    [super dealloc];
}


@end
