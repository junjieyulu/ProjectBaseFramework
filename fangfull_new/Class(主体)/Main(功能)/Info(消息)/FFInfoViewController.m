//
//  FFInfoViewController.m
//  fangfull_new
//
//  Created by Lee on 16/7/18.
//  Copyright © 2016年 zhonhong. All rights reserved.
//

#import "FFInfoViewController.h"
#import <VTMagic/VTMagic.h>
#import "UIButton+RedDot.h"

#import "FFInfomationViewController.h"
#import "FFPromoteViewController.h"
#import "FFInfoCustomerViewController.h"

@interface FFInfoViewController ()<VTMagicViewDelegate,VTMagicViewDataSource>

@property (nonatomic, strong) VTMagicController *magicController;

@end

@implementation FFInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildViewController:self.magicController];
    [self.view addSubview:_magicController.view];
    [_magicController didMoveToParentViewController:self];
    [self addInfoViewControllerSubViewContraints];
    [_magicController.magicView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark --contraints
- (void)addInfoViewControllerSubViewContraints
{
    [self.magicController.magicView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}


#pragma mark --properties


- (VTMagicController *)magicController {
    if (!_magicController) {
        _magicController = [[VTMagicController alloc] init];
        _magicController.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _magicController.magicView.navigationColor = [UIColor whiteColor];
        _magicController.magicView.sliderColor = [UIColor colorWithRed:0.0 green:148.0/255.0 blue:124.0/255.0 alpha:1.0];
        _magicController.magicView.switchStyle = VTSwitchStyleDefault;
        _magicController.magicView.layoutStyle = VTLayoutStyleDivide;
        _magicController.magicView.itemSpacing = 20;
        _magicController.magicView.navigationHeight = 40.f;
        _magicController.magicView.againstStatusBar = NO;
        _magicController.magicView.dataSource = self;
        _magicController.magicView.delegate = self;
    }
    return _magicController;
}


#pragma mark --VTMagicViewDataSource
/**
 *  获取所有分类名，数组中存放字符串类型对象
 *
 *  @param magicView self
 *
 *  @return header数组
 */
#define FangFull_Infovc_MenuTitle_Info NSLocalizedStringFromTable(@"FangFull_Infovc_MenuTitle_Info", @"FFInfoViewController", @"menu_title_info")
#define FangFull_Infovc_MenuTitle_Prom NSLocalizedStringFromTable(@"FangFull_Infovc_MenuTitle_Prom", @"FFInfoViewController", @"menu_title_prom")
#define FangFull_Infovc_MenuTitle_Customer NSLocalizedStringFromTable(@"FangFull_Infovc_MenuTitle_Customer", @"FFInfoViewController", @"menu_title_customer")


- (NSArray<__kindof NSString *> *)menuTitlesForMagicView:(VTMagicView *)magicView
{
    return @[FangFull_Infovc_MenuTitle_Info,FangFull_Infovc_MenuTitle_Prom,FangFull_Infovc_MenuTitle_Customer];
}

/**
 *  根据index获取对应索引的menuItem
 *
 *  @param magicView self
 *  @param index     当前索引
 *
 *  @return 当前索引对应的按钮
 */
- (UIButton *)magicView:(VTMagicView *)magicView menuItemAtIndex:(NSUInteger)itemIndex
{
    static NSString *itemIdentifier = @"itemIdentifier";
    UIButton *menuItem = [magicView dequeueReusableItemWithIdentifier:itemIdentifier];
    if (!menuItem) {
        menuItem = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuItem setTitleColor:RGBCOLOR(50, 50, 50) forState:UIControlStateNormal];
//        [menuItem setTitleColor:ZHNavigationBarColor forState:UIControlStateSelected];
        menuItem.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:16.f];
        menuItem.show = YES;
        menuItem.showSeparatorLine = YES;
    }
    if (itemIndex == 0) {
        menuItem.show = NO;
    }
    if (itemIndex == 2) {
        menuItem.showSeparatorLine = NO;
    }
    return menuItem;
}

/**
 *  当前索引对应的控制器
 *
 *  @param magicView self
 *  @param index     当前索引
 *
 *  @return 控制器
 */
- (UIViewController *)magicView:(VTMagicView *)magicView viewControllerAtPage:(NSUInteger)pageIndex
{
    if (pageIndex == 0 ) {
        static NSString *viewControllerID = @"info_information_id";
        FFInfomationViewController *viewController = (FFInfomationViewController *)[magicView dequeueReusableItemWithIdentifier:viewControllerID];
        if (!viewController) {
            viewController = [[FFInfomationViewController alloc] init];
        }
        return viewController;
    }
    else if (pageIndex == 1)
    {
        static NSString *viewControllerID = @"info_promote_id";
        FFPromoteViewController *viewController = (FFPromoteViewController *)[magicView dequeueReusableItemWithIdentifier:viewControllerID];
        if (!viewController) {
            viewController = [[FFPromoteViewController alloc] init];
        }
        return viewController;
    }
    else if (pageIndex == 2)
    {
        static NSString *viewControllerID = @"info_customer_id";
        FFInfoCustomerViewController *viewController = (FFInfoCustomerViewController * )[magicView dequeueReusableItemWithIdentifier:viewControllerID];
        if (!viewController) {
            viewController = [[FFInfoCustomerViewController alloc] init];
        }
        return viewController;
    }
    static NSString *gridId = @"info_other_id";
    UIViewController *viewController = [magicView dequeueReusablePageWithIdentifier:gridId];
    if (!viewController) {
        viewController = [[UIViewController alloc] init];
        viewController.view.backgroundColor = [UIColor whiteColor];
    }
    return viewController;
}


@end
