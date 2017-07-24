//
//  UINavigationItem+CustomBackItem.m
//  fangfull_new
//
//  Created by Lee on 16/7/29.
//  Copyright © 2016年 zhonhong. All rights reserved.
//

#import "UINavigationItem+CustomBackItem.h"
#import <objc/runtime.h>
static char kCustomBackItemKey;
@implementation UINavigationItem (CustomBackItem)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method originMethodImp = class_getInstanceMethod(self, @selector(backBarButtonItem));
        Method myCustomMethodImp = class_getInstanceMethod(self, @selector(customBackBarButtomItem));
        method_exchangeImplementations(originMethodImp, myCustomMethodImp);
    });
}

- (UIBarButtonItem *)backBarButtonItem
{
    return [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:NULL];
}

- (UIBarButtonItem *)customBackBarButtomItem
{
    UIBarButtonItem *item = [self customBackBarButtomItem];
    if (item) {
        return item;
    }
    item = objc_getAssociatedObject(self, &kCustomBackItemKey);
    if (!item) {
        item = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:NULL];
        objc_setAssociatedObject(self, &kCustomBackItemKey, item, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return item;
}

- (void)dealloc
{
    objc_removeAssociatedObjects(self);
}

@end
