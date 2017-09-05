//
//  UIViewController+CustomNavigationBar.h
//  LoveTourGuide
//
//  Created by 002 on 16/1/5.
//  Copyright © 2016年 fhhe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (CustomNavigationBar)

@property (nonatomic, strong) UIView *navigationBar;  // 自定义navigationBar
@property (nonatomic, strong) UIButton *navMiddleButton; // 中间按钮
@property (nonatomic, strong) UIButton *navLeftButton;   // 左边按钮
@property (nonatomic, strong) UIButton *navRightButton;  // 右边按钮
@property (nonatomic, assign) BOOL isPushed;  // 是否push进来

/**
 
 只有 ‘标题’
 
 @param title 导航栏标题
 */
- (void)setNavigationBarTitle:(NSString *)title;

/**
 
 有 ‘标题’ 和 ‘左边按钮’
 
 @param title               导航栏标题
 @param navLeftButtonIcon   左边按钮的 ‘图片’ 名称
 */
- (void)setNavigationBarTitle:(NSString *)title navLeftButtonIcon:(NSString *)navLeftButtonIcon;

/**
 
 有 ‘标题’ 和 ‘左边按钮’ 和 ‘右边按钮’（显示为文字）
 
 @param title                   导航栏标题
 @param navLeftButtonIcon       左边按钮的 ‘图片’ 名称
 @param navRightButtonTitle     右边按钮的 ‘title’ 名称
 */
- (void)setNavigationBarTitle:(NSString *)title
            navLeftButtonIcon:(NSString *)navLeftButtonIcon
          navRightButtonTitle:(NSString *)navRightButtonTitle;

/**
 
 有 ‘标题’ 和 ‘左边按钮’ 和 ‘右边按钮’（显示图片）
 
 @param title                导航栏标题
 @param navLeftButtonIcon       左边按钮的 ‘图片’ 名称
 @param navRightButtonIcon      右边按钮的 ‘title’ 名称
 */
- (void)setNavigationBarTitle:(NSString *)title
            navLeftButtonIcon:(NSString *)navLeftButtonIcon
           navRightButtonIcon:(NSString *)navRightButtonIcon;

/**
 有 ‘标题’ 和 ‘左边按钮’ 和 ‘右边按钮’（包含图片和文字）
 
 @param title                   导航栏标题
 @param navLeftButtonIcon       左边按钮的 ‘图片’ 名称
 @param navRightButtonIcon      右边按钮的 ‘title’ 名称
 @param navRightButtonTitle     右边按钮的 ‘图片’ 名称
 */
- (void)setNavigationBarTitle:(NSString *)title
            navLeftButtonIcon:(NSString *)navLeftButtonIcon
           navRightButtonIcon:(NSString *)navRightButtonIcon
          navRightButtonTitle:(NSString *)navRightButtonTitle;


/**
 删除左边按钮默认返回事件
 */
- (void)removeNavLeftButtonDefaultEvent;

/**
 中间按钮重新布局
 */
- (void)reConfigNavMiddleButton;

/**
 右边按钮重新布局
 */
- (void)reConfigNavRightButton;

@end
