//
//  PromotionModel.m
//  ZhongHongRealEstate
//
//  Created by Lee on 16/6/17.
//  Copyright © 2016年 crab. All rights reserved.
//

#import "PromotionModel.h"

@implementation PromotionModel

+(NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"idStr":@"private_message_id",
             @"titleStr":@"title",
             @"timeLong":@"create_time",
             @"picStr":@"picture",
             @"subTitleStr":@"short_content",
             @"contentStr":@"content",
             @"readedBool":@"is_read",
             @"showTime":@"time"
             };
}

@end
