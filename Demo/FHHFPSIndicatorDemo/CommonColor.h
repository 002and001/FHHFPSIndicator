//
//  CommonColor.h
//  FHHFPSIndicatorDemo
//
//  Created by hefanghui on 2017/9/5.
//  Copyright © 2017年 002. All rights reserved.
//

#ifndef CommonColor_h
#define CommonColor_h

#define RandomColor [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1.0]
#define RGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define HQColor(RED, GREEN, BLUE, ALPHA) [UIColor colorWithRed:RED green:GREEN blue:BLUE alpha:ALPHA]
#define kColorAlpha(color, alpha) [color colorWithAlphaComponent:alpha]

#define kColorBackGround RGBColor(246,246,246)
#define kColorLine RGBColor(237,237,237)

#define kColorC1_1 RGBColor(255,128,35)
#define kColorC1_2 RGBColor(240,118,29)

#define kColorC2_1 RGBColor(250,151,39)
#define kColorC2_2 RGBColor(250,201,71)
#define kColorC2_3 RGBColor(197,144,105)
#define kColorC2_4 RGBColor(255,133,133)
#define kColorC2_5 RGBColor(124,219,90)

#define kColorC3_1 RGBColor(40,40,40)
#define kColorC3_2 RGBColor(58,58,58)
#define kColorC3_3 RGBColor(80,80,80)
#define kColorC3_4 RGBColor(119,119,119)
#define kColorC3_5 RGBColor(156,156,156)
#define kColorC3_6 RGBColor(187,187,187)
#define kColorC3_7 RGBColor(204,204,204)

#define kColorC4_1 RGBColor(255,255,255)
#define kColorC4_2 RGBColor(245,246,247)
#define kColorC4_3 RGBColor(250,250,250)
#define kColorC4_4 RGBColor(237,237,237)
#define kColorC4_5 RGBColor(220,220,220)
#define kColorC4_6 RGBColor(240,240,240)

#endif /* CommonColor_h */
