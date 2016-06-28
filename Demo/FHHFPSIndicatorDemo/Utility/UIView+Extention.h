//
//  UIView+Ex.h
//  
//
//  Created by 002 on 15/10/1.
//  Copyright (c) 2015年 002. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extention)

@property(nonatomic,assign) CGFloat x;
@property(nonatomic,assign) CGFloat y;
@property(nonatomic,assign) CGFloat width;
@property(nonatomic,assign) CGFloat height;
@property(nonatomic,assign) CGPoint origin;
@property(nonatomic,assign) CGSize size;
@property(nonatomic,assign) CGFloat centerX;
@property(nonatomic,assign) CGFloat centerY;

- (CGFloat)tail;
- (void)setTail:(CGFloat)tail;

- (CGFloat)bottom;
- (void)setBottom:(CGFloat)bottom;

- (CGFloat)right;
- (void)setRight:(CGFloat)right;

// 分隔视图线
+ (instancetype)sepView;

@end
