#import "AppDelegate.h"
#import "SimpleTableController.h"

@implementation AppDelegate
@synthesize window = _window;

- (void)dealloc {
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    self.window.rootViewController = [[[SimpleTableController alloc] initWithStyle:UITableViewStyleGrouped] autorelease];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}
@end
