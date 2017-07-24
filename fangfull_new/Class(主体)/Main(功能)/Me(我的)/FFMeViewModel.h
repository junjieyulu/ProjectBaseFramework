//
//  FFMeViewModel.h
//  fangfull_new
//
//  Created by Lee on 16/7/28.
//  Copyright © 2016年 zhonhong. All rights reserved.
//

#import "FFBaseModel.h"
@class FFUser;
@interface FFMeViewModel : FFBaseModel

+ (NSMutableDictionary *)defaultData;
+ (NSMutableDictionary *)tableViewDataWithUser:(FFUser *)ffuser;

@end
