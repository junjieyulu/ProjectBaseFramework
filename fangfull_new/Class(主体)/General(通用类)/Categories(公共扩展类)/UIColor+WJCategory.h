//
//  UIColor+WJCategory.h
//  fangfull_new
//
//  Created by Lee on 16/7/19.
//  Copyright © 2016年 zhonhong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (WJCategory)
/**
 * @brief 将16进制颜色字符串转成UIColor对象
 *
 * @param hexString4Color 16进制颜色字符串， 支持@“#123456”、 @“0X123456”、 @“123456”三种格式
 *
 * @return 返回相应的UIColor对象
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString4Color;

/**
 * @brief 将16进制颜色字符串转成UIColor对象
 *
 * @param hexString4Color 16进制颜色字符串， 支持@“#123456”、 @“0X123456”、 @“123456”三种格式
 * @param alpha 颜色的透明度设置
 *
 * @return 返回相应的UIColor对象
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString4Color alpha:(CGFloat)alpha;


@end
