//
//  UIButton+RedDot.h
//  ZhongHongRealEstate
//
//  Created by Lee on 16/6/27.
//  Copyright © 2016年 crab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (RedDot)

@property (assign, nonatomic) BOOL show;
@property (nonatomic, strong) UIView *dot;

@property (nonatomic, strong) UIView *separatorLine;
@property (assign, nonatomic) BOOL showSeparatorLine;

@end
