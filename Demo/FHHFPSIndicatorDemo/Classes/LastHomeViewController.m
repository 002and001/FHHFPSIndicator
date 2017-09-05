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
    
    self.view.backgroundColor = kColorC4_1;
    
    [self setNavigationBarTitle:@"LastHome" navLeftButtonIcon:@"backupIcon" navRightButtonTitle:@"next"];
    [self.navRightButton addTarget:self action:@selector(p_rightButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [FHHFPSIndicator sharedFPSIndicator].fpsLabelPosition = FPSIndicatorPositionTopRight;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:YES];
    [FHHFPSIndicator sharedFPSIndicator].fpsLabelPosition = FPSIndicatorPositionBottomCenter;
}

- (void)p_rightButtonDidClick:(UIButton *)btn {
    [self.navigationController pushViewController:[[WildernessViewController alloc] init] animated:YES];
}

@end
