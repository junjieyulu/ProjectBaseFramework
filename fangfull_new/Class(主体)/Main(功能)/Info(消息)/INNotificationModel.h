//
//  INNotificationModel.h
//  ZhongHongRealEstate
//
//  Created by Lee on 16/6/22.
//  Copyright © 2016年 crab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "INCustomerModel.h"
#import "PromotionModel.h"
#import "FFBaseModel.h"

@interface INNotificationModel : FFBaseModel

@property (nonatomic, assign) INType type;
@property (nonatomic, strong) PromotionModel *promotionModel;
@property (nonatomic, strong) INCustomerModel *customerModel;

@end
