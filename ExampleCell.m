
#import "ExampleCell.h"
#import "EGOImageView.h"

@implementation ExampleCell
@synthesize labelLabel,labelDetail;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.labelLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.origin.x+40, 4.0,self.frame.size.width, 20)];
        self.labelLabel.font = [UIFont boldSystemFontOfSize:15];
        
        self.labelDetail = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.origin.x+40,24,self.frame.size.width, 50)];
        self.labelLabel.backgroundColor = [UIColor clearColor];
        self.labelDetail.lineBreakMode = UILineBreakModeWordWrap;
       
        self.labelDetail.numberOfLines = 2;

        self.labelDetail.font = [UIFont systemFontOfSize:12];
        self.labelDetail.backgroundColor = [UIColor clearColor];
        
        [self addSubview:self.labelDetail];
        [self addSubview:self.labelLabel];
		imageView = [[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"placeholder.png"]];
		imageView.frame = CGRectMake(4.0f, 4.0f, 35, self.frame.size.height);
		[self.contentView addSubview:imageView];
	}
	
    return self;
}
-(void)setTitle:(NSString*)string
{
    self.labelLabel.text = string;
}

-(void)setSubTitle:(NSString*)string
{
    self.labelDetail.text = string;
}
- (void)setFlickrPhoto:(NSString*)flickrPhoto {
	imageView.imageURL = [NSURL URLWithString:flickrPhoto];
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
	[super willMoveToSuperview:newSuperview];
	
	if(!newSuperview) {
		[imageView cancelImageLoad];
	}
}
- (void)dealloc {
    [labelDetail release];
    [labelLabel release];
	[imageView release];
    [super dealloc];
}


@end
