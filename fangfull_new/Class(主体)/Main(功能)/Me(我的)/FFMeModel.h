//
//  FFMeModel.h
//  fangfull_new
//
//  Created by Lee on 16/7/28.
//  Copyright © 2016年 zhonhong. All rights reserved.
//

#import "FFBaseModel.h"

@interface FFMeModel : FFBaseModel

@property (nonatomic, strong) NSString *nameStr;
@property (nonatomic, strong) NSString *imageStr;
@property (nonatomic, strong) NSString *contentStr;
@property (nonatomic, strong) NSString *descriptionStr;

- (instancetype)initWithName:(NSString *)name;
- (instancetype)initWithName:(NSString *)name img:(NSString *)img content:(NSString *)content;


@end
