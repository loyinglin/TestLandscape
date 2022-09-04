//
//  AppDelegate.m
//  TestLandscape
//
//  Created by loyinglin on 2022/9/2.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "SSNavigationController.h"
#import "LandscapeViewController.h"

@interface AppDelegate ()

@property (nonatomic, strong) SSNavigationController *navigationVC;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    ViewController *vc = [ViewController new];
    self.navigationVC = [[SSNavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = self.navigationVC;
    
    [[NSNotificationCenter defaultCenter] addObserverForName:UIDeviceOrientationDidChangeNotification object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
        NSLog(@"NSNotification:%@, orientation:%d", note.userInfo, [(UIDevice *)note.object orientation]);
    }];
    return YES;
}

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
//    return UIInterfaceOrientationMaskAll;
    UIInterfaceOrientationMask ret = self.navigationVC.topViewController.supportedInterfaceOrientations;
//    ret = UIInterfaceOrientationMaskPortrait;
//    if ([self.navigationVC.topViewController isKindOfClass:LandscapeViewController.class]) {
//        ret = UIInterfaceOrientationMaskLandscapeRight;
//    }
//    else {
//        ret = UIInterfaceOrientationMaskPortrait;
//    }
    NSLog(@"UIInterfaceOrientationMask:%d", (int)ret);
    return ret;
}

- (UIWindow *)window {
    if (!_window) {
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _window.backgroundColor = [UIColor blackColor];
        [_window makeKeyAndVisible];
    }
    return _window;
}




@end
