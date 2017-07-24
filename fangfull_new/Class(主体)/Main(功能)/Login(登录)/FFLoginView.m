//
//  FFLoginView.m
//  fangfull_new
//
//  Created by Lee on 16/8/19.
//  Copyright © 2016年 zhonhong. All rights reserved.
//

#import "FFLoginView.h"

@interface FFLoginView ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIView *loginAcountView;
@property (weak, nonatomic) IBOutlet UIView *loginPasswordView;
@end

@implementation FFLoginView


- (void)setLoginAcountView:(UIView *)loginAcountView
{
    _loginAcountView = loginAcountView;
    self.loginAcountView.layer.borderWidth = 1.0f;
    self.loginAcountView.layer.borderColor = [[UIColor colorWithRed:214.0/255.0 green:214.0/255.0 blue:214.0/255.0 alpha:1.0] CGColor];
}


- (void)setLoginPasswordView:(UIView *)loginPasswordView
{
    _loginPasswordView = loginPasswordView;
    self.loginPasswordView.layer.borderWidth = 1.0f;
    self.loginPasswordView.layer.borderColor = [[UIColor colorWithRed:214.0/255.0 green:214.0/255.0 blue:214.0/255.0 alpha:1.0] CGColor];
}


@end
