//
//  Macro.h
//  KDReader
//
//  Created by 陳升琪 on 2017/5/16.
//  Copyright © 2017年 陳升琪. All rights reserved.
//
// 常用的宏

#import "Masonry.h"

#ifndef Macro_h
#define Macro_h


/**
 屏幕宽度
 屏幕高度
*/
#define KScreen_Width   [UIScreen mainScreen].bounds.size.width
#define KScreen_Height  [UIScreen mainScreen].bounds.size.height


/**
  获取当前语言
 */
#define KCurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])


/**
 项目URL
 */
#define KReader_URL @"https://gravity.hizuoye.com/"

#define KReader_URL_IPV6 @"https://gravity.kuandov6.com/"

/**
 一种背景灰
 */
#define GrayColor [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0f]



#endif /* Macro_h */
