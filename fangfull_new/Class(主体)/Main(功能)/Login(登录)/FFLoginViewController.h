//
//  FFLoginViewController.h
//  fangfull_new
//
//  Created by Lee on 16/7/18.
//  Copyright © 2016年 zhonhong. All rights reserved.
//

#import "FFBaseViewController.h"
@class FFUser;

@protocol LoginViewControllerProtocol <NSObject>

- (void)loginSuccess:(FFUser *)user;

@end


@interface FFLoginViewController : FFBaseViewController

@property (nonatomic, assign) id <LoginViewControllerProtocol> delegate;

@end
