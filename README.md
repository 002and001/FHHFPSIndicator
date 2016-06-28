# FHHFPSIndicator
Demo Project
==============
See `Demo/FHHFPSIndicator-master`

add the code in AppDelegate.m 

<pre>
#if defined(DEBUG) || defined(_DEBUG)
#import "FHHFPSIndicator.h"
#import "UIWindow+FHH.h"
#endif

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    // add the follwing code after window become keywindow
    #if defined(DEBUG) || defined(_DEBUG)
        [[FHHFPSIndicator sharedFPSIndicator] show];
//        [FHHFPSIndicator sharedFPSIndicator].fpsLabelPosition = FPSIndicatorPositionTopRight;
    #endif
    
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[HomeViewController alloc] init]];
    
    return YES;
}

</pre>
