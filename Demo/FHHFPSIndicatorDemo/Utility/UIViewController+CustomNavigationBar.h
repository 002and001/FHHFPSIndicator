//
//  UIViewController+CustomNavigationBar.h
//  LoveTourGuide
//
//  Created by 002 on 16/1/5.
//  Copyright © 2016年 fhhe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (CustomNavigationBar)

@property(nonatomic,strong) UIView *navigationBar;  // 自定义navigationBar
@property(nonatomic,strong) UIButton *middleButton; // 中间按钮
@property(nonatomic,strong) UIButton *leftButton;   // 左边按钮
@property(nonatomic,strong) UIButton *rightButton;  // 右边按钮

/**
 
 只有 ‘标题’
 
 @param title 导航栏标题
 */
- (void)setNavigationBarItem:(NSString *)title;

/**
 
 有 ‘标题’ 和 ‘左边按钮’
 
 @param title           导航栏标题
 @param leftButtonIcon  左边按钮的 ‘图片’ 名称
 */
- (void)setNavigationBarItem:(NSString *)title leftButtonIcon:(NSString *)leftButtonIcon;

/**
 
 有 ‘标题’ 和 ‘左边按钮’ 和 ‘右边按钮’（显示为文字）
 
 @param title                导航栏标题
 @param leftButtonIcon       左边按钮的 ‘图片’ 名称
 @param rightButtonTitle     右边按钮的 ‘title’ 名称
 */
- (void)setNavigationBarItem:(NSString *)title leftButtonIcon:(NSString *)leftButtonIcon  rightButtonTitle:(NSString *)rightButtonTitle;

/**
 
 有 ‘标题’ 和 ‘左边按钮’ 和 ‘右边按钮’（显示图片）
 
 @param title                导航栏标题
 @param leftButtonIcon       左边按钮的 ‘图片’ 名称
 @param rightButtonIcon      右边按钮的 ‘title’ 名称
 */
- (void)setNavigationBarItem:(NSString *)title leftButtonIcon:(NSString *)leftButtonIcon rightButtonIcon:(NSString *)rightButtonIcon;

/**
 有 ‘标题’ 和 ‘左边按钮’ 和 ‘右边按钮’（包含图片和文字）
 
 @param title                导航栏标题
 @param leftButtonIcon       左边按钮的 ‘图片’ 名称
 @param rightButtonIcon      右边按钮的 ‘title’ 名称
 @param rightButtonTitle     右边按钮的 ‘图片’ 名称
 */
- (void)setNavigationBarItem:(NSString *)title leftButtonIcon:(NSString *)leftButtonIcon rightButtonIcon:(NSString *)rightButtonIcon rightButtonTitle:(NSString *)rightButtonTitle;

/**
 pop当前控制器
 */
- (void)clickLeftNavButton;

@end
