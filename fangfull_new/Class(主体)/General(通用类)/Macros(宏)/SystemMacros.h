//
//  SystemMacros.h
//  fangfull_new
//
//  Created by Lee on 16/7/18.
//  Copyright © 2016年 zhonhong. All rights reserved.
//

#ifndef SystemMacros_h
#define SystemMacros_h

#define SYSTEM_SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define SYSTEM_SCREENH_HEIGHT [UIScreen mainScreen].bounds.size.height

/*----------------判断当前的iPhone设备/系统版本------------------------*/
//判断是否为iPhone
#define iPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
//判断是否为iPad
#define iPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
//判断是否为ipod
#define iPodTouch ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])
// 判断是否为 iPhone 5SE
#define iPhone5s [[UIScreen mainScreen] bounds].size.width == 320.0f && [[UIScreen mainScreen] bounds].size.height == 568.0f
// 判断是否为iPhone 6/6s
#define iPhone6s [[UIScreen mainScreen] bounds].size.width == 375.0f && [[UIScreen mainScreen] bounds].size.height == 667.0f
// 判断是否为iPhone 6Plus/6sPlus
#define iPhone6p [[UIScreen mainScreen] bounds].size.width == 414.0f && [[UIScreen mainScreen] bounds].size.height == 736.0f
//获取系统版本
#define iosVersionFloat [[[UIDevice currentDevice] systemVersion] floatValue]
//判断 iOS 8 或更高的系统版本
#define ios8 (([[[UIDevice currentDevice] systemVersion] floatValue] >=8.0)? (YES):(NO))
#define ios7 (([[[UIDevice currentDevice] systemVersion] floatValue] >=7.0)? (YES):(NO))
#define ios6 (([[[UIDevice currentDevice] systemVersion] floatValue] >=6.0)? (YES):(NO))

/*----------------判断是真机还是模拟器---------------------------------*/
#if TARGET_OS_IPHONE
//iPhone Device
#endif
#if TARGET_IPHONE_SIMULATOR
//iPhone Simulator
#endif

/*-----------------沙盒目录文件---------------------------------------*/
//获取temp
#define kPathTemp NSTemporaryDirectory()
//获取沙盒 Document
#define kPathDocument [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//获取沙盒 Cache
#define kPathCache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]

#endif /* SystemMacros_h */
