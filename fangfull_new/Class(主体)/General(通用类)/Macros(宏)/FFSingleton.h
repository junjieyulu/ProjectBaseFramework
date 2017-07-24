//
//  FFSingleton.h
//  fangfull_new
//
//  Created by Lee on 16/8/3.
//  Copyright © 2016年 zhonhong. All rights reserved.
//

#ifndef FFSingleton_h
#define FFSingleton_h



/**
 *  .h文件
 */
#define FFSingletonH(name) + (instancetype)shared##name;

/**
 *  .m文件
 */

#if __has_feature(objc_arc)

#define FFSingletonM(name) \
static id _instance = nil; \
\
+ (instancetype)shared##name \
{ \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        _instance = [[self alloc] init]; \
    }); \
    return _instance; \
} \
\
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        _instance = [super allocWithZone:zone]; \
    }); \
    return _instance; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
    return _instance; \
} \
\
- (id)mutableCopyWithZone:(NSZone *)zone \
{ \
    return self; \
}

#else

#define FFSingletonM(name) \
static id _instance = nil; \
\
+ (instancetype)shared##name \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[self alloc] init]; \
}); \
return _instance; \
} \
\
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return _instance; \
} \
\
- (id)mutableCopyWithZone:(NSZone *)zone \
{ \
return self; \
} \
\
- (oneway void)release { } \
- (id)retain { return self; } \
- (NSUInteger)retainCount { return UINT_MAX;} \
- (id)autorelease { return self;}

#endif

#endif /* FFSingleton_h */
