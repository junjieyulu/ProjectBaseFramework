//
//  FFUser.m
//  fangfull_new
//
//  Created by Lee on 16/8/20.
//  Copyright © 2016年 zhonhong. All rights reserved.
//

#import "FFUser.h"

@interface FFUser ()

@property (nonatomic, strong) NSString *archivingFilePath;

@end

@implementation FFUser

+ (NSDictionary *)replacedKeyFromPropertyName {
    return @{ @"sessionID" : @"session_id",
              @"brokerID" : @"broker_id",
              @"brokerName" : @"broker_name",
              @"brokerPhoto" : @"broker_photo",
              @"brokerCellPhone" : @"broker_cellphone" ,
              @"companyID" : @"company_id" ,
              @"company" : @"company",
              @"customerCount" : @"customer_count",
              @"dividendValue" : @"dividend_value",
              @"uID":@"uid",
              @"status":@"status",
              @"userName":@"username",
              @"password":@"password",
              };
}

#pragma mark - NSCoding
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_sessionID forKey:FFUserDefaultSessionIDKey];
    [aCoder encodeInteger:_brokerID forKey:FFUserDefaultBrokerIDKey];
    [aCoder encodeObject:_brokerName forKey:FFUserDefaultBrokerNameKey];
    [aCoder encodeObject:_brokerPhoto forKey:FFUserDefaultBrokerPhotoKey];
    [aCoder encodeObject:_brokerCellPhone forKey:FFUserDefaultBrokerCellPhoneKey];
    [aCoder encodeObject:_company forKey:FFUserDefaultCompanyKey];
    [aCoder encodeInteger:_companyID forKey:FFUserDefaultcompanyIDKey];
    [aCoder encodeInteger:_customerCount forKey:FFUserDefaultCustomerCountKey];
    [aCoder encodeInteger:_dividendValue forKey:FFUserDefaultDividendValueKey];
    [aCoder encodeInteger:_uID forKey:FFUserDefaultUIDKey];
    [aCoder encodeInteger:_status forKey:FFUserDefaultStatusKey];
    [aCoder encodeObject:_userName forKey:FFUserDefaultUserNameKey];
    [aCoder encodeObject:_password forKey:FFUserDefaultPasswordKey];
    [aCoder encodeObject:_brokerPhotoName forKey:FFUserDefaultBrokerPhotoNameKey];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        _sessionID = [aDecoder decodeObjectForKey:FFUserDefaultSessionIDKey];
        _brokerID = [aDecoder decodeIntegerForKey:FFUserDefaultBrokerIDKey];
        _brokerName = [aDecoder decodeObjectForKey:FFUserDefaultBrokerNameKey];
        _brokerPhoto = [aDecoder decodeObjectForKey:FFUserDefaultBrokerPhotoKey];
        _brokerCellPhone = [aDecoder decodeObjectForKey:FFUserDefaultBrokerCellPhoneKey];
        _company = [aDecoder decodeObjectForKey:FFUserDefaultCompanyKey];
        _companyID = [aDecoder decodeIntegerForKey:FFUserDefaultcompanyIDKey];
        _customerCount = [aDecoder decodeIntegerForKey:FFUserDefaultCustomerCountKey];
        _dividendValue = [aDecoder decodeIntegerForKey:FFUserDefaultDividendValueKey];
        _uID = [aDecoder decodeIntegerForKey:FFUserDefaultUIDKey];
        _status = [aDecoder decodeIntegerForKey:FFUserDefaultStatusKey];
        _userName = [aDecoder decodeObjectForKey:FFUserDefaultUserNameKey];
        _password = [aDecoder decodeObjectForKey:FFUserDefaultPasswordKey];
        _brokerPhotoName = [aDecoder decodeObjectForKey:FFUserDefaultBrokerPhotoNameKey];
    }
    return self;
}

static FFUser * _instance = nil;

+ (instancetype)sharedFFUser
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}

- (id)mutableCopyWithZone:(NSZone *)zone
{
    return self;
}

#pragma mark - NSCoping
- (id)copyWithZone:(NSZone *)zone {
    FFUser *user = [[[self class] allocWithZone:zone] init];
    user.sessionID = [self.sessionID copyWithZone:zone];
    user.brokerID = self.brokerID;
    user.brokerName = [self.brokerName copyWithZone:zone];
    user.brokerPhoto = [self.brokerPhoto copyWithZone:zone];
    user.brokerCellPhone = [self.brokerCellPhone copyWithZone:zone];
    user.company = [self.company copyWithZone:zone];
    user.companyID = self.companyID;
    user.customerCount = self.customerCount;
    user.dividendValue = self.dividendValue;
    user.uID = self.uID;
    user.status = self.status;
    user.userName = self.userName;
    user.password = self.password;
    user.brokerPhotoName  = self.brokerPhotoName;
    return user;
}

#define FFUserArchiveKey @"FFUser"

- (NSString *)archivingFilePath
{
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *userPath = [documentPath stringByAppendingPathComponent:FFUserArchiveKey];
    if (![[NSFileManager defaultManager] fileExistsAtPath:userPath]) {
        [[NSFileManager defaultManager] createFileAtPath:userPath contents:nil attributes:nil];
    }
    return userPath;
}

- (void)saveUserData
{
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:self forKey:FFUserArchiveKey];
    [archiver finishEncoding];
    [data writeToFile:self.archivingFilePath atomically:YES];
}

- (void)clearUserData
{
    NSError *error;
    [[NSFileManager defaultManager] removeItemAtPath:self.archivingFilePath error:&error];
    if (error) NSLog(@"清除用户数据出错");
}

- (FFUser *)loadUserData
{
    NSData *data = [[NSMutableData alloc] initWithContentsOfFile:self.archivingFilePath];
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    FFUser *user = [unarchiver decodeObjectForKey:FFUserArchiveKey];// initWithCoder方法被调用
    [unarchiver finishDecoding];
    return user;
}

@end
