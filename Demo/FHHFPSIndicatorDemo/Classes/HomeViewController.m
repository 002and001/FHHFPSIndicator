//
//  HomeViewController.m
//  FHHFPSIndicator-master
//
//  Created by 002 on 16/6/27.
//  Copyright © 2016年 002. All rights reserved.
//

#import "HomeViewController.h"
#import "UIViewController+CustomNavigationBar.h"
#import "SubHomeViewController.h"

@interface HomeViewController ()

@property(nonatomic,strong) UIImageView *imageView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
        
    [self setNavigationBarItem:@"Home" leftButtonIcon:nil rightButtonTitle:@"next"];
    [self.rightButton addTarget:self action:@selector(rightButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.imageView];
}

- (void)rightButtonDidClick:(UIButton *)btn {
    [self.navigationController pushViewController:[[SubHomeViewController alloc] init] animated:YES];
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"homePicture"]];
        _imageView.frame = CGRectMake(0, 64, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height - 64);
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _imageView;
}

@end
