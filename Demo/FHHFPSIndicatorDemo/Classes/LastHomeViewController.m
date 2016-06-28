//
//  LastHomeViewController.m
//  FHHFPSIndicator-master
//
//  Created by 002 on 16/6/27.
//  Copyright © 2016年 002. All rights reserved.
//

#import "LastHomeViewController.h"
#import "UIViewController+CustomNavigationBar.h"
#import "WildernessViewController.h"
#import "FHHFPSIndicator.h"

@interface LastHomeViewController ()

@property(nonatomic,strong) UIImageView *imageView;

@end

@implementation LastHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setNavigationBarItem:@"LastHome" leftButtonIcon:@"backupIcon" rightButtonTitle:@"next"];    
    [self.rightButton addTarget:self action:@selector(rightButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.imageView];
    [FHHFPSIndicator sharedFPSIndicator].fpsLabelPosition = FPSIndicatorPositionTopRight;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:YES];
    [FHHFPSIndicator sharedFPSIndicator].fpsLabelPosition = FPSIndicatorPositionBottomCenter;
}

- (void)rightButtonDidClick:(UIButton *)btn {
    [self.navigationController pushViewController:[[WildernessViewController alloc] init] animated:YES];
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lastHomePicture"]];
        _imageView.frame = CGRectMake(0, 64, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height - 64);
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _imageView;
}

@end
