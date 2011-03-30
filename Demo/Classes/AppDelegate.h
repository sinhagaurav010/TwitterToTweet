#import <UIKit/UIKit.h>

@class DemoViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow *window;
	DemoViewController *viewController;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) DemoViewController *viewController;

@end