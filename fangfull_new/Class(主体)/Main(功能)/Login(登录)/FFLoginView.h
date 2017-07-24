//
//  FFLoginView.h
//  fangfull_new
//
//  Created by Lee on 16/8/19.
//  Copyright © 2016年 zhonhong. All rights reserved.
//

#import "FFBaseView.h"

@interface FFLoginView : FFBaseView

@property (weak, nonatomic) IBOutlet UITextField *loginAcountTextField;
@property (weak, nonatomic) IBOutlet UITextField *loginPasswordTextField;

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@end
