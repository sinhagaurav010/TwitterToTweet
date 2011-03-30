#import <UIKit/UIKit.h>

@class SKCode, SKScannerViewController;

//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
/** The SKScannerViewControllerDelegate protocol defines methods that your delegate object
 must implement to interact with the scanner interface. The methods of of this protocol notify your delegate
 when the user places a recognizable barcode in front of the device's back-facing camera.
 
 */
@protocol SKScannerViewControllerDelegate <NSObject>

@required

/** Tells the delegate that the user placed a recognizable barcode in front of the device's back-facing camera, and the SKScannerViewController was
 able to recognize it.
 
 @param scanner The view controller object managing the barcode scanning interface.
 @param code An SKCode object containing all the relevant info about the code that was recognized.￼
 */
- (void)scannerViewController:(SKScannerViewController *)scanner didRecognizeCode:(SKCode *)code;

/** This method will be called on your delegate object whenever some sort of error occurs during scanning. You should react appropriately by 
 hiding or dismissing the scanner as no further scanning will take place once this method is called. For this reason, your delegate object is required to implement this method.
 
 @param scanner The view controller obejct managing the barcode scanning interface.
 @param error An NSError object whose userInfo is an NSDictionary whose "Reason" key contains a string describing the error that caused the scanning to stop.
*/
- (void)scannerViewController:(SKScannerViewController *)scanner didStopLookingForCodesWithError:(NSError *)error;

@optional

/** This method is optional and should only be used in extreme cases. It is provided for those who wish to extend the barcode scanning functionality and do some sort of extra processing on each frame coming off of the camera.
 Only implement this method if you absolute know you need it as there are serious performance concerns. If you do implement this method, you should try
 to do as little processing as possible and make sure whatever processing you do need to do on the UIImage that is returned is done quickly.
 
 @param scanner The view controller obejct managing the barcode scanning interface.
 @param image A UIImage object containg the image data from the most recent frame pulled off the device's back-facing camera. It's size is variable depending what type of device you are running on and its orientation is landscape. You should adjust your processing logic accordingly.
 */
- (void)scannerViewController:(SKScannerViewController *)scanner didAttemptCodeRecognitionInImage:(UIImage *)image;

@end