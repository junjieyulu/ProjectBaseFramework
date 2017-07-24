//
//  FFLoginViewController.m
//  fangfull_new
//
//  Created by Lee on 16/7/18.
//  Copyright © 2016年 zhonhong. All rights reserved.
//

#import "FFLoginViewController.h"
#import "FFLoginView.h"
#import "FFRequestManager.h"
#import "FFUser.h"

@interface FFLoginViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet FFLoginView *loginView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityView;
@end

@implementation FFLoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#define FFLogin_Alert_NoDataInput NSLocalizedStringFromTable(@"FFLogin_Alert_NoDataInput", @"FFAlertString", @"login no data input")
#define FFLogin_Alert_MakeSure NSLocalizedStringFromTable(@"FFLogin_Alert_MakeSure", @"FFAlertString", @"login ok")


- (IBAction)login:(id)sender {
    
    [self.loginView.loginAcountTextField resignFirstResponder];
    [self.loginView.loginPasswordTextField resignFirstResponder];

    if (self.loginView.loginAcountTextField.text.length > 0 && self.loginView.loginPasswordTextField.text.length > 0) {
        [self.activityView startAnimating];
        
        NSDictionary *dic = @{ @"userID" : ([[NSUserDefaults standardUserDefaults] objectForKey:FFUserDefaultUserIDKey] ? [[NSUserDefaults standardUserDefaults] objectForKey:FFUserDefaultUserIDKey] : @""),
                               @"channelID" : ([[NSUserDefaults standardUserDefaults] objectForKey:FFUserDefaultChannelIDKey] ? [[NSUserDefaults standardUserDefaults] objectForKey:FFUserDefaultChannelIDKey] : @""),
                               @"deviceType" : @4,
                               @"username" : self.loginView.loginAcountTextField.text,
                               @"password" : self.loginView.loginPasswordTextField.text,
                               @"version"   : [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"],
                               @"clientPackage"   : @"com.zhonhong.fangfull"
                               };
        
        [[FFRequestManager sharedFFRequestManager] POST:kMODULE_LOG_IN parameters:dic success:^(id  _Nonnull responseObject) {
            [self.activityView stopAnimating];
            if ([responseObject isKindOfClass:[NSDictionary class]]) {
                
                if ([responseObject[@"result"] integerValue] == 1){
                    
                    id msgObj = responseObject[@"msg"];
                    
                    if ([msgObj isKindOfClass:[NSString class]]) {
                        [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:FFUserDefaultLoginStatusKey];
                        [self alertViewWithTitle:nil message:msgObj cancelButtonTitle:FFLogin_Alert_MakeSure];
                        return ;
                    }

                }
                
                [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:FFUserDefaultLoginStatusKey];
                FFUser *user = [FFUser mj_objectWithKeyValues:responseObject];
                user.status = 1;
                user.userName = self.loginView.loginAcountTextField.text;
                user.password = self.loginView.loginPasswordTextField.text;
                user.brokerPhotoName = (user.brokerPhoto.length > 0 ) ? [[user.brokerPhoto componentsSeparatedByString:@"/"] lastObject] : @"";
                [user saveUserData];//归档.
                if (self.delegate && [self.delegate respondsToSelector:@selector(loginSuccess:)]) {
                    [self.delegate loginSuccess:user];
                }
                
                [self.navigationController popViewControllerAnimated:YES];
            }
            else
            {
                [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:FFUserDefaultLoginStatusKey];
                [self alertViewWithTitle:nil message:FFLogin_Alert_NoDataInput cancelButtonTitle:FFLogin_Alert_MakeSure];
                self.loginView.loginPasswordTextField.text = @"";
                [self.loginView.loginAcountTextField becomeFirstResponder];
            }
        } failure:^(NSError * _Nonnull error) {
            [self.activityView stopAnimating];
            [self alertViewWithTitle:nil message:FFLogin_Alert_NoDataInput cancelButtonTitle:FFLogin_Alert_MakeSure];
        }];
    }
    else
    {
        [self alertViewWithTitle:nil message:FFLogin_Alert_NoDataInput cancelButtonTitle:FFLogin_Alert_MakeSure];
        self.loginView.loginPasswordTextField.text = @"";
    }
}

- (void)alertViewWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancel
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:cancel
                                              otherButtonTitles:nil];
    [alertView show];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([self.loginView.loginAcountTextField isFirstResponder]) {
        [self.loginView.loginPasswordTextField becomeFirstResponder];
    }
    else if ([self.loginView.loginPasswordTextField isFirstResponder])
    {
        [self.loginView.loginPasswordTextField resignFirstResponder];
        [self login:nil];
    }
    return YES;
}

@end
