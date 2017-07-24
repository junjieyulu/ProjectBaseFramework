//
//  INNotificationModel.m
//  ZhongHongRealEstate
//
//  Created by Lee on 16/6/22.
//  Copyright © 2016年 crab. All rights reserved.
//

#import "INNotificationModel.h"

@implementation INNotificationModel

+ (NSDictionary *)replacedKeyFromPropertyName {
    return @{ @"type" : @"type",
              @"promotionModel" : @"promotion",
              @"customerModel" : @"customer"
            };
}



@end
