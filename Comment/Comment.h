//
//  Comment.h
//  AutoFinance
//
//  Created by lvdl on 15/7/13.
//  Copyright (c) 2015年 www.palcw.com. All rights reserved.
//

#ifndef AutoFinance_Comment_h
#define AutoFinance_Comment_h


/**
 *  屏幕的宽和高
 */
#define SCREEN_HEIGHT_IPHONE ((SCREEN_WIDTH > SCREEN_HEIGHT) ? (SCREEN_WIDTH) : (SCREEN_HEIGHT))
#define SCREEN_WIDTH_IPHONE ((SCREEN_HEIGHT < SCREEN_WIDTH) ? (SCREEN_HEIGHT) : (SCREEN_WIDTH))

// 判断屏幕尺寸
#define SCREEN_55_INCH	([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1080, 1920), [[UIScreen mainScreen] currentMode].size) : NO)
#define SCREEN_47_INCH	([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define SCREEN_4_INCH	([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define SCREEN_35_INCH	([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

// 主窗口尺寸
#define SCREEN_WIDTH        [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT       [UIScreen mainScreen].bounds.size.height


/**
 判读是否iOS7及以上版本
 */

#define     iOS7                    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define     iOS8                    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

//#define     iPhone6P                 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? \
//CGSizeEqualToSize(CGSizeMake(1242, 2208), \
//[[UIScreen mainScreen] currentMode].size) : NO)
//
//#define     iPhone6                 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? \
//CGSizeEqualToSize(CGSizeMake(750, 1334), \
//[[UIScreen mainScreen] currentMode].size) : NO)
//#define     iPhone5                 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? \
//CGSizeEqualToSize(CGSizeMake(640, 1136), \
//[[UIScreen mainScreen] currentMode].size) : NO)
//
//#define     iPhone4                 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? \
//CGSizeEqualToSize(CGSizeMake(640, 960), \
//[[UIScreen mainScreen] currentMode].size) : NO)

#define     iPhone6P                (([[UIScreen mainScreen] bounds].size.height) > 667)
#define     iPhone6                 (([[UIScreen mainScreen] bounds].size.height) == 667)
#define     iPhone5                 (([[UIScreen mainScreen] bounds].size.height) == 568)
#define     iPhone4                 (([[UIScreen mainScreen] bounds].size.height) == 480)


#define     kLodingGifSize           CGSizeMake(120, 120)
#define     kLodingGifTitle          @"加载中 · · ·"
#define     kLodingGifTitleColor     RGBA(65, 65, 65, 1)
#define     kLodingGifTitleFont      kFont(13)


/**
 * 字体定义
 */

#define     kFont(a)            [UIFont systemFontOfSize:a]

#define     kFontBold(a)           [UIFont fontWithName:@"Helvetica-Bold" size:a]       // 兰亭黑-简 中黑
#define     kFontLight(a)          [UIFont fontWithName:@"Marion-Regular" size:a]       // 兰亭黑-简 纤黑

#define     kFontBoldW6(a)      [UIFont fontWithName:@"STHeitiSC-Medium" size:a]     // 冬青黑体简体中文 W6
#define     kFontBoldW3(a)      [UIFont fontWithName:@"STHeitiSC-Light" size:a]      // 冬青黑体简体中文 W3

/**
 *  文案
 */


/**
 *  本地 json 文件
 */


/**
 *  颜色
 */
#define  RGBA(r, g, b, a)       [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:a]

#define kBackGroundColor        RGBA(246, 246, 248, 1)

#define kRedColor               RGBA(255, 100, 100, 1)   // 红色
#define kRedColorAlpha(a)       RGBA(255, 100, 100, a)   // 红色

#define kGreenColor             RGBA(0, 200, 200, 1)     // 绿色
#define kGreenColorAlpha(a)     RGBA(0, 200, 200, a)     // 绿色

#define kWhiteColor             RGBA(255, 255, 255, 1)   // 白色

#define kLineColor              RGBA(220, 221, 221, 1)   // 分割线颜色
#define kLineColorAlpha(a)      RGBA(220, 221, 221, a)   // 分割线颜色




/**
 返回一个介于-1到1之间的随机浮点数
 */
#define IMRANDOM_MINUS1_1() ((2.0f*((float)rand()/RAND_MAX))-1.0f)


/**
 返回一个介于0到1之间的随机浮点数
 */
#define IMRANDOM_0_1() ((float)rand()/RAND_MAX)


/**
 只在debug build的时,打印输出
 需要在设置中的Debug模式下开启DEBUG标识符
 */

#ifdef  DEBUG
#define DLog(...) NSLog(@"%s %@", __PRETTY_FUNCTION__, [NSString stringWithFormat:__VA_ARGS__])
#else
#define DLog(...) do { } while (0)
#endif






#endif
