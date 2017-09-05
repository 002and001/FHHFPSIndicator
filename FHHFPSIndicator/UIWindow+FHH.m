//
//  UIWindow+FHH.m
//  flashServesCustomer
//
//  Created by 002 on 16/6/27.
//  Copyright © 2016年 002. All rights reserved.
//

#import "UIWindow+FHH.h"

static NSInteger kFpsLabelTag = 110213;

@implementation UIWindow (FHH)

- (void)layoutSubviews {
    [super layoutSubviews];
    
    for (NSUInteger i = 0; i < self.subviews.count; ++i) {
        UIView *view = self.subviews[self.subviews.count - 1 - i];
        if ([view isKindOfClass:[UILabel class]] && view.tag == kFpsLabelTag) {
            if (view == self.subviews.lastObject) {
                return;
            }
            [self bringSubviewToFront:view];
            return;
        }
    }
}

@end
