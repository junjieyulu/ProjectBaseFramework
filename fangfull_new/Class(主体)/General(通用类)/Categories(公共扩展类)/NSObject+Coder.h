//
//  NSObject+Coder.h
//  fangfull_new
//
//  Created by Lee on 2017/7/7.
//  Copyright © 2017年 zhonhong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Coder)

/**
 编码

 @param aCoder 编解码对象父类
 */
- (void)lee_encodeWithCoder:(NSCoder *)aCoder;


/**
 解码

 @param aDecoder 编解码对象父类
 @return 返回解码对象
 */
- (void)lee_decodeWithCoder:(NSCoder *)aDecoder;


@end

/**
 归档的实现,使用宏定义归解档
 */
#define LeeCodingImplementation \
- (id)initWithCoder:(NSCoder *)decoder \
{ \
if (self = [super init]) { \
[self lee_decodeWithCoder:decoder]; \
} \
return self; \
} \
\
- (void)encodeWithCoder:(NSCoder *)encoder \
{ \
[self lee_encodeWithCoder:encoder]; \
}

#define ObjectCatergoryCodingImplementation LeeCodingImplementation
