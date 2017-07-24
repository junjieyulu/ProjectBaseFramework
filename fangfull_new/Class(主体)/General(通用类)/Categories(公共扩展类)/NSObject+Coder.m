//
//  NSObject+Coder.m
//  fangfull_new
//
//  Created by Lee on 2017/7/7.
//  Copyright © 2017年 zhonhong. All rights reserved.
//

#import "NSObject+Coder.h"
#import <objc/runtime.h>

@implementation NSObject (Coder)

- (void)lee_encodeWithCoder:(NSCoder *)aCoder {
    unsigned int ivarsCount;
    Ivar *ivars = class_copyIvarList([self class], &ivarsCount);
    for (int i = 0; i < ivarsCount; i++) {
        Ivar ivar = ivars[i];
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        id value = [self valueForKey:ivarName];
        [aCoder encodeObject:value forKey:ivarName];
    }
    free(ivars);
}

- (void)lee_decodeWithCoder:(NSCoder *)aDecoder {
    unsigned int ivarsCount;
    Ivar *ivars = class_copyIvarList([self class], &ivarsCount);
    for (int i = 0; i < ivarsCount; i++) {
        Ivar ivar = ivars[i];
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        id value = [aDecoder decodeObjectForKey:ivarName];
        [self setValue:value forKey:ivarName];
    }
    free(ivars);
}

@end
