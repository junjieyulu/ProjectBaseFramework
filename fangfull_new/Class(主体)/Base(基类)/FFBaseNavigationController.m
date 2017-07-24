//
//  FFBaseNavigationController.m
//  fangfull_new
//
//  Created by Lee on 16/7/18.
//  Copyright © 2016年 zhonhong. All rights reserved.
//

#import "FFBaseNavigationController.h"

@interface FFBaseNavigationController ()

@end

@implementation FFBaseNavigationController


/**
 *  初始化（每一个类只会调用一次）
 */
+ (void)initialize
{
    // 1.获得bar对象
    UINavigationBar *navBar = [UINavigationBar appearance];
    [navBar setBackgroundImage:[UIImage imagedColor:FFColor_NavigationBarBackGround] forBarMetrics:UIBarMetricsDefault];

    // 2.不是iOS7
//    if (!ios7) {
//        // 2.1.设置bar背景
//        [navBar setBackgroundImage:[UIImage imagedColor:FFColor_NavigationBarBackGround] forBarMetrics:UIBarMetricsDefault];
//        // 2.2.设置状态栏为黑色
//        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
//    }
    
    // 3.设置文字样式
    NSShadow *shadow = [NSShadow new];
    [shadow setShadowColor: [UIColor colorWithWhite:0.0f alpha:0.750f]];
    [shadow setShadowOffset: CGSizeMake(0.0f, 1.0f)];
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    attrs[NSShadowAttributeName] = shadow;
    attrs[NSFontAttributeName] = ios7 ? [UIFont systemFontOfSize:20]: [UIFont boldSystemFontOfSize:20];
    [navBar setTitleTextAttributes:attrs];
    
    // 4.设置导航栏按钮的主题
    UIBarButtonItem *barItem = [UIBarButtonItem appearance];
    
    // 5.设置按钮的背景
//    if (!ios7) {
//        [barItem setBackgroundImage:[UIImage imageNamed:@"navigationbar_button_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
//        [barItem setBackgroundImage:[UIImage imageNamed:@"navigationbar_button_background_pushed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
//        [barItem setBackgroundImage:[UIImage imageNamed:@"navigationbar_button_background_disable"] forState:UIControlStateDisabled barMetrics:UIBarMetricsDefault];
//    }
    [barItem setBackButtonBackgroundImage:[UIImage imageNamed:@"navigation_item_back"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];//
    [barItem setBackButtonBackgroundImage:[UIImage imageNamed:@"navigation_item_back"] forState:UIControlStateNormal barMetrics:UIBarMetricsCompact];//LandscapePhone back image


    // 6.设置按钮的文字样式
    NSShadow *itemShadow = [NSShadow new];
    [itemShadow setShadowColor: [UIColor colorWithWhite:0.0f alpha:0.750f]];
    [itemShadow setShadowOffset: CGSizeMake(0.0f, 1.0f)];
    NSMutableDictionary *itemAttrs = [NSMutableDictionary dictionary];
    itemAttrs[NSForegroundColorAttributeName] = ios7 ? [UIColor orangeColor] : [UIColor blackColor];
    itemAttrs[NSShadowAttributeName] = itemShadow;
    [barItem setTitleTextAttributes:itemAttrs forState:UIControlStateNormal];
    [barItem setTitleTextAttributes:itemAttrs forState:UIControlStateHighlighted];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
