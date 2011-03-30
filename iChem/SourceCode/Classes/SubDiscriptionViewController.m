//
//  SubDiscriptionViewController.m
//  DemoProject
//
//  Created by CHROME INFOTECH  on 06/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SubDiscriptionViewController.h"
#import "ogs.h"
#import "Global.h"
#define DB_NAME @"ichemAlertDataBase.sqlite"
@implementation SubDiscriptionViewController
/////////////////////////////////////////////
//////////Function to open the ogstable


-(void)funfrogstabl{
	//NSString *str		=	[NSString new];
		NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
		NSString *documentsDirectory = [paths objectAtIndex:0];
		NSString *path = [documentsDirectory stringByAppendingPathComponent:DB_NAME];
	
	// Open the database. The database was prepared outside the application.
		if (sqlite3_open([path UTF8String], & database) <= SQLITE_OK) {
				// Get the primary key for all books.
				NSLog(@"database opened suuccessfully");
				const char *sqlStatement = "SELECT * FROM Ogstable WHERE gevino LIKE ?";
				sqlite3_stmt *compiledStatement;
		
				int error_code					                = sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL);
				if(error_code == SQLITE_OK) {
					NSString *strng						        =	[NSString new];
						strng								    =	@"%";
						NSString *string					    =[searchdt stringByAppendingString:strng];
							NSString *string1					=	[strng stringByAppendingString:string];
						NSLog(@"ejvivjoijvjfiivjfjvf900--=->>>>>>??????%@",string1);
						// Loop through the results and add them to the feeds array
						sqlite3_bind_text(compiledStatement,1,[string1 UTF8String],-1,SQLITE_TRANSIENT);
						//sqlite3_bind_text(compiledStatement,2,[string_GV_search UTF8String],-1,SQLITE_TRANSIENT);
			
			               while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
							//Aogs				=	[ogs new];
							   
						        Aogs.gevino				        =	[NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 0)];
			                 	Aogs.omschrijving				=	[NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)];
								Aogs.brand_explosie				=	[NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 2)];
                                Aogs.gezondheid					=	[NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 3)];
								Aogs.openbare_veiligheid		=	[NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 4)];
								Aogs.beschermende_kleding		=	[NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 5)];
								Aogs.evacuatie					=	[NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 6)];
			                 	Aogs.brand						=	[NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 7)];
								Aogs.lekkage					=	[NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 8)];
								Aogs.eerstehulp					=	[NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 9)];
								Aogs.SUBGEVI					=	[NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 10)];
								Aogs.SUBGEVI_nummer				=	[NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 11)];
				
				               // Read the data from the result row
							   //	str=Aogs.SUBGEVI;
								[dataforogs  addObject: Aogs];
								//[datasearch_column1 addObject: [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 0)]];
								//[datasearch_column2 addObject: [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 6)]];
			}
						//[web_Stof loadHTMLString:str baseURL:nil];
			} 	
						//mylabel.text=str;
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



/////////////////////////////////////////////////////////////////
///////////////////
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
///////////////////////////////////////////////
//////////////set the navigation bar	
		[self.navigationController setNavigationBarHidden:NO];
		[self.navigationItem setHidesBackButton:NO];
		[self navigationController].navigationBar.tintColor	= [UIColor blackColor];/////////////make the navigation back bar color black
	
	     Aogs											    =	[ogs new];
	
	    /////////////////////////////////////////////////
	     ////To give discription about the subtance in five WebView 
	    [self funfrogstabl];
	
	
    	[web_Stof setBackgroundColor:[UIColor clearColor]];
		[web_Gevaar setBackgroundColor:[UIColor clearColor]];
		[web_Veiligheid setBackgroundColor:[UIColor clearColor]];
		[web_Bronbestrijding setBackgroundColor:[UIColor clearColor]];
		[web_Eerstehulp setBackgroundColor:[UIColor clearColor]];

	    
	    NSString   *html								    =	[NSString stringWithFormat:@"<html><head></head><body>"];
		NSString  *matterwithhtml							=	[NSString new];
		NSString *mater										=	[NSString stringWithFormat:@"<font size=\"3\"><p><b>Gevonden stof: <font color=\"#0055FF\">%@</font><font size=\"3\"><p><b>Gevarenidentificatienummer(GEVI): <font color=\"#0055FF\">%@</font><font size=\"3\">%@</font>",stofdata,Aogs.gevino,Aogs.SUBGEVI, nil];
	    matterwithhtml									    =	[html stringByAppendingFormat:mater] ;
		NSString *ImageString								=   [NSString new];
		ImageString											=	@"<img src="; 
		ImageString											=	[ImageString stringByAppendingFormat:@"5.1.gif"];
		ImageString											=	[ImageString stringByAppendingFormat:@">"];
		ImageString											=	[ImageString stringByAppendingFormat:@"<img src="];
		ImageString											=	[ImageString stringByAppendingFormat:@"6.1.gif"];
		ImageString											=	[ImageString stringByAppendingFormat:@">"];
        matterwithhtml										=	[matterwithhtml stringByAppendingFormat:ImageString];
		matterwithhtml = [matterwithhtml stringByAppendingString:@"</body></html>"];
	
		//[web_Stof reload];
	NSString *path = [[NSBundle mainBundle] bundlePath];
	
	NSURL *baseURL = [NSURL fileURLWithPath:path];
	[web_Stof loadHTMLString:matterwithhtml baseURL:baseURL];
	
	NSString *matterwithhtmlfrgevaar						=	[NSString stringWithFormat:@"<font size=\"3\"><p><b>Gevonden stof: <font color=\"#0055FF\">%@</font><font size=\"3\"><p><b><font color=\"#0055FF\">GEZONDHIED:</font color>%@</font><font size=\"3\"><p><b><font color=\"#0055FF\">BRAND OF EXPLOIE: </font color>%@",stofdata,Aogs.gezondheid,Aogs.brand_explosie,nil];
	matterwithhtmlfrgevaar									=	[html stringByAppendingFormat:matterwithhtmlfrgevaar] ;
	
	matterwithhtmlfrgevaar = [matterwithhtmlfrgevaar stringByAppendingString:@"</body></html>"];
	[web_Gevaar loadHTMLString:matterwithhtmlfrgevaar baseURL:nil];
	
	NSString *matterwithhtmlfrVeilighied					=  [NSString stringWithFormat:@"<font size=\"3\"><p><b>Gevonden stof: <font color=\"#0055FF\">%@</font><font size=\"3\">%@</font><font size=\"3\"><p><b><font color=\"#0055FF\">BESCHERMENDE KLEDING</font color>%@",stofdata,Aogs.openbare_veiligheid,Aogs.beschermende_kleding,nil];
	matterwithhtmlfrVeilighied								=	[html stringByAppendingFormat:matterwithhtmlfrVeilighied] ;
	
	matterwithhtmlfrVeilighied								= [matterwithhtmlfrVeilighied stringByAppendingString:@"</body></html>"];
	[web_Veiligheid loadHTMLString:matterwithhtmlfrVeilighied baseURL:nil];
	
				/*NSString  *srt5		 =	[NSString new];
		 srt2	=	Aogs.beschermende_kleding ;
	[	 web_bk loadHTMLString:srt5 baseURL:nil];*/
	NSString *matterwithhtmlfrbronbestrijding				=  [NSString stringWithFormat:@"<font size=\"3\"><p><b>Gevonden stof: <font color=\"#0055FF\">%@</font><font size=\"3\"><p><b><font color=\"#0055FF\">BRAND:</font color>%@",stofdata,Aogs.brand,nil];
		matterwithhtmlfrbronbestrijding							=	[html stringByAppendingFormat:matterwithhtmlfrbronbestrijding] ; 
		matterwithhtmlfrbronbestrijding							=  [matterwithhtmlfrbronbestrijding stringByAppendingString:@"</body></html>"];
		[web_Bronbestrijding loadHTMLString:matterwithhtmlfrbronbestrijding baseURL:nil];
		NSString *matterwithhtmlfrEerstehulp					=  [NSString stringWithFormat:@"<font size=\"3\"><p><b>Gevonden stof: <font color=\"#0055FF\">%@</font><font size=\"3\">%@</font>",stofdata,Aogs.eerstehulp,nil];
	    matterwithhtmlfrEerstehulp								=	[html stringByAppendingFormat:matterwithhtmlfrEerstehulp] ; 
	    matterwithhtmlfrEerstehulp								=  [matterwithhtmlfrEerstehulp stringByAppendingString:@"</body></html>"];
	
		
		
	
	[web_Eerstehulp loadHTMLString:matterwithhtmlfrEerstehulp baseURL:nil];
	
	
	////////////////////////////////////////////////////////////////////////////////
	/////////
	CGRect frame = CGRectMake(0,0, 1534, 278);
	
		myscroll.contentSize							= frame.size;
	 	[button_Stof setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
	 	[button_Stof1 setImage:[UIImage imageNamed:@"whiteDot.png"] forState:UIControlStateNormal];
	 	[button_Gevaar1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
	 	[button_Bronbestrijding1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
	 	[button_Eerste_hulp1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
	 	[button_Veiligheid1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
		UIImage *image									= [UIImage imageNamed: @"text-ichem.png"];
	 	leftButton.hidden								=YES;
	 	UIImageView *imageView							= [[UIImageView alloc] initWithImage: image];
	 	self.navigationItem.titleView					= imageView;
	 	label_last.hidden								=YES;
	 	label_left.hidden								=YES;
	 	//button_left.hidden=YES;
		[super viewDidLoad];
	
} 
////////////////////////////////
///if left button is pressed
-(IBAction)pressofleftbutton:(id)argName{	
			
	if(myscroll.contentOffset.x>=308.0 && myscroll.contentOffset.x<615.0){
		label_last.hidden							        =YES;
				label_left.hidden							=YES;
				label_right.text							=@"Gevaar";
				//button_left.hidden=YES;
		        label_first.hidden							=NO;
				button_right.hidden							=NO;
				leftButton.hidden							=YES;
				label_right.hidden							=NO;
				[button_Stof1 setImage:[UIImage imageNamed:@"whiteDot.png"] forState:UIControlStateNormal];
				[button_Gevaar1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
				[button_Bronbestrijding1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
				[button_Eerste_hulp1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
				[button_Veiligheid1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
						[myscroll setContentOffset:CGPointMake(0.0, 0.0) animated:YES];
				[button_Stof setTitleColor: [UIColor blueColor] forState: UIControlStateNormal];
				[button_Gevaar setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
				[button_Bronbestrijding setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
				[button_Eerste_hulp setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
				[button_Veiligheid setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
		
	}
	if(myscroll.contentOffset.x>=615.0 && myscroll.contentOffset.x<921.0){
		
		        label_left.text							=@"Gevaar";
				label_right.text						=@"Veiligheid";
		 		label_last.hidden						=YES;
		 		label_left.hidden						=NO;
		 		 		 		label_first.hidden						=YES;
		 		button_right.hidden						=NO;
		 		leftButton.hidden						=NO;
		 		label_right.hidden						=NO;
		 		[button_Stof setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
		 		[button_Gevaar setTitleColor: [UIColor blueColor] forState: UIControlStateNormal];
		 		[button_Bronbestrijding setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
		 		[button_Eerste_hulp setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
		 		[button_Veiligheid setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
		 		[button_Stof1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
		 		[button_Gevaar1 setImage:[UIImage imageNamed:@"whiteDot.png"] forState:UIControlStateNormal];
		 		[button_Bronbestrijding1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
		 		[button_Eerste_hulp1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
		 		[button_Veiligheid1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
		 		[myscroll setContentOffset:CGPointMake(308.0, 0.0) animated:YES];
		
	}
	if(myscroll.contentOffset.x>=921.0 && myscroll.contentOffset.x<1230.0){
		        label_left.text						=@"Veiligheid";
		 		label_right.text					=@"Bronbestrijding";
		 		label_last.hidden					=YES;
		 		label_left.hidden					=NO;
				label_first.hidden					=YES;
				button_right.hidden					=NO;
				label_right.hidden					=NO;
		 		[button_Stof1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
		 		[button_Gevaar1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
		 		[button_Bronbestrijding1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
		 		[button_Eerste_hulp1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
		 		[button_Veiligheid1 setImage:[UIImage imageNamed:@"whiteDot.png"] forState:UIControlStateNormal];
		 		[myscroll setContentOffset:CGPointMake(615.0, 0.0) animated:YES];
		 		[button_Stof setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
		 		[button_Gevaar setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
		 		[button_Bronbestrijding setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
		 		[button_Eerste_hulp setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
		 		leftButton.hidden					=NO;
		 		[button_Veiligheid setTitleColor: [UIColor blueColor] forState: UIControlStateNormal];
		
	}
	
	if(myscroll.contentOffset.x>=1230){
		        [button_Stof1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
		 		[button_Gevaar1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
		 		[button_Bronbestrijding1 setImage:[UIImage imageNamed:@"whiteDot.png"] forState:UIControlStateNormal];
 		        [button_Eerste_hulp1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
		 		[button_Veiligheid1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
		 		label_left.text						=@"Bronbestrijding";
		 		label_right.text					=@"Eerstehulp";
		 		label_last.hidden					=YES;
		 		label_left.hidden					=NO;
		 		 		//button_left.hidden=NO;
		 		label_first.hidden					=YES;
		 		button_right.hidden					=NO;
		 		label_right.hidden					=NO;
		 		[myscroll setContentOffset:CGPointMake(921.0, 0.0) animated:YES];
		 		leftButton.hidden					=NO;
		 		[button_Stof setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
		 		[button_Gevaar setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
		 		[button_Bronbestrijding setTitleColor: [UIColor blueColor] forState: UIControlStateNormal];
		 		[button_Eerste_hulp setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
		 		[button_Veiligheid setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
	}
	}	


///////////////////////////////////	
////////////////////////////
//////////////////////////////////
///if stofbutton button is pressed



-(IBAction)pressstof:(id)argName{
	
	//UIImage *img = [UIImage imageNamed:@"image.png"];
	
      	label_last.hidden						=YES;
		label_left.hidden						=YES;
		label_right.hidden						=YES;
		label_right.text						=@"Gevaar";
		label_first.hidden						=NO;
		button_right.hidden						=NO;
		label_right.hidden						=NO;
		leftButton.hidden						=YES;
		[button_Stof1 setImage:[UIImage imageNamed:@"whiteDot.png"] forState:UIControlStateNormal];
		[button_Gevaar1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
		[button_Bronbestrijding1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
		[button_Eerste_hulp1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
		[button_Veiligheid1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
		[myscroll setContentOffset:CGPointMake(0.0, 0.0) animated:YES];
		[button_Stof setTitleColor: [UIColor blueColor] forState: UIControlStateNormal];
		[button_Gevaar setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
		[button_Bronbestrijding setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
		[button_Eerste_hulp setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
		[button_Veiligheid setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
	
}

///////////////////////////////////	
////////////////////////////
//////////////////////////////////
///if Gevaarbutton button is pressed


-(IBAction)pressGevaar:(id)argName{
	
	    label_left.text                     =@"Gevaar";
	    leftButton.hidden					=NO;
	     label_right.text=@"Veiligheid";
		label_last.hidden					=YES;
		label_left.hidden					=NO;
		//button_left.hidden=NO;
		label_first.hidden					=YES;
		button_right.hidden					=NO;
		label_right.hidden					=NO;
		label_right.hidden					=NO;
		[button_Stof setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
		[button_Gevaar setTitleColor: [UIColor blueColor] forState: UIControlStateNormal];
		[button_Bronbestrijding setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
		[button_Eerste_hulp setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
		[button_Veiligheid setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
		[button_Stof1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
		[button_Gevaar1 setImage:[UIImage imageNamed:@"whiteDot.png"] forState:UIControlStateNormal];
		[button_Bronbestrijding1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
		[button_Eerste_hulp1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
		[button_Veiligheid1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
		[myscroll setContentOffset:CGPointMake(308.0, 0.0) animated:YES];
		
}

///////////////////////////////////	
////////////////////////////
//////////////////////////////////
///if Veiligheidbutton button is pressed



-(IBAction)pressVeiligheid:(id)argName{
	
	    label_left.text					=@"Veiligheid";
		label_right.text				=@"Bronbestrijding";
		label_last.hidden				=YES;
		label_left.hidden				=NO;
		label_right.hidden				=NO;
		label_first.hidden				=YES;
		button_right.hidden				=NO;
		label_right.hidden				=NO;
		[button_Stof1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
		[button_Gevaar1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
		[button_Bronbestrijding1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
		[button_Eerste_hulp1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
		[button_Veiligheid1 setImage:[UIImage imageNamed:@"whiteDot.png"] forState:UIControlStateNormal];
		[myscroll setContentOffset:CGPointMake(615.0, 0.0) animated:YES];
		[button_Stof setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
		[button_Gevaar setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
		[button_Bronbestrijding setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
		[button_Eerste_hulp setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
		[button_Veiligheid setTitleColor: [UIColor blueColor] forState: UIControlStateNormal];

}

///////////////////////////////////	
////////////////////////////
//////////////////////////////////
///ifBronbestrijdingbutton button is pressed

-(IBAction)pressBronbestrijding:(id)argName{
	     [button_Stof1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
		[button_Gevaar1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
		[button_Bronbestrijding1 setImage:[UIImage imageNamed:@"whiteDot.png"] forState:UIControlStateNormal];
		[button_Eerste_hulp1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
		[button_Veiligheid1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
		label_left.text					=@"Bronbestrijding";
		label_right.text				=@"Eerstehulp";
		label_last.hidden				=YES;
		label_left.hidden				=NO;
	    label_right.hidden				=NO;
		//button_left.hidden=NO;
		label_first.hidden				=YES;
		button_right.hidden				=NO;
		label_right.hidden				=NO;
		[myscroll setContentOffset:CGPointMake(921.0, 0.0) animated:YES];
	     [button_Stof setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
		[button_Gevaar setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
		[button_Bronbestrijding setTitleColor: [UIColor blueColor] forState: UIControlStateNormal];
		[button_Eerste_hulp setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
		[button_Veiligheid setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
	
}

///////////////////////////////////	
////////////////////////////
//////////////////////////////////
///if rightbutton button is pressed

-(IBAction)pressofrightbutton:(id)argName{
	if(myscroll.contentOffset.x>=0.0 && myscroll.contentOffset.x<308.0){
				leftButton.hidden				=NO;
				label_left.text					=@"Gevaar";
				label_right.text				=@"Veiligheid";
				label_last.hidden				=YES;
				label_left.hidden				=NO;
				//button_left.hidden=NO;
				label_first.hidden				=YES;
				button_right.hidden				=NO;
				label_right.hidden				=NO;
				label_right.hidden				=NO;
				[button_Stof setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
			    [button_Gevaar setTitleColor: [UIColor blueColor] forState: UIControlStateNormal];
			    [button_Bronbestrijding setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
			    [button_Eerste_hulp setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
			    [button_Veiligheid setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
			    [button_Stof1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
				[button_Gevaar1 setImage:[UIImage imageNamed:@"whiteDot.png"] forState:UIControlStateNormal];
				[button_Bronbestrijding1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
				[button_Eerste_hulp1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
				[button_Veiligheid1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];	
				[myscroll setContentOffset:CGPointMake(308.0, 0.0) animated:YES];
		
}	
	

	
	if(myscroll.contentOffset.x>=308.0 && myscroll.contentOffset.x<615.0){
		        leftButton.hidden				=NO;
				label_left.text					=@"Veiligheid";
				label_right.text				=@"Bronbestrijding";
				label_last.hidden				=YES;
				label_left.hidden				=NO;
				//button_left.hidden=NO;
				label_first.hidden				=YES;
				button_right.hidden				=NO;
				label_right.hidden				=NO;
				label_right.hidden				=NO;
				[button_Stof1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
				[button_Gevaar1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
				[button_Bronbestrijding1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
				[button_Eerste_hulp1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
				[button_Veiligheid1 setImage:[UIImage imageNamed:@"whiteDot.png"] forState:UIControlStateNormal];
				[myscroll setContentOffset:CGPointMake(615.0, 0.0) animated:YES];
				[button_Stof setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
				[button_Gevaar setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
				[button_Bronbestrijding setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
				[button_Eerste_hulp setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
				[button_Veiligheid setTitleColor: [UIColor blueColor] forState: UIControlStateNormal];
		
	}
	if(myscroll.contentOffset.x>=615.0 && myscroll.contentOffset.x<921.0){
		        leftButton.hidden				=NO;
				label_right.hidden			    =NO;
				[button_Stof1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
				[button_Gevaar1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
				[button_Bronbestrijding1 setImage:[UIImage imageNamed:@"whiteDot.png"] forState:UIControlStateNormal];
				[button_Eerste_hulp1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
				[button_Veiligheid1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];		
		        label_left.text					=@"Bronbestrijding";
				label_right.text				=@"Eerstehulp";
				label_last.hidden				=YES;
				label_left.hidden				=NO;
				//button_left.hidden=NO;
				label_first.hidden				=YES;
				button_right.hidden				=NO;
				label_right.hidden				=NO;
				[myscroll setContentOffset:CGPointMake(921.0, 0.0) animated:YES];
				[button_Stof setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
				[button_Gevaar setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
                 [button_Eerste_hulp setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
				[button_Veiligheid setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
		
	}
	
	if(myscroll.contentOffset.x>=921.0 && myscroll.contentOffset.x<1230.0){
				leftButton.hidden				=NO;
				label_left.text					=@"Bronbestrijding";
				//label_right.text				=@"Eerstehulp";
				label_last.hidden				=NO;
				label_left.hidden				=YES;
				//button_left.hidden=NO;
				label_first.hidden				=YES;
				button_right.hidden				=YES;
				label_right.hidden				=YES;
				label_right.hidden				=YES;
				[button_Stof1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
				[button_Gevaar1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
				[button_Bronbestrijding1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
				[button_Eerste_hulp1 setImage:[UIImage imageNamed:@"whiteDot.png"] forState:UIControlStateNormal];
				[button_Veiligheid1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
				[myscroll setContentOffset:CGPointMake(1230.0, 0.0) animated:YES];
				[button_Stof setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
				[button_Gevaar setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
				[button_Bronbestrijding setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
				[button_Eerste_hulp setTitleColor: [UIColor blueColor] forState: UIControlStateNormal];
				[button_Veiligheid setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
	     }
		}	


///////////////////////////////////	
////////////////////////////
//////////////////////////////////
///if Eerstehulpbutton button is pressed


-(IBAction)pressEerstehulp:(id)argName{
		label_left.text					=@"Bronbestrijding";
		label_right.text				=@"Eerstehulp";
		label_last.hidden				=NO;
		label_left.hidden				=YES;
		label_first.hidden				=YES;
		button_right.hidden				=YES;
		label_right.hidden				=NO;
		label_right.hidden              =YES;
		[button_Stof1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
		[button_Gevaar1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
		[button_Bronbestrijding1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
		[button_Eerste_hulp1 setImage:[UIImage imageNamed:@"whiteDot.png"] forState:UIControlStateNormal];
		[button_Veiligheid1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
		[myscroll setContentOffset:CGPointMake(1230.0, 0.0) animated:YES];
		[button_Stof setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
	    [button_Gevaar setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
		[button_Bronbestrijding setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
	    [button_Eerste_hulp setTitleColor: [UIColor blueColor] forState: UIControlStateNormal];
	    [button_Veiligheid setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
	
}






// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


///////////////////////////////////////////
//////////////////////////////////
//to control the event on scrolling


- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
		int page								    = floor((scrollView.contentOffset.x - 308 / 2) / 308) + 1;
			if(page==0)
			{
				
				label_last.hidden					=YES;
				label_left.hidden					=YES;
				label_right.text					=@"Gevaar";
				label_right.hidden					=YES;
				label_first.hidden					=NO;
				button_right.hidden					=NO;
				leftButton.hidden					=YES;
				label_right.hidden					=NO;
				[button_Stof1 setImage:[UIImage imageNamed:@"whiteDot.png"] forState:UIControlStateNormal];
				[button_Gevaar1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
				[button_Bronbestrijding1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
				[button_Eerste_hulp1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
				[button_Veiligheid1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
				[myscroll setContentOffset:CGPointMake(0.0, 0.0) animated:YES];
				[button_Stof setTitleColor: [UIColor blueColor] forState: UIControlStateNormal];
				[button_Gevaar setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
				[button_Bronbestrijding setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
				[button_Eerste_hulp setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
				[button_Veiligheid setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
				

	       }
	
	  if(page==1){
				label_left.text						=@"Gevaar";
		        label_right.hidden					=NO;
				label_right.text					=@"Veiligheid";
				label_last.hidden					=YES;
				label_left.hidden					=NO;
		
				leftButton.hidden					=NO;
				label_first.hidden					=YES;
				button_right.hidden					=NO;
				label_right.hidden					=NO;
				[button_Stof setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
				[button_Gevaar setTitleColor: [UIColor blueColor] forState: UIControlStateNormal];
				[button_Bronbestrijding setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
				[button_Eerste_hulp setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
				[button_Veiligheid setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
				[button_Stof1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
				[button_Gevaar1 setImage:[UIImage imageNamed:@"whiteDot.png"] forState:UIControlStateNormal];
				[button_Bronbestrijding1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
				[button_Eerste_hulp1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
				[button_Veiligheid1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
				[myscroll setContentOffset:CGPointMake(308.0, 0.0) animated:YES];
			   
	         }	
	
	
	
		if(page==2)	{		
		
		label_left.text				=	@"Veiligheid";
		label_right.text			=	@"Bronbestrijding";
		leftButton.hidden=NO;
		label_right.hidden		=NO;
		label_last.hidden			=	YES;
		label_left.hidden			=	NO;
		label_first.hidden			=	YES;
	    button_right.hidden			=	NO;
		label_right.hidden			=	NO;
        [button_Stof1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
		[button_Gevaar1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
		[button_Bronbestrijding1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
		[button_Eerste_hulp1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
		[button_Veiligheid1 setImage:[UIImage imageNamed:@"whiteDot.png"] forState:UIControlStateNormal];
		[myscroll setContentOffset:CGPointMake(615.0, 0.0) animated:YES];
		[button_Stof setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
		[button_Gevaar setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
		[button_Bronbestrijding setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
		[button_Eerste_hulp setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
		[button_Veiligheid setTitleColor: [UIColor blueColor] forState: UIControlStateNormal];		
		
	}
	
	
if(page==3){	
		        label_right.hidden				=NO;
			    [button_Stof1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
				[button_Gevaar1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
				[button_Bronbestrijding1 setImage:[UIImage imageNamed:@"whiteDot.png"] forState:UIControlStateNormal];
				[button_Eerste_hulp1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
				[button_Veiligheid1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
				label_left.text					=@"Bronbestrijding";
				label_right.text				=@"Eerstehulp";
				label_last.hidden				=YES;
				label_left.hidden				=NO;
				leftButton.hidden				=NO;
				label_first.hidden				=YES;
				button_right.hidden				=NO;
				label_right.hidden				=NO;
				[myscroll setContentOffset:CGPointMake(921.0, 0.0) animated:YES];
				[button_Stof setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
				[button_Gevaar setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
				[button_Bronbestrijding setTitleColor: [UIColor blueColor] forState: UIControlStateNormal];
		        [button_Eerste_hulp setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
				[ button_Veiligheid setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
		
	}
	
	if(page==4){
		
		        label_right.hidden			    =NO;
				label_left.text					=@"Bronbestrijding";
				leftButton.hidden				=NO;
		        label_right.text				=	@"Eerstehulp";
				label_last.hidden				=NO;		
		        label_left.hidden				=YES;
		 		label_first.hidden				=YES;
		 		button_right.hidden				=YES;
			    label_right.hidden				=YES;
				[button_Stof1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
				[button_Gevaar1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
				[button_Bronbestrijding1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
				[button_Eerste_hulp1 setImage:[UIImage imageNamed:@"whiteDot.png"] forState:UIControlStateNormal];
				[button_Veiligheid1 setImage:[UIImage imageNamed:@"grayDot.png"] forState:UIControlStateNormal];
				[myscroll setContentOffset:CGPointMake(1230.0, 0.0) animated:YES];
		        [button_Stof setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
				[button_Gevaar setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
				[button_Bronbestrijding setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
				[button_Eerste_hulp setTitleColor: [UIColor blueColor] forState: UIControlStateNormal];
				[button_Veiligheid setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
		
	}
	}
//////////////////////////////////////////////////////////////////////



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
	
		[leftButton release];
 		[web_Gevaar    release];
		[web_Veiligheid release];
		[web_Bronbestrijding release];
		[mylabel release];
		[web_Stof release];
		[myscroll release];
		[button_Stof  release];
		[button_Gevaar release];
		[button_Veiligheid release];
		[button_Bronbestrijding release];
		[button_Eerste_hulp release];
		[button_Stof1 release];
		[button_Gevaar1 release];
		[button_Veiligheid1 release];
		[button_Bronbestrijding1 release];
		[button_Eerste_hulp1 release];
		[label_right release];
		[label_left release];
		[label_stof release];
		[button_right release];
		[label_first release];
	    [super dealloc];
}


@end
