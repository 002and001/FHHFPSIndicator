//
//  FHHFPSIndicator.m
//  flashServesCustomer
//
//  Created by 002 on 16/6/27.
//  Copyright © 2016年 002. All rights reserved.
//

#import "FHHFPSIndicator.h"
#import <UIKit/UIKit.h>

#define SIZE_fpsLabel CGSizeMake(45, 20)
#define FONT_SIZE_fpsLabel 12
#define TAG_fpsLabel 110213
#define TEXTCOLOR_fpsLabel [UIColor colorWithRed:85 / 255.0 green:214 / 255.0 blue:110 / 255.0 alpha:1.00]
#define PADDING_LEFT_fpsLabel 15
#define PADDING_RIGHT_fpsLabel 15
#define ScreenWidth ([[UIScreen mainScreen] bounds].size.width)

@interface FHHFPSIndicator ()

{
    CADisplayLink *_displayLink;
    NSTimeInterval _lastTime;
    NSUInteger _count;
}

@property (nonatomic,strong)UILabel *fpsLabel;

@end

@implementation FHHFPSIndicator

+ (FHHFPSIndicator *)sharedFPSIndicator {
    static dispatch_once_t onceToken;
    static FHHFPSIndicator *_instance;
    dispatch_once(&onceToken, ^{
        _instance = [[FHHFPSIndicator alloc] init];
    });
    return _instance;
}

- (id)init {
    if (self = [super init]) {
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayLinkTick:)];
        [_displayLink setPaused:YES];
        [_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
        
        // create fpsLabel
        _fpsLabel = [[UILabel alloc] initWithFrame:CGRectMake((ScreenWidth - SIZE_fpsLabel.width) / 2, 12, SIZE_fpsLabel.width, SIZE_fpsLabel.height)];
        _fpsLabel.tag = TAG_fpsLabel;
        
        // set style for fpsLabel
        [self configFPSLabel];
        
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(applicationDidBecomeActiveNotification)
                                                     name: UIApplicationDidBecomeActiveNotification
                                                   object: nil];
        
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(applicationWillResignActiveNotification)
                                                     name: UIApplicationWillResignActiveNotification
                                                   object: nil];

        
    }
    return self;
}

- (void)configFPSLabel {
    _fpsLabel.font = [UIFont boldSystemFontOfSize:FONT_SIZE_fpsLabel];
    _fpsLabel.backgroundColor = [UIColor clearColor];
    _fpsLabel.textColor = TEXTCOLOR_fpsLabel;
    _fpsLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)displayLinkTick:(CADisplayLink *)link {
    if (_lastTime == 0) {
        _lastTime = link.timestamp;
        return;
    }
    
    _count++;
    NSTimeInterval delta = link.timestamp - _lastTime;
    if (delta < 1) {
        return;
    }
    _lastTime = link.timestamp;
    float fps = _count / delta;
    _count = 0;
    NSString *text = [NSString stringWithFormat:@"%d fps",(int)round(fps)];
    [_fpsLabel setText: text];
}

- (void)show {
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    for (UIView *label in keyWindow.subviews) {
        if ([label isKindOfClass:[UILabel class]]&& label.tag == TAG_fpsLabel) {
            return;
        }
    }
    [_displayLink setPaused:NO];
    [keyWindow addSubview:_fpsLabel];
    [keyWindow bringSubviewToFront:_fpsLabel];
}

- (void)hide {    
    [_displayLink setPaused:YES];
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    for (UIView *label in keyWindow.subviews) {
        if ([label isKindOfClass:[UILabel class]]&& label.tag == TAG_fpsLabel) {
            [label removeFromSuperview];
            return;
        }
    }
}

- (void)applicationDidBecomeActiveNotification {
    [_displayLink setPaused:NO];
}

- (void)applicationWillResignActiveNotification {
    [_displayLink setPaused:YES];
}

- (void)setFpsLabelPosition:(FPSIndicatorPosition)fpsLabelPosition {
    _fpsLabelPosition = fpsLabelPosition;
    switch (_fpsLabelPosition) {
        case FPSIndicatorPositionTopLeft:
            _fpsLabel.frame = CGRectMake(ScreenWidth / 2 - SIZE_fpsLabel.width - PADDING_LEFT_fpsLabel, 0, SIZE_fpsLabel.width, SIZE_fpsLabel.height);
            break;
        case FPSIndicatorPositionTopRight:
            _fpsLabel.frame = CGRectMake(ScreenWidth / 2 + PADDING_RIGHT_fpsLabel, 0, SIZE_fpsLabel.width, SIZE_fpsLabel.height);
            break;
        case FPSIndicatorPositionBottomCenter:
            _fpsLabel.frame = CGRectMake((ScreenWidth - SIZE_fpsLabel.width) / 2, 0, SIZE_fpsLabel.width, SIZE_fpsLabel.height);
            break;
        default:
            break;
    }
}

@end
