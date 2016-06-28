//
//  SubHomeViewController.m
//  FHHFPSIndicator-master
//
//  Created by 002 on 16/6/27.
//  Copyright © 2016年 002. All rights reserved.
//

#import "SubHomeViewController.h"
#import "UIViewController+CustomNavigationBar.h"
#import "LastHomeViewController.h"
#import "FHHFPSIndicator.h"

@interface SubHomeViewController ()

@property(nonatomic,strong) UIImageView *imageView;

@end

@implementation SubHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setNavigationBarItem:@"SubHome" leftButtonIcon:@"backupIcon" rightButtonTitle:@"next"];
    [self.rightButton addTarget:self action:@selector(rightButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.imageView];
    [FHHFPSIndicator sharedFPSIndicator].fpsLabelPosition = FPSIndicatorPositionTopLeft;
}

- (void)rightButtonDidClick:(UIButton *)btn {
    [self.navigationController pushViewController:[[LastHomeViewController alloc] init] animated:YES];
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"subHomePicture"]];
        _imageView.frame = CGRectMake(0, 64, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height - 64);
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        }
    return _imageView;
}

@end
