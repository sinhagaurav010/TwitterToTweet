
#import <UIKit/UIKit.h>

@class EGOImageView;
@interface ExampleCell : UITableViewCell {
    UILabel *labelLabel;
    UILabel *labelDetail;
@private
	EGOImageView* imageView;
}
@property(nonatomic,retain)    UILabel *labelLabel;
@property(nonatomic,retain)     UILabel *labelDetail;


- (void)setFlickrPhoto:(NSString*)flickrPhoto;
-(void)setTitle:(NSString*)string;
-(void)setSubTitle:(NSString*)string;
@end
