//
//  FFUser.h
//  fangfull_new
//
//  Created by Lee on 16/8/20.
//  Copyright © 2016年 zhonhong. All rights reserved.
//

#import "FFBaseModel.h"

@interface FFUser : FFBaseModel

@property (nonatomic, strong) NSString *sessionID;
@property (nonatomic, assign) NSInteger brokerID;
@property (nonatomic, strong) NSString *brokerName;
@property (nonatomic, strong) NSString *brokerPhoto;
@property (nonatomic, strong) NSString *brokerCellPhone;
@property (nonatomic, strong) NSString *company;
@property (nonatomic, assign) NSInteger companyID;
@property (nonatomic, assign) NSInteger customerCount;
@property (nonatomic, assign) NSInteger dividendValue;
@property (nonatomic, assign) NSInteger uID;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *brokerPhotoName;

+ (instancetype)sharedFFUser;

- (void)saveUserData;
- (void)clearUserData;
- (FFUser *)loadUserData;

@end
