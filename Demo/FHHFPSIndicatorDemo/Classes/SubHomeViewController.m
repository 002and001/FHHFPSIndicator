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
    
    self.view.backgroundColor = RGBColor(160, 160, 160);
    
    [self setNavigationBarTitle:@"SubHome" navLeftButtonIcon:@"backupIcon" navRightButtonTitle:@"next"];
    [self.navRightButton addTarget:self action:@selector(p_rightButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [FHHFPSIndicator sharedFPSIndicator].fpsLabelPosition = FPSIndicatorPositionTopLeft;
}

- (void)p_rightButtonDidClick:(UIButton *)btn {
    [self.navigationController pushViewController:[[LastHomeViewController alloc] init] animated:YES];
}

@end
