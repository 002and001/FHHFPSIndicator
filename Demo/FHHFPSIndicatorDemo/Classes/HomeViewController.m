//
//  HomeViewController.m
//  FHHFPSIndicator
//
//  Created by 002 on 16/6/27.
//  Copyright © 2016年 002. All rights reserved.
//

#import "HomeViewController.h"
#import "UIViewController+CustomNavigationBar.h"
#import "SubHomeViewController.h"

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:201 / 255.0 green:201 / 255.0 blue:201 / 255.0 alpha:1.0];
        
    [self setNavigationBarItem:@"Home" leftButtonIcon:nil rightButtonTitle:@"next"];
    [self.rightButton addTarget:self action:@selector(rightButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)rightButtonDidClick:(UIButton *)btn {
    [self.navigationController pushViewController:[[SubHomeViewController alloc] init] animated:YES];
}

@end
