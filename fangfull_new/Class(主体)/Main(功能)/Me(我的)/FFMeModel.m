//
//  FFMeModel.m
//  fangfull_new
//
//  Created by Lee on 16/7/28.
//  Copyright © 2016年 zhonhong. All rights reserved.
//

#import "FFMeModel.h"

@implementation FFMeModel

- (instancetype)initWithName:(NSString *)name img:(NSString *)img content:(NSString *)content 
{
    self = [super init];
    if (self) {
        self.nameStr = name;
        self.imageStr = img;
        self.contentStr = content;
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    if (self) {
        self.nameStr = name;
    }
    return self;
}

@end
