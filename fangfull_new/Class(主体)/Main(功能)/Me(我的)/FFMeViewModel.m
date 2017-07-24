//
//  FFMeViewModel.m
//  fangfull_new
//
//  Created by Lee on 16/7/28.
//  Copyright © 2016年 zhonhong. All rights reserved.
//

#import "FFMeViewModel.h"
#import "FFMeModel.h"
#import "FFUser.h"

@implementation FFMeViewModel

#define Mevc_NormalCell_FeedBackName NSLocalizedStringFromTable(@"Mevc_NormalCell_FeedBackName", @"FFMeViewModel", @"me_feedback_name")
#define Mevc_NormalCell_ClearChacheName NSLocalizedStringFromTable(@"Mevc_NormalCell_ClearChacheName", @"FFMeViewModel", @"me_clearChache_name")
#define Mevc_NormalCell_ChangedPasswordName NSLocalizedStringFromTable(@"Mevc_NormalCell_ChangedPasswordName", @"FFMeViewModel", @"me_changedpassword_name")

#define Mevc_SecondCell_MyPerformance NSLocalizedStringFromTable(@"Mevc_SecondCell_MyPerformance", @"FFMeViewModel", @"me_secondCell_myPerformance")
#define Mevc_FourthCell_Logout NSLocalizedStringFromTable(@"Mevc_FourthCell_Logout", @"FFMeViewModel", @"me_fourthCell_logout")


+ (NSMutableDictionary *)defaultData
{
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    NSMutableArray *headArr = [NSMutableArray array];
    NSInteger section = 0;
    FFMeModel *headModel = [[FFMeModel alloc] initWithName:@"未登录" img:nil content:@"点此登录"];
    headModel.descriptionStr = @"仅限房产经纪人登录";
    [headArr addObject:headModel];
    [dictionary setObject:headArr forKey:[NSString stringWithFormat:@"%ld",(long)section]];
    section++;
    
    NSMutableArray *secondArr = [NSMutableArray array];
    FFMeModel *conllectionModel = [[FFMeModel alloc] initWithName:@"我的收藏" img:@"me_cell_collection" content:nil];
    [secondArr addObject:conllectionModel];
    [dictionary setObject:secondArr forKey:[NSString stringWithFormat:@"%ld",(long)section]];
    section++;
    
    NSMutableArray *thirdArr = [NSMutableArray array];
    FFMeModel *feedBackModel = [[FFMeModel alloc] initWithName:Mevc_NormalCell_FeedBackName];
    [thirdArr addObject:feedBackModel];
    FFMeModel *clearModel = [[FFMeModel alloc] initWithName:Mevc_NormalCell_ClearChacheName];
    [thirdArr addObject:clearModel];
    [dictionary setObject:thirdArr forKey:[NSString stringWithFormat:@"%ld",(long)section]];
    return dictionary;
}

+ (NSMutableDictionary *)tableViewDataWithUser:(FFUser *)ffuser
{
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    NSMutableArray *headArr = [NSMutableArray array];
    NSInteger section = 0;
    FFMeModel *headModel = [[FFMeModel alloc] initWithName:ffuser.userName img:ffuser.brokerPhotoName content:ffuser.company];
    [headArr addObject:headModel];
    [dictionary setObject:headArr forKey:[NSString stringWithFormat:@"%ld",(long)section]];
    section++;
    
    NSMutableArray *secondArr = [NSMutableArray array];
    FFMeModel *performanceModel = [[FFMeModel alloc] initWithName:Mevc_SecondCell_MyPerformance img:@"me_cell_performance" content:[NSString stringWithFormat:@"%d个收藏",10]];
    [secondArr addObject:performanceModel];
    
    FFMeModel *conllectionModel = [[FFMeModel alloc] initWithName:@"我的收藏" img:@"me_cell_collection" content:[NSString stringWithFormat:@"总销售额%ld万",(long)ffuser.dividendValue]];
    [secondArr addObject:conllectionModel];
    [dictionary setObject:secondArr forKey:[NSString stringWithFormat:@"%ld",(long)section]];
    section++;
    
    NSMutableArray *thirdArr = [NSMutableArray array];
    FFMeModel *feedBackModel = [[FFMeModel alloc] initWithName:Mevc_NormalCell_FeedBackName];
    [thirdArr addObject:feedBackModel];
    FFMeModel *clearModel = [[FFMeModel alloc] initWithName:Mevc_NormalCell_ClearChacheName];
    [thirdArr addObject:clearModel];
    FFMeModel *changedPasswordModel = [[FFMeModel alloc] initWithName:Mevc_NormalCell_ChangedPasswordName];
    [thirdArr addObject:changedPasswordModel];
    [dictionary setObject:thirdArr forKey:[NSString stringWithFormat:@"%ld",(long)section]];
    section++;
    
    NSMutableArray *fourthArr = [NSMutableArray array];
    FFMeModel *logoutModel = [[FFMeModel alloc] initWithName:Mevc_NormalCell_FeedBackName];
    [fourthArr addObject:logoutModel];
    [dictionary setObject:fourthArr forKey:[NSString stringWithFormat:@"%ld",(long)section]];

    return dictionary;
}


@end
