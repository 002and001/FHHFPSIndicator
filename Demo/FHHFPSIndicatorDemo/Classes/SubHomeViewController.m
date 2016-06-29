//
//  SubHomeViewController.m
//  FHHFPSIndicator
//
//  Created by 002 on 16/6/27.
//  Copyright © 2016年 002. All rights reserved.
//

#import "SubHomeViewController.h"
#import "UIViewController+CustomNavigationBar.h"
#import "LastHomeViewController.h"
#import "FHHFPSIndicator.h"

@implementation SubHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:160 / 255.0 green:160 / 255.0 blue:160 / 255.0 alpha:1.0];
    
    [self setNavigationBarItem:@"SubHome" leftButtonIcon:@"backupIcon" rightButtonTitle:@"next"];
    [self.rightButton addTarget:self action:@selector(rightButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [FHHFPSIndicator sharedFPSIndicator].fpsLabelPosition = FPSIndicatorPositionTopLeft;
}

- (void)rightButtonDidClick:(UIButton *)btn {
    [self.navigationController pushViewController:[[LastHomeViewController alloc] init] animated:YES];
}

@end
