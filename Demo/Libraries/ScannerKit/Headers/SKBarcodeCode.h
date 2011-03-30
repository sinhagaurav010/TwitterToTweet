#import <Foundation/Foundation.h>
#import "SKCode.h"

typedef enum {
	SKBarcodeCodeTypeCode128 = 0,
	SKBarcodeCodeTypeCode39 = 1,
	SKBarcodeCodeTypeEAN13 = 2,
	SKBarcodeCodeTypeUPCA = 3,
	SKBarcodeCodeTypeITF = 4,
	SKBarcodeCodeTypeUPCEOrEAN8 = 5,
	SKBarcodeCodeTypeISBN10 = 6,
	SKBarcodeCodeTypeNotABarcode = 7,
	SKBarcodeCodeTypeUnknown = 8
} SKBarcodeCodeType;

//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
/** Barcode Object
 
 This SKCode object contains the barcode itself (usually a string of numeric digits) that was recognized in the barcode image the user scanned. 
 The type property contains a value indicating what type of barcode the object represents.
 
 */

@interface SKBarcodeCode : SKCode {
	NSString *_barcode;
	SKBarcodeCodeType _type;
}

/** A string representing the barcode that was recognized (Usually a string of numeric digits). */
@property (nonatomic, retain) NSString *barcode;

/** The type of barcode that was recognized. */
@property (nonatomic) SKBarcodeCodeType type;

@end