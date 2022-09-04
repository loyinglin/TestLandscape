//
//  LandscapeViewController.m
//  TestLandscape
//
//  Created by loyinglin on 2022/9/2.
//

#import "LandscapeViewController.h"
#import "ViewController.h"

@interface LandscapeViewController ()

@property (nonatomic, strong) UILabel *label;

@property (nonatomic, strong) UIWindow *testW;

@end

@implementation LandscapeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(200, 200, 200, 200)];
    self.label.textColor = [UIColor redColor];
    self.label.text = @"我是横屏vc";
    [self.view addSubview:self.label];
    
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
    btn.backgroundColor = [UIColor greenColor];
    [btn addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
//    [[UIDevice currentDevice] setValue:@(UIDeviceOrientationLandscapeRight) forKey:@"orientation"];
//    [[UIDevice currentDevice] setValue:@(UIDeviceOrientationLandscapeRight) forKey:@"orientation"];
//    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
//
//        [[UIDevice currentDevice] performSelector:@selector(setOrientation:) withObject:@(UIInterfaceOrientationLandscapeRight)];
//
//    }
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:@selector(setOrientation:)]];
    invocation.selector = NSSelectorFromString(@"setOrientation:");
    invocation.target = [UIDevice currentDevice];
    int initOrientation = UIDeviceOrientationLandscapeRight; // 这里我们需要传的值是设备方向值
    [invocation setArgument:&initOrientation atIndex:2];
    [invocation invoke];

//    [[self class] attemptRotationToDeviceOrientation];
//    [[UIDevice currentDevice] setValue:[NSNumber numberWithInt:UIInterfaceOrientationLandscapeRight] forKey:@"orientation"];
//    [[UIDevice currentDevice] setValue:[NSNumber numberWithInt:UIInterfaceOrientationLandscapeRight] forKey:@"orientation"];
    
//    self.testW = [[UIWindow alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
//    self.testW.hidden = NO;
//    self.testW.windowLevel = CGFLOAT_MAX;
//    self.testW.backgroundColor = [UIColor greenColor];
}


- (void)onClick {
//    [self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController pushViewController:[ViewController new] animated:YES];
}


- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscapeRight;
}
//
////
//- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
//    return UIInterfaceOrientationLandscapeRight;
//}

//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
//    return YES;
//}

- (BOOL)shouldAutorotate {
    return YES;
}

@end
