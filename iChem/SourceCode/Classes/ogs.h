//
//  ogs.h
//  DemoProject
//
//  Created by CHROME INFOTECH  on 05/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//


/**************************
 Discription
 
 this class is for different field of ogs file
 
 ***********************************/



#import <Foundation/Foundation.h>


@interface ogs : NSObject {
	
		NSString *gevino;
		NSString *omschrijving;
		NSString *brand_explosie;
		NSString *gezondheid;
		NSString *openbare_veiligheid;
		NSString *beschermende_kleding;
		NSString *evacuatie;
		NSString *brand;
		NSString *lekkage;
		NSString *eerstehulp;
		NSString *SUBGEVI;
		NSString *SUBGEVI_nummer;

}
@property (nonatomic, retain) NSString *omschrijving;
@property (nonatomic, retain) NSString *gevino;
@property (nonatomic, retain) NSString *gezondheid;
@property (nonatomic, retain) NSString *openbare_veiligheid;
@property (nonatomic, retain) NSString *evacuatie;
@property (nonatomic, retain) NSString *brand;
@property (nonatomic, retain) NSString *lekkage;
@property (nonatomic, retain) NSString *eerstehulp;
@property (nonatomic, retain) NSString *beschermende_kleding;
@property (nonatomic, retain) NSString *brand_explosie;
@property (nonatomic, retain) NSString *SUBGEVI;
@property (nonatomic, retain) NSString *SUBGEVI_nummer;
@end
