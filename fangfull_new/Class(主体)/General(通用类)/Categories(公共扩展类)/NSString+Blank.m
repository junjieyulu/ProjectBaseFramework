//
//  NSString+Blank.m
//  fangfull_new
//
//  Created by Lee on 16/8/3.
//  Copyright © 2016年 zhonhong. All rights reserved.
//

#import "NSString+Blank.h"

@implementation NSString (Blank)

+ (BOOL)isBlankString:(NSString *)string
{
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0) {
        return YES;
    }
    return NO;
}

@end
