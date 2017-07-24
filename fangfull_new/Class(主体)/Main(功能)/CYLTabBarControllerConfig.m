//
//  CYLTabBarControllerConfig.m
//  fangfull_new
//
//  Created by Lee on 16/7/18.
//  Copyright © 2016年 zhonhong. All rights reserved.
//

#import "CYLTabBarControllerConfig.h"
#import "FFHomeViewController.h"
#import "FFInfoViewController.h"
#import "FFCustomerViewController.h"
#import "FFMeViewController.h"
#import "FFNavigationController.h"

@import Foundation;
@import UIKit;

@interface CYLTabBarControllerConfig ()
@property (nonatomic,readwrite ,strong) CYLTabBarController *tabBarController;

@end

@implementation CYLTabBarControllerConfig


- (CYLTabBarController *)tabBarController
{
    if (!_tabBarController) {
        CYLTabBarController *tabBarController = [CYLTabBarController tabBarControllerWithViewControllers:self.viewControllers
                                                                                   tabBarItemsAttributes:self.tabBarItemsAttributesForController];
//        [self customizeTabBarAppearance:tabBarController];
        [self customizeInterface];
        _tabBarController = tabBarController;
    }
    return _tabBarController;
}

#define FangFull_Homevc_Title NSLocalizedStringFromTable(@"FangFull_Homevc_Title", @"CYLTabBarControllerConfig", @"homevc_title")
#define FangFull_Infovc_Title NSLocalizedStringFromTable(@"FangFull_Infovc_Title", @"CYLTabBarControllerConfig", @"infovc_title")
#define FangFull_Customervc_Title NSLocalizedStringFromTable(@"FangFull_Customervc_Title", @"CYLTabBarControllerConfig", @"customer_title")
#define FangFull_Mevc_Title NSLocalizedStringFromTable(@"FangFull_Mevc_Title", @"CYLTabBarControllerConfig", @"me_title")
#define FangFull_Mevc_TabBar_Title NSLocalizedStringFromTable(@"FangFull_Mevc_TabBar_Title", @"CYLTabBarControllerConfig", @"me_tabbar_title")


- (NSArray *)viewControllers {
    FFHomeViewController *homeVC = [[FFHomeViewController alloc] init];
    homeVC.title = FangFull_Homevc_Title;
    UIViewController *homeNavigationController = [[FFNavigationController alloc]initWithRootViewController:homeVC];
    FFInfoViewController *infoVC = [[FFInfoViewController alloc] init];
    infoVC.title = FangFull_Infovc_Title;
    UIViewController *infoNavigationController = [[FFNavigationController alloc]initWithRootViewController:infoVC];
    FFCustomerViewController *customerVC = [[FFCustomerViewController alloc] init];
    customerVC.title = FangFull_Customervc_Title;
    UIViewController *customerNavigationController = [[FFNavigationController alloc]initWithRootViewController:customerVC];
    FFMeViewController *meVC = [[FFMeViewController alloc] init];
    meVC.title = FangFull_Mevc_Title;
    UIViewController *meNavigationController = [[FFNavigationController alloc]initWithRootViewController:meVC];
    /**
     * 以下两行代码目的在于手动设置让TabBarItem只显示图标，不显示文字，并让图标垂直居中。
     * 等效于在 `-tabBarItemsAttributesForController` 方法中不传 `CYLTabBarItemTitle` 字段。
     * 更推荐后一种做法。
     */
//    _tabBarController.imageInsets = UIEdgeInsetsMake(4.5, 0, -4.5, 0);
//    _tabBarController.titlePositionAdjustment = UIOffsetMake(0, MAXFLOAT);
    NSArray *viewControllers = @[
                                 homeNavigationController,
                                 infoNavigationController,
                                 customerNavigationController,
                                 meNavigationController
                                 ];
    return viewControllers;
}

- (NSArray *)tabBarItemsAttributesForController {
    NSDictionary *firstTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : FangFull_Homevc_Title,
                                                 CYLTabBarItemImage : @"btn_house_2",
                                                 CYLTabBarItemSelectedImage : @"btn_house_1",
                                                 };
    NSDictionary *secondTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : FangFull_Infovc_Title,
                                                  CYLTabBarItemImage : @"btn_news_2",
                                                  CYLTabBarItemSelectedImage : @"btn_news_1",
                                                  };
    NSDictionary *thirdTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : FangFull_Customervc_Title,
                                                 CYLTabBarItemImage : @"btn_customer_2",
                                                 CYLTabBarItemSelectedImage : @"btn_customer_1",
                                                 };
    NSDictionary *fourthTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : FangFull_Mevc_TabBar_Title,
                                                  CYLTabBarItemImage : @"btn_user_2",
                                                  CYLTabBarItemSelectedImage : @"btn_user_1"
                                                  };
    NSArray *tabBarItemsAttributes = @[
                                       firstTabBarItemsAttributes,
                                       secondTabBarItemsAttributes,
                                       thirdTabBarItemsAttributes,
                                       fourthTabBarItemsAttributes
                                       ];
    return tabBarItemsAttributes;
}

/**
 *  tabBarItem 的选中和不选中文字属性、背景图片
 */
- (void)customizeInterface {
    
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = FFColor_NavigationBarBackGround;
    
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    // 设置背景图片
//    UITabBar *tabBarAppearance = [UITabBar appearance];
//    [tabBarAppearance setBackgroundImage:[UIImage imageNamed:@"tabbar_background"]];
}


- (void)updateTabBarCustomizationWhenTabBarItemWidthDidUpdate {
    void (^deviceOrientationDidChangeBlock)(NSNotification *) = ^(NSNotification *notification) {
        UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
        if ((orientation == UIDeviceOrientationLandscapeLeft) || (orientation == UIDeviceOrientationLandscapeRight)) {
            NSLog(@"Landscape Left or Right !");
        } else if (orientation == UIDeviceOrientationPortrait) {
            NSLog(@"Landscape portrait!");
        }
        [self customizeTabBarSelectionIndicatorImage];
    };
    [[NSNotificationCenter defaultCenter] addObserverForName:CYLTabBarItemWidthDidChangeNotification
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:deviceOrientationDidChangeBlock];
}

- (void)customizeTabBarSelectionIndicatorImage {
    ///Get initialized TabBar Height if exists, otherwise get Default TabBar Height.
    UITabBarController *tabBarController = [self cyl_tabBarController] ?: [[UITabBarController alloc] init];
    CGFloat tabBarHeight = tabBarController.tabBar.frame.size.height;
    CGSize selectionIndicatorImageSize = CGSizeMake(CYLTabBarItemWidth, tabBarHeight);
    //Get initialized TabBar if exists.
    UITabBar *tabBar = [self cyl_tabBarController].tabBar ?: [UITabBar appearance];
    [tabBar setSelectionIndicatorImage:
     [[self class] imageWithColor:[UIColor redColor]
                             size:selectionIndicatorImageSize]];
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width + 1, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
