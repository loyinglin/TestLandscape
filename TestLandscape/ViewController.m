//
//  ViewController.m
//  TestLandscape
//
//  Created by loyinglin on 2022/9/2.
//

#import "ViewController.h"
#import "LandscapeViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(200, 200, 200, 200)];
    self.label.textColor = [UIColor redColor];
    self.label.text = @"我是竖屏vc";
    [self.view addSubview:self.label];
    
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
    btn.backgroundColor = [UIColor greenColor];
    [btn addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:@selector(setOrientation:)]];
    invocation.selector = NSSelectorFromString(@"setOrientation:");
    invocation.target = [UIDevice currentDevice];
    int initOrientation = UIDeviceOrientationPortrait; // 这里我们需要传的值是设备方向值
    [invocation setArgument:&initOrientation atIndex:2];
    [invocation invoke];

}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

//- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
//    return UIInterfaceOrientationPortrait;
//}

- (void)onClick {
    LandscapeViewController *landVC = [[LandscapeViewController alloc] init];
    [self.navigationController pushViewController:landVC animated:YES];
    
//    landVC.modalPresentationStyle = UIModalPresentationFullScreen;
//    [self presentViewController:landVC animated:YES completion:nil];
}


- (BOOL)shouldAutorotate {
    return YES;
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id <UIViewControllerTransitionCoordinator>)coordinator {
    
}

@end
