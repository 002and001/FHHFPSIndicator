//
//  UIView+FHH.m
//  
//
//  Created by 002 on 15/10/1.
//  Copyright (c) 2015年 002. All rights reserved.
//

#import "UIView+FHH.h"

@implementation UIView (FHH)

#pragma mark - Setter
- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (void)setRight:(CGFloat)right {
    self.frame = CGRectMake(right - self.width, self.y, self.width, self.height);
}

- (void)setBottom:(CGFloat)bottom {
    self.frame = CGRectMake(self.x, bottom - self.height, self.width, self.height);
}

- (void)setCenterX:(CGFloat)centerX{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (void)setCenterY:(CGFloat)centerY {
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (void)setSize:(CGSize)size {
    CGRect tempFrame = self.frame;
    tempFrame.size = size;
    self.frame = tempFrame;
}

#pragma mark - Getter
- (CGFloat)x {
    return self.frame.origin.x;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (CGSize)size {
    return self.frame.size;
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (CGFloat)centerY {
    return self.center.y;
}

- (CGFloat)bottom {
    return self.y + self.height;
}

- (CGFloat)right {
    return self.x + self.width;
}

#pragma mark - Functions
- (CGRect)convertRectToView:(UIView *)view {
    CGRect newFrame = [self convertRect:self.bounds toView:view];
    return newFrame;
}

- (CGFloat)xInView:(UIView *)view {
    CGRect newFrame = [self convertRect:self.bounds toView:view];
    return newFrame.origin.x;
}

- (CGFloat)yInView:(UIView *)view {
    CGRect newFrame = [self convertRect:self.bounds toView:view];
    return newFrame.origin.y;
}

- (CGFloat)rightInView:(UIView *)view {
    CGRect newFrame = [self convertRect:self.bounds toView:view];
    return newFrame.origin.x + newFrame.size.width;
}

- (CGFloat)bottomInView:(UIView *)view {
    CGRect newFrame = [self convertRect:self.bounds toView:view];
    return newFrame.origin.y + newFrame.size.height;
}

- (CGFloat)centerXInView:(UIView *)view {
    CGRect newFrame = [self convertRect:self.bounds toView:view];
    return newFrame.origin.x + newFrame.size.width * 0.5;
}

- (CGFloat)centerYInView:(UIView *)view {
    CGRect newFrame = [self convertRect:self.bounds toView:view];
    return newFrame.origin.y + newFrame.size.height * 0.5;
}

@end
