//
//  FHHFPSIndicator.h
//  flashServesCustomer
//
//  Created by 002 on 16/6/27.
//  Copyright © 2016年 002. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FHHFPSIndicator : NSObject


// fpsLabel's position,default is PositionBottomCenter
// if your device is iPhone5 or 5s,suggest to use FPSIndicatorPositionBottomCenter to make sure the fpsLabel showed completed
typedef enum {
    FPSIndicatorPositionTopLeft,
    FPSIndicatorPositionTopRight,
    FPSIndicatorPositionBottomCenter    // defaulut value
} FPSIndicatorPosition;

+ (FHHFPSIndicator *)sharedFPSIndicator;
- (void)show;
- (void)hide;

@property(nonatomic,assign) FPSIndicatorPosition fpsLabelPosition;

@end
