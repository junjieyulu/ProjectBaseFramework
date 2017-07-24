//
//  INCustomerModel.m
//  ZhongHongRealEstate
//
//  Created by Lee on 16/6/22.
//  Copyright © 2016年 crab. All rights reserved.
//

#import "INCustomerModel.h"

@implementation INCustomerModel

+ (NSDictionary *)replacedKeyFromPropertyName {
    return @{ @"idInteger" : @"id",
              @"titleStr" : @"title",
              @"timeLong" : @"create_time",
              @"headStr" : @"picture",
              @"desStr" : @"description",
              @"needLoginBool" : @"needLogin",
              @"linkStr" : @"url",
              @"content":@"content",
              @"cid":@"customer_id",
              @"showTime":@"time",
              @"readedBool":@"is_read",
              };
}

@end
