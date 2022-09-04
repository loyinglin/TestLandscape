//
//  SSNavigationController.m
//  TestLandscape
//
//  Created by loyinglin on 2022/9/2.
//

#import "SSNavigationController.h"

@interface SSNavigationController ()

@end

@implementation SSNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    UIInterfaceOrientationMask ret = self.topViewController.supportedInterfaceOrientations;
//    ret = UIInterfaceOrientationMaskPortrait;
    NSLog(@"SSNavigationController supportedInterfaceOrientations:%d", ret);
    return ret;
}
//////
- (BOOL)shouldAutorotate {
    BOOL ret = self.topViewController.shouldAutorotate;
//    ret = NO;
    NSLog(@"shouldAutorotate:%d", ret);
    return ret;
}

@end
