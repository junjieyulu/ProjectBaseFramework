//
//  PromotionModel.h
//  ZhongHongRealEstate
//
//  Created by Lee on 16/6/17.
//  Copyright © 2016年 crab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FFBaseModel.h"
/**
 *  推广数据类
 */
@interface PromotionModel : FFBaseModel

@property (nonatomic, copy  ) NSString *idStr;
@property (nonatomic, assign) long long     timeLong;
@property (nonatomic, copy) NSString *showTime;
@property (nonatomic, copy  ) NSString *picStr;
@property (nonatomic, copy  ) NSString *titleStr;
@property (nonatomic, copy  ) NSString *subTitleStr;
@property (nonatomic, copy  ) NSString *contentStr;
@property (nonatomic, assign) BOOL     readedBool;

@end
