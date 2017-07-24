//
//  UIImage+Category.m
//  fangfull_new
//
//  Created by Lee on 2017/7/7.
//  Copyright © 2017年 zhonhong. All rights reserved.
//

#import "UIImage+Category.h"

static char ImageVersionKey;


@implementation UIImage (Category)

/**
 方法交换，替换系统原有方法来实现扩展功能。
 */
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method originMethod = class_getInstanceMethod([self class], @selector(imageNamed:));
        Method newMethod = class_getInstanceMethod([self class], @selector(lee_imageNamed:));
        method_exchangeImplementations(originMethod, newMethod);
    });
}

/**
 替换系统原有方法imageNamed: 来实现对于版本升级导致的皮肤替换功能。

 @param name 图片名称
 */
- (void)lee_imageNamed:(NSString *)name {
    double version = [[UIDevice currentDevice].systemVersion doubleValue];
    if (version >= 7.0) {
        name = [name stringByAppendingString:@"_os7"];
    }
    return [self lee_imageNamed:name];
}

- (void)setVersion:(NSString *)version {
    objc_setAssociatedObject(self, &ImageVersionKey, version, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)version {
   return objc_getAssociatedObject(self, &ImageVersionKey);
}


@end
