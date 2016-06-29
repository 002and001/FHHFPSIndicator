//
//  LastHomeViewController.m
//  FHHFPSIndicator
//
//  Created by 002 on 16/6/27.
//  Copyright © 2016年 002. All rights reserved.
//

#import "LastHomeViewController.h"
#import "UIViewController+CustomNavigationBar.h"
#import "WildernessViewController.h"
#import "FHHFPSIndicator.h"

@implementation LastHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:255 / 255.0 green:139 / 255.0 blue:57 / 255.0 alpha:1.0];    
    
    [self setNavigationBarItem:@"LastHome" leftButtonIcon:@"backupIcon" rightButtonTitle:@"next"];    
    [self.rightButton addTarget:self action:@selector(rightButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [FHHFPSIndicator sharedFPSIndicator].fpsLabelPosition = FPSIndicatorPositionTopRight;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:YES];
    [FHHFPSIndicator sharedFPSIndicator].fpsLabelPosition = FPSIndicatorPositionBottomCenter;
}

- (void)rightButtonDidClick:(UIButton *)btn {
    [self.navigationController pushViewController:[[WildernessViewController alloc] init] animated:YES];
}

@end
