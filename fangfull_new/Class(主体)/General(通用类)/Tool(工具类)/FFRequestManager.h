//
//  FFRequestManager.h
//  fangfull_new
//
//  Created by Lee on 16/7/19.
//  Copyright © 2016年 zhonhong. All rights reserved.
//

#import "FFBaseModel.h"
#import "FFSingleton.h"

NS_ASSUME_NONNULL_BEGIN  //swift和oc混编的时候，用来检测_Nullable、_Nonull和_Null_unspecified类型注释,从字面上我们可以猜到，__nullable表示对象可以是NULL或nil，而__nonnull表示对象不应该为空。当我们不遵循这一规则时，编译器就会给出警告。

typedef void(^ _Nullable Success)(id responseObject);
typedef void(^ _Nullable Failed)(NSError *error);

@interface FFRequestManager : FFBaseModel

FFSingletonH(FFRequestManager)//单例

///**
// *  超时时间(默认20秒)
// */
//@property (nonatomic, assign) NSTimeInterval timeoutInterval;
//
///**
// *  可接受的响应内容类型
// */
//@property (nonatomic, copy) NSSet <NSString *> *acceptableContentTypes;


/**
 *  封装的GET请求
 *
 *  @param URLString  请求的链接
 *  @param parameters 请求的参数
 *  @param success    请求成功回调
 *  @param failure    请求失败回调
 */
- (void)GET:(NSString *)URLString
 parameters:(nullable id)parameters
    success:(void (^)(id responseObject))success
    failure:(void (^)(NSError * error))failure;


/**
 *  封装的POST请求
 *
 *  @param URLString  请求的链接
 *  @param parameters 请求的参数
 *  @param success    请求成功回调
 *  @param failure    请求失败回调
 */
- (void)POST:(NSString *)URLString
  parameters:(id)parameters
     success:(void (^)(id responseObject))success
     failure:(void (^)(NSError *error))failure;

@end

NS_ASSUME_NONNULL_END