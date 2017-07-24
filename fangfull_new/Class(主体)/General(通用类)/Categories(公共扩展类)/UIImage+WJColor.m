//
//  UIImage+WJColor.m
//  fangfull_new
//
//  Created by Lee on 16/7/19.
//  Copyright © 2016年 zhonhong. All rights reserved.
//

#import "UIImage+WJColor.h"

@implementation UIImage (WJColor)

+ (UIImage *)imagedColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return  theImage;
}

@end
