//
//  UIButton+RedDot.m
//  ZhongHongRealEstate
//
//  Created by Lee on 16/6/27.
//  Copyright © 2016年 crab. All rights reserved.
//

#import "UIButton+RedDot.h"
#import <objc/runtime.h>
#import "Masonry.h"
static CGFloat sizeXY = 10;
NSString const *UIButton_showDotKey =@"UIButton_showDotKey";
NSString const *UIButton_DotKey =@"UIButton_DotKey";
NSString const *UIButton_SeparatorLineKey = @"UIButton_SeparatorLineKey";
NSString const *UIButton_showSeparartorLineKey = @"UIButton_showSeparartorLineKey";

@implementation UIButton (RedDot)
@dynamic show;

- (void)setShow:(BOOL)show
{
    NSNumber *number = [NSNumber numberWithBool:show];
    objc_setAssociatedObject(self, &UIButton_showDotKey, number, OBJC_ASSOCIATION_ASSIGN);
    if (show && !self.dot) {
        self.dot = [[UIView alloc] init];
        self.dot.backgroundColor = [UIColor colorWithHexString:@"#dc2827"];;
        self.dot.layer.masksToBounds = YES;
        self.dot.layer.cornerRadius = sizeXY / 2;
        [self addSubview:self.dot];
        __weak typeof(self) weakSelf = self;
        [self.dot mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(weakSelf.titleLabel.mas_right);
            make.top.mas_equalTo(5);
            make.width.height.mas_equalTo(sizeXY);
        }];
    }
    else if(!show && self.dot)
    {
        // Animate badge removal
        [UIView animateWithDuration:0.2 animations:^{
            self.dot.transform = CGAffineTransformMakeScale(0, 0);
        } completion:^(BOOL finished) {
            [self.dot removeFromSuperview];
            self.dot = nil;
        }];
    }
}

- (BOOL)show
{
    NSNumber *number = objc_getAssociatedObject(self, &UIButton_showDotKey);
    return [number boolValue];
}

- (void)setDot:(UIView *)dot
{
    objc_setAssociatedObject(self, &UIButton_DotKey, dot, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)dot
{
    return objc_getAssociatedObject(self, &UIButton_DotKey);
}

- (void)setSeparatorLine:(UIView *)separatorLine
{
    objc_setAssociatedObject(self, &UIButton_SeparatorLineKey, separatorLine, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)separatorLine
{
    return objc_getAssociatedObject(self, &UIButton_SeparatorLineKey);
}

- (void)setShowSeparatorLine:(BOOL)showSeparatorLine
{
    NSNumber *number = [NSNumber numberWithBool:showSeparatorLine];
    objc_setAssociatedObject(self, &UIButton_showSeparartorLineKey, number, OBJC_ASSOCIATION_ASSIGN);
    if (showSeparatorLine && !self.separatorLine) {
        self.separatorLine = [[UIView alloc] init];
        self.separatorLine.backgroundColor = [UIColor colorWithHexString:@"#dcdcdc"];;
        [self addSubview:self.separatorLine];
        __weak typeof(self) weakSelf = self;
        [self.separatorLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(0);
            make.height.mas_equalTo(20);
            make.centerY.equalTo(weakSelf.mas_centerY);
            make.width.mas_equalTo(1);
        }];
    }
    else if(!showSeparatorLine && self.separatorLine)
    {
        // Animate badge removal
        [UIView animateWithDuration:0.2 animations:^{
            self.separatorLine.transform = CGAffineTransformMakeScale(0, 0);
        } completion:^(BOOL finished) {
            [self.separatorLine removeFromSuperview];
            self.separatorLine = nil;
        }];
    }
}

- (BOOL)showSeparatorLine
{
    return [objc_getAssociatedObject(self, &UIButton_showSeparartorLineKey) boolValue];
}


@end
