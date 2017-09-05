//
//  ************************************************************************
//
//  UIViewController+CustomNavigationBar.m
//  LoveTourGuide
//
//  Created by 002 on 2017/7/26.
//  Copyright © 2017年 hqyxedu. All rights reserved.
//
//  Main function:自定义导航栏控制器分类
//
//  Other specifications:
//
//  ************************************************************************

#import "UIViewController+CustomNavigationBar.h"
#import "UIView+FHH.h"
#import <objc/runtime.h>

#define RGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define KColorBlue RGBColor(0, 160, 233)
#define ScreenWidth ([[UIScreen mainScreen] bounds].size.width)

const char *NavigationBarKey = "navigationBar";
const char *NavMiddleButtonKey = "navMiddleButton";
const char *NavLeftButtonKey = "navLeftButton";
const char *NavRightButtonKey = "navRightButton";
const char *IsPushedKey = "IsPushed";

@implementation UIViewController (CustomNavigationBar)

#pragma mark - 导航栏
- (void)setNavigationBarTitle:(NSString *)title {
    [self setNavigationBarTitle:title
              navLeftButtonIcon:nil
             navRightButtonIcon:nil
            navRightButtonTitle:nil];
    self.navLeftButton.hidden = YES;
}

- (void)setNavigationBarTitle:(NSString *)title navLeftButtonIcon:(NSString *)navLeftButtonIcon {
    [self setNavigationBarTitle:title
              navLeftButtonIcon:navLeftButtonIcon
             navRightButtonIcon:nil
            navRightButtonTitle:nil];
}

- (void)setNavigationBarTitle:(NSString *)title
            navLeftButtonIcon:(NSString *)navLeftButtonIcon
          navRightButtonTitle:(NSString *)navRightButtonTitle {
    
    [self setNavigationBarTitle:title
              navLeftButtonIcon:navLeftButtonIcon
             navRightButtonIcon:nil
            navRightButtonTitle:navRightButtonTitle];
}

- (void)setNavigationBarTitle:(NSString *)title
            navLeftButtonIcon:(NSString *)navLeftButtonIcon
           navRightButtonIcon:(NSString *)navRightButtonIcon {
    
    [self setNavigationBarTitle:title
              navLeftButtonIcon:navLeftButtonIcon
             navRightButtonIcon:navRightButtonIcon
            navRightButtonTitle:nil];
}

- (void)setNavigationBarTitle:(NSString *)title
            navLeftButtonIcon:(NSString *)navLeftButtonIcon
           navRightButtonIcon:(NSString *)navRightButtonIcon
          navRightButtonTitle:(NSString *)navRightButtonTitle {
    [self pc_configCustomNavigationBar];
    [self pc_configCustomNavLeftButtonWithNavLeftButtonIcon:navLeftButtonIcon];
    [self pc_configCustomNavRightButtonWithNavRightButtonIcon:navRightButtonIcon
                                          navRightButtonTitle:navRightButtonTitle];
    [self pc_configCustomNavMiddleButtonWithTitle:title];
    [self pc_configBottomSepImageView];
}

- (void)pc_configCustomNavigationBar {
    if (self.navigationController.navigationBar != nil) {
        [self.navigationController.navigationBar removeFromSuperview];
    }
    if (self.navigationBar != nil) {
        [self.navigationBar removeFromSuperview];
    }
    self.isPushed = YES;
    // 1.自定义UIView代替导航栏
    // 1.1) 创建并定义属性
    self.navigationBar = [[UIView alloc] init];
    self.navigationBar.frame = CGRectMake(0, 0, ScreenWidth, 64.0);
    self.navigationBar.backgroundColor = RGBColor(0, 160, 233);
    [self.view addSubview:self.navigationBar];
}

- (void)pc_configCustomNavLeftButtonWithNavLeftButtonIcon:(NSString *)NavLeftButtonIcon {
    // 2.‘左边’ 按钮
    self.navLeftButton = [[UIButton alloc] init];
    self.navLeftButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    if (!NavLeftButtonIcon || [@"" isEqualToString:NavLeftButtonIcon]) {
        NavLeftButtonIcon = @"nav_return";
        self.navLeftButton.hidden = YES;
    }
    [self.navLeftButton addTarget:self action:@selector(clickLeftNavButton) forControlEvents:UIControlEventTouchUpInside];
    [self.navLeftButton setImage:[UIImage imageNamed:NavLeftButtonIcon] forState:UIControlStateNormal];
    [self configLeftButton];
    [self p_configLeftButtonEdgeInsets];
}

- (void)pc_configCustomNavRightButtonWithNavRightButtonIcon:(NSString *)NavRightButtonIcon
                                        navRightButtonTitle:(NSString *)navRightButtonTitle {
    if (NavRightButtonIcon || navRightButtonTitle) {
        self.navRightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.navRightButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        if (navRightButtonTitle && ![@"" isEqualToString:navRightButtonTitle]) {
            [self.navRightButton setTitle:navRightButtonTitle forState:UIControlStateNormal];
        }
        if (NavRightButtonIcon && ![@"" isEqualToString:NavRightButtonIcon]) {
            [self.navRightButton setImage:[UIImage imageNamed:NavRightButtonIcon] forState:UIControlStateNormal];
        }
        self.navRightButton.titleLabel.font = [UIFont systemFontOfSize:T5_30PX];
        [self.navRightButton setTitleColor:kColorC4_1 forState:UIControlStateNormal];
        [self.navigationBar addSubview:self.navRightButton];
        [self reConfigNavRightButton];
        [self p_configRightButtonEdgeInsets];
    }
}

- (void)pc_configCustomNavMiddleButtonWithTitle:(NSString *)title {
    if (title && ![@"" isEqualToString:title]) {
        [self addBarMiddleButtonWithTitle:title];
    }
}

- (void)addBarMiddleButtonWithTitle:(NSString *)title {
    self.navMiddleButton = [[UIButton alloc] init];
    self.navMiddleButton.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.navMiddleButton setTitle:title forState:UIControlStateNormal];
    [self.navMiddleButton setTitleColor:kColorC4_1 forState:UIControlStateNormal];
    self.navMiddleButton.titleLabel.font = [UIFont systemFontOfSize:T3_34PX];
    [self reConfigNavMiddleButton];
    
    // 添加到当前view
    [self.navigationBar addSubview:self.navMiddleButton];
}

- (void)pc_configBottomSepImageView {
    CGRect frame = CGRectMake(0, self.navigationBar.height - 0.5, self.navigationBar.width, 0.5);
    UIImageView *bottomSepImageView = [[UIImageView alloc] initWithFrame:frame];
    [self.navigationBar addSubview:bottomSepImageView];
    bottomSepImageView.backgroundColor = kColorC3_1;
}

- (void)configLeftButton {
    [self.navLeftButton sizeToFit];
    self.navLeftButton.frame = CGRectMake(0, 28 , 50, 64);
    self.navLeftButton.bottom = self.navigationBar.height;
    [self.navigationBar addSubview:self.navLeftButton];
}

- (void)p_configLeftButtonEdgeInsets {
    self.navLeftButton.imageEdgeInsets = UIEdgeInsetsMake((50 - 30), S3_PAGE_PADDING_30PX, 0, 0);
}

- (void)p_configRightButtonEdgeInsets {
    CGSize imageSize = self.navRightButton.imageView.size;
    CGSize titleSize = self.navRightButton.titleLabel.size;
    CGFloat imageLeftInset = (self.navRightButton.width - imageSize.width - MARGIN_COMMON);
    CGFloat titleLeftInset = (self.navRightButton.width - titleSize.width - MARGIN_COMMON + 2);
    
    self.navRightButton.imageEdgeInsets = UIEdgeInsetsMake(0, imageLeftInset, 0, -imageLeftInset);
    self.navRightButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, titleLeftInset);
}

- (void)clickLeftNavButton {
    if (self.isPushed) {
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        if (self.navigationController != nil) {
            [self.navigationController dismissViewControllerAnimated:YES completion:nil];
        } else {
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }
}

- (void)removeNavLeftButtonDefaultEvent {
    [self.navLeftButton removeTarget:self
                              action:@selector(clickLeftNavButton)
                    forControlEvents:UIControlEventTouchUpInside];
}

- (void)reConfigNavMiddleButton {
    [self.navMiddleButton sizeToFit];
    CGFloat maxWidth = self.navigationBar.width - 2 * PADDING_30PX;
    if (self.navLeftButton != nil && self.navRightButton != nil) {
        maxWidth = self.navRightButton.x - self.navLeftButton.right;
    } else if (self.navLeftButton != nil) {
        maxWidth = self.navigationBar.width - 2 * self.navLeftButton.right;
    }
    if (self.navMiddleButton.width > maxWidth) {
        self.navMiddleButton.width = maxWidth;
    }
    self.navMiddleButton.center = CGPointMake(self.navigationBar.centerX ,
                                              self.navLeftButton.centerY + 20 * 0.5);
}

- (void)reConfigNavRightButton {
    if (self.navRightButton.currentBackgroundImage == nil) {
        [self.navRightButton sizeToFit];
        self.navRightButton.width = self.navRightButton.width + MARGIN_COMMON;
        self.navRightButton.height = 44;
        if (self.navRightButton.width < 40) {
            self.navRightButton.width = 40;
        }
        
        self.navRightButton.centerY = self.navLeftButton.centerY + (20 * 0.5);
        self.navRightButton.right = self.navigationBar.right;
    }
    else {
        self.navRightButton.centerY = self.navLeftButton.centerY + (20 * 0.5);
        self.navRightButton.right = self.navigationBar.right - MARGIN_COMMON;
    }
}

#pragma mark - 运行时添加实例变量
- (void)setNavigationBar:(UIView *)navigationBar {
    objc_setAssociatedObject(self,
                             NavigationBarKey,
                             navigationBar,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)navigationBar {
    return objc_getAssociatedObject(self, NavigationBarKey);
}

- (void)setNavMiddleButton:(UIButton *)navMiddleButton {
    objc_setAssociatedObject(self,
                             NavMiddleButtonKey,
                             navMiddleButton,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIButton *)navMiddleButton {
    return objc_getAssociatedObject(self, NavMiddleButtonKey);
}

- (void)setNavLeftButton:(UIButton *)navLeftButton {
    objc_setAssociatedObject(self,
                             NavLeftButtonKey,
                             navLeftButton,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIButton *)navLeftButton {
    return objc_getAssociatedObject(self, NavLeftButtonKey);
}

- (void)setNavRightButton:(UIButton *)navRightButton {
    objc_setAssociatedObject(self,
                             NavRightButtonKey,
                             navRightButton,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIButton *)navRightButton {
    return objc_getAssociatedObject(self, NavRightButtonKey);
}

- (void)setIsPushed:(BOOL)isPushed {
    NSNumber *isPushedNumber = [NSNumber numberWithBool:isPushed];
    objc_setAssociatedObject(self,
                             IsPushedKey,
                             isPushedNumber,
                             OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)isPushed {
    NSNumber *isPushedInNumber = objc_getAssociatedObject(self, IsPushedKey);
    bool isPushed = [isPushedInNumber boolValue];
    return isPushed;
}

@end
