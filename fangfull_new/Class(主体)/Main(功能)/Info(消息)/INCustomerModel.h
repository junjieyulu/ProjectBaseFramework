//
//  INCustomerModel.h
//  ZhongHongRealEstate
//
//  Created by Lee on 16/6/22.
//  Copyright © 2016年 crab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FFBaseModel.h"
/**
 *  客户数据
 */
@interface INCustomerModel : FFBaseModel

@property (nonatomic, copy  ) NSString *idStr;
@property (nonatomic, copy  ) NSString *headStr;
@property (nonatomic, copy  ) NSString *titleStr;
@property (nonatomic, copy  ) NSString *desStr;//客户信息介绍
@property (nonatomic, assign) long long     timeLong;//时间戳
@property (nonatomic, copy) NSString *showTime;
@property (nonatomic, assign) BOOL     needLoginBool;//是否需要登录可看
@property (nonatomic, copy  ) NSString *linkStr;
@property (nonatomic, assign) BOOL     readedBool;

@property (nonatomic, copy)   NSString *content;
@property (nonatomic, assign) NSInteger cid;
@end
