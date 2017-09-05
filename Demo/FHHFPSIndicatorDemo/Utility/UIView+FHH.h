//
//  UIView+FHH.h
//  
//
//  Created by 002 on 15/10/1.
//  Copyright (c) 2015年 002. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FHH)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat right;
@property (nonatomic, assign) CGFloat bottom;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize size;

- (CGRect)convertRectToView:(UIView *)view;
- (CGFloat)xInView:(UIView *)view;
- (CGFloat)yInView:(UIView *)view;
- (CGFloat)rightInView:(UIView *)view;
- (CGFloat)bottomInView:(UIView *)view;
- (CGFloat)centerXInView:(UIView *)view;
- (CGFloat)centerYInView:(UIView *)view;

@end
