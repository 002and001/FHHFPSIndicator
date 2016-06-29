//
//  UIViewController+CustomNavigationBar.m
//  LoveTourGuide
//
//  Created by 002 on 16/1/5.
//  Copyright © 2016年 fhhe. All rights reserved.
//

#import "UIViewController+CustomNavigationBar.h"
#import "UIView+FHH.h"
#import <objc/runtime.h>

#define FONT_SIZE_30D   15
#define FONT_SIZE_28D   14
#define WIDTH_LEFTBUTTON 44 // 左边按钮的宽高
#define HEIGHT_STATUSBAR 20 // 状态栏高度
#define HEIGHT_NAVIGATIONBAR 64 // 自定义导航栏高度
#define CENTERY_VIEW (HEIGHT_STATUSBAR + (HEIGHT_NAVIGATIONBAR - HEIGHT_STATUSBAR) / 2) // 产品要求按钮布局的垂直中心点
#define PADDING_RIGHT_RIGHTBUTTON 12 // 右边按钮距离屏幕距离
#define RGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define KColorBlue RGBColor(0, 160, 233)
#define ScreenWidth ([[UIScreen mainScreen] bounds].size.width)

const char *NavigationBarType = "navigationBar";
const char *MiddleButtonType = "middleButton";
const char *LeftButtonType = "leftButton";
const char *RightButtonType = "rightButton";

@implementation UIViewController (CustomNavigationBar)

#pragma mark - 导航栏
- (void)setNavigationBarItem:(NSString *)title {
    
    [self setNavigationBarItem:title leftButtonIcon:nil rightButtonIcon:nil rightButtonTitle:nil];
}

- (void)setNavigationBarItem:(NSString *)title leftButtonIcon:(NSString *)leftButtonIcon {
    
    [self setNavigationBarItem:title leftButtonIcon:leftButtonIcon rightButtonIcon:nil rightButtonTitle:nil];
}

- (void)setNavigationBarItem:(NSString *)title leftButtonIcon:(NSString *)leftButtonIcon  rightButtonTitle:(NSString *)rightButtonTitle {
    
    [self setNavigationBarItem:title leftButtonIcon:leftButtonIcon rightButtonIcon:nil rightButtonTitle:rightButtonTitle];
}

- (void)setNavigationBarItem:(NSString *)title leftButtonIcon:(NSString *)leftButtonIcon rightButtonIcon:(NSString *)rightButtonIcon {
    
    [self setNavigationBarItem:title leftButtonIcon:leftButtonIcon rightButtonIcon:rightButtonIcon rightButtonTitle:nil];
}

- (void)setNavigationBarItem:(NSString *)title leftButtonIcon:(NSString *)leftButtonIcon rightButtonIcon:(NSString *)rightButtonIcon rightButtonTitle:(NSString *)rightButtonTitle {
    
    if (self.navigationController.navigationBar != nil) {
        [self.navigationController.navigationBar removeFromSuperview];
    }
    
    if (self.navigationBar != nil) {
        [self.navigationBar removeFromSuperview];
    }
    // 1.自定义UIView代替导航栏
    // 1.1) 创建并定义属性
    self.navigationBar = [[UIView alloc] init];
    self.navigationBar.frame = CGRectMake(0, 0, ScreenWidth, HEIGHT_NAVIGATIONBAR);
    self.navigationBar.backgroundColor = KColorBlue;
    // 1.2) 添加到当前view
    [self.view addSubview:self.navigationBar];
    
    // 2.‘左边’ 按钮
    if (leftButtonIcon && ![@"" isEqualToString:leftButtonIcon]) {
        self.leftButton = [[UIButton alloc] init];

        [self.leftButton addTarget:self action:@selector(clickLeftNavButton) forControlEvents:UIControlEventTouchUpInside];
        [self.leftButton setImage:[UIImage imageNamed:leftButtonIcon] forState:UIControlStateNormal];
        [self.leftButton sizeToFit];

        // 先设置宽高然后设置位置
        self.leftButton.width = WIDTH_LEFTBUTTON;
        self.leftButton.height = WIDTH_LEFTBUTTON;
        self.leftButton.x = self.view.x;
        self.leftButton.centerY = CENTERY_VIEW;
        
        [self.navigationBar addSubview:self.leftButton];
    }
    
    // 3.‘右边’ 按钮
    if (rightButtonIcon || rightButtonTitle) {
        self.rightButton = [[UIButton alloc] init];
        
        if (rightButtonTitle && ![@"" isEqualToString:rightButtonTitle]) {
            [self.rightButton setTitle:rightButtonTitle forState:UIControlStateNormal];
        }
        if (rightButtonIcon && ![@"" isEqualToString:rightButtonIcon]) {
            [self.rightButton setImage:[UIImage imageNamed:rightButtonIcon] forState:UIControlStateNormal];
        }
        self.rightButton.titleLabel.font = [UIFont systemFontOfSize:FONT_SIZE_30D];
//        self.rightButton.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
        [self.rightButton sizeToFit];
        [self.navigationBar addSubview:self.rightButton];

        self.rightButton.height = 44;
        if (self.rightButton.width < 40) {
            self.rightButton.width = 40;
        }
        self.rightButton.centerY = CENTERY_VIEW;
        self.rightButton.right = self.navigationBar.right - 12;

    }
    
    // 4.‘标题’ 按钮
    if (title && ![@"" isEqualToString:title]) {
        self.middleButton = [[UIButton alloc] init];
        [self.middleButton setTitle:title forState:UIControlStateNormal];
        self.middleButton.titleLabel.font = [UIFont systemFontOfSize:19];
        [self.middleButton sizeToFit];
        self.middleButton.center = CGPointMake(self.navigationBar.centerX , CENTERY_VIEW);
        
        // 添加到当前view
        [self.navigationBar addSubview:self.middleButton];
    }
    
    // 隐藏导航栏
//    self.navigationController.navigationBar.hidden = YES;
}

- (void)clickLeftNavButton {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 运行时添加实例变量
- (void)setNavigationBar:(UIView *)navigationBar {
    objc_setAssociatedObject(self,
                             NavigationBarType,
                             navigationBar,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)navigationBar {
    return objc_getAssociatedObject(self, NavigationBarType);
}

- (void)setMiddleButton:(UIButton *)middleButton {
    objc_setAssociatedObject(self,
                             MiddleButtonType,
                             middleButton,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIButton *)middleButton {
    return objc_getAssociatedObject(self, MiddleButtonType);
}

- (void)setLeftButton:(UIButton *)leftButton {
    objc_setAssociatedObject(self,
                             LeftButtonType,
                             leftButton,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIButton *)leftButton {
    return objc_getAssociatedObject(self, LeftButtonType);
}

- (void)setRightButton:(UIButton *)rightButton {
    objc_setAssociatedObject(self,
                             RightButtonType,
                             rightButton,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIButton *)rightButton {
    return objc_getAssociatedObject(self, RightButtonType);
}

@end
