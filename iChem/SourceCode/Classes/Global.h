//
//  Global.h
//  DemoProject
//
//  Created by CHROME INFOTECH  on 03/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ogs.h"
#import "Stoffen.h"
/* Discription:
 This class  makes  some variable global*/

ogs                   *Aogs;					       /////////////a object ogs class to use globally
//NSInteger				sel;

UIButton            *doneButton;                      //////////////this button is used in Zoeken view controller for annuleer button
NSMutableArray		*dataaryfrflgsrch3;	             //////////////This mutable array is used to store data from stoffen table when flag=3 (UN and GEVI) in ZOEKEN view controller
NSMutableArray		*geviFrSrchFlg3;			    /////////////This mutable array is used to store of gevi data from stoffen table when flag=3 (UN and GEVI}
NSMutableArray		*datafrgevi;                    ////////////This mutable array is used to store the gevi data from stoffen table when flag=3 (UN and GEVI}
NSString			*stofdata;					     ////////////This string is used in subdiscription to print Gevondenstof element   
NSMutableArray		*datafrmUNtabl0;				////////////This mutable arry is used in Zoeken ViewController to take data from stoffen table column no.0
NSMutableArray		*datafrmUNtabl6;                ////////////This mutable arry is used in Zoeken ViewController to take data from stoffen table column no.6
NSMutableArray		*dataarry_Name;                 ////////////Name is given in four language this array is used to extract 1st name 
NSMutableArray		*dataarry_Lang;					////////////Name is given in four language this array is used to extract 1st language
NSMutableArray      *datasearch_column1;            ////////////used in many View controller to extract data from column in table
NSMutableArray      *datasearch_column2;              ////////////used in many View controller to extract data from column in table
NSString			*string_GV_search;             ////////////string is used to store the text in ZoekenViewController in GV_textfield
NSString			*searchdt;			             ///////////////define globally used in subdiscription View controller to search data from Ogstable so discription of material can retrieve
NSString            *string_UN_search;             ////////////string is used to store the text in ZoekenViewController in UN_textfield
NSMutableArray		*dataforogs;
NSInteger			flag_search;					 ////////////flag is used to whether search is going using onl GV ,UN-nummer or both
NSMutableArray      *frsamedata;					///////////////////this Mutablearray is used in numberOfItemViewcontroller to show the same data 
NSMutableArray      *frsamedata1;					///////////////////this Mutablearray is used in Stoffenlijistview controller  to check the number of data whether number of data is greater than one or equal to one 
NSMutableArray      *dataTable;						///////////This mutable array is used in Stoffenlijist View Controller for Stoffen_table2 in which with each entry table load
NSMutableDictionary	*dictionaryForitem;            ////////////////this NSMutableDictionary is used in stoffenlijistViewController  for table view table_stoffen
NSArray				*tempArray2;
NSMutableArray      *tempArray1;					///////////this mutablearray is used in stoffenlijist viewcontroller to store key for dictionary used for table_stoffen 
NSMutableArray      *tempArray;
Stoffen				*objs;                         /////////////a object of stoffen class to use globally
NSMutableArray      *dataarryfrnum;					////////////This mutablearray is used in StoffenlijistView Controller to store data from table stoffen from column 6
NSMutableArray      *elementList;
ogs					*aOgs;                                 /////////////a object ogs class to use globally
NSMutableArray		*data_aray_stofenjist;					////////used in parsing of stoffenlijist.xml
NSMutableArray		*data_arry_Sottefn;                     ////////used in parsing of stoffenlijist.xml
NSMutableArray		*data_arry_ogs;                         ///////used in parsing of ogs.xml
//NSMutableArray		*sortedString;

//NSInteger i,k;