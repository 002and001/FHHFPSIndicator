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
    
    self.view.backgroundColor = RGBColor(201, 201, 201);
        
    [self setNavigationBarTitle:@"Home" navLeftButtonIcon:nil navRightButtonTitle:@"next"];
    [self.navRightButton addTarget:self action:@selector(p_rightButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)p_rightButtonDidClick:(UIButton *)btn {
    [self.navigationController pushViewController:[[SubHomeViewController alloc] init] animated:YES];
}

@end
