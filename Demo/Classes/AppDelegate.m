#import "AppDelegate.h"
#import "DemoViewController.h"

@implementation AppDelegate

@synthesize window, viewController;

#pragma mark Application Lifecycle

- (void) applicationDidFinishLaunching:(UIApplication *)application {    
	window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

	viewController = [[DemoViewController alloc] init];
	UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];

	[window addSubview:navigationController.view];
	[window makeKeyAndVisible];
}
- (void) applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}

#pragma mark Memory Management

- (void) dealloc {
	[viewController release];
	[window release];

	[super dealloc];
}

@end