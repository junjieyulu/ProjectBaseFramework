//
//  FFRequestManager.m
//  fangfull_new
//
//  Created by Lee on 16/7/19.
//  Copyright © 2016年 zhonhong. All rights reserved.
//

#import "FFRequestManager.h"
#import <AFNetworking.h>
#import "NSString+Blank.h"
@interface FFRequestManager ()
@end

static NSString * const FFREQUESTBASEURL = @"http://www.fangfull.com/";

@implementation FFRequestManager

FFSingletonM(FFRequestManager) // 单例实现

- (void)GET:(NSString *)URLString
 parameters:(nullable id)parameters
    success:(void (^)(id responseObject))success
    failure:(void (^)(NSError * error))failure
{
    NSString *url                 = URLString;
    if ([NSString isBlankString:URLString]) {
    url                           = FFREQUESTBASEURL;
    }
    if ([url rangeOfString:@"http"].location == NSNotFound) {
    url                           = [FFREQUESTBASEURL stringByAppendingString:URLString];
    }
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    NSMutableSet *contentTypes = [[NSMutableSet alloc] initWithSet:manager.responseSerializer.acceptableContentTypes];
//    [contentTypes addObject:@"text/html"];
//    [contentTypes addObject:@"text/plain"];
//    manager.responseSerializer.acceptableContentTypes = self.acceptableContentTypes;
//    manager.requestSerializer.timeoutInterval = (self.timeoutInterval ? self.timeoutInterval : 20);
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    [manager GET:URLString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success)
        {
            success(responseObject);
        }
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure)
        {
            failure(error);
        }
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    }];
}

- (void)POST:(NSString *)URLString
  parameters:(id)parameters
     success:(void (^)(id responseObject))success
     failure:(void (^)(NSError *error))failure
{
    NSString *url                 = URLString;
    if ([NSString isBlankString:URLString]) {
        url                           = FFREQUESTBASEURL;
    }
    if ([url rangeOfString:@"http"].location == NSNotFound) {
        url                           = [FFREQUESTBASEURL stringByAppendingString:URLString];
    }

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES]; // 开启状态栏动画
    
    [manager POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success)
        {
            success(responseObject);
        }
        
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO]; // 关闭状态栏动画
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure)
        {
            failure(error);
        }
        
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO]; // 关闭状态栏动画
    }];

}


@end
