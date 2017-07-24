//
//  FFPromoteViewController.m
//  fangfull_new
//
//  Created by Lee on 16/8/4.
//  Copyright © 2016年 zhonhong. All rights reserved.
//

#import "FFPromoteViewController.h"
#import "InfoTableViewCell.h"

@interface FFPromoteViewController ()

@end

@implementation FFPromoteViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark --RequestData


- (void)requestData
{
    NSDictionary *parameters = @{
                                 @"session_id":@"",
                                 @"type":[NSString stringWithFormat:@"%d",INTypeProm],
                                 @"page":[NSString stringWithFormat:@"%ld",(long)_page],
                                 @"pageSize":[NSString stringWithFormat:@"%ld",(long)_pageSize]
                                 };
    [[FFRequestManager sharedFFRequestManager] POST:kMODULE_Get_BrokerMessageList parameters:parameters success:^(id  _Nonnull responseObject) {
        
        [self.tableView.mj_header endRefreshing];
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            id total = [responseObject objectForKey:@"total"];
            if ([total isKindOfClass:[NSNumber class]]||[total isKindOfClass:[NSString class]]) {
                NSInteger totalInt = [total integerValue];
                _totalCount = totalInt;
                if (_totalCount == 0) {
                    [self.tableView.mj_footer endRefreshingWithNoMoreData];
                    //显示没有数据
                    return;
                }
            }
            id promotion = [responseObject objectForKey:@"promotion"];
            if ([promotion isKindOfClass:[NSArray class]]) {
                if (1 == _page) {
                    [self.dataArr removeAllObjects];
                }
                for (int i = 0; i < [promotion count]; i++) {
                    id promotionDic = [promotion objectAtIndex:i];
                    if ([promotionDic isKindOfClass:[NSDictionary class]]) {
                        PromotionModel *model = [PromotionModel mj_objectWithKeyValues:promotionDic];
                        [self.dataArr addObject:model];
                    }
                }
                _page++;
                [self.tableView reloadData];
            }
            if (_totalCount > _pageSize && _totalCount > self.dataArr.count)
            {
                __weak typeof(self) weakSelf = self;
                self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
                    if (_totalCount == weakSelf.dataArr.count) {
                        [weakSelf.tableView.mj_footer endRefreshingWithNoMoreData];
                        return;
                    }
                    [weakSelf requestData];
                }];

            }
            else [self.tableView.mj_footer removeFromSuperview];
        }
        else [self.tableView.mj_footer endRefreshing];

    } failure:^(NSError * _Nonnull error) {
        
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];

    }];

}


#pragma mark --Contraints


- (void)addPromoteViewControllerSubviewContraints
{
}


#pragma mark -- properties



#pragma mark --UITableViewDelegate



#pragma mark --UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"contentTableCell";
    InfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[InfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.tag = indexPath.row;
    id object = [self.dataArr objectAtIndex:indexPath.row];
    if ([object isKindOfClass:[PromotionModel class]]) {
        [cell reloadCellWithPromotionModel:[self.dataArr objectAtIndex:indexPath.row]];
    }
    __weak typeof(self) weakSelf = self;
    cell.selcetedCell = ^(NSInteger selectedTag) {
        [weakSelf didSelectedTableViewCell:indexPath];
    };
    cell.selcetedCellReadBtn = ^(NSInteger selectedTag) {
        [weakSelf didSelectedTableViewCell:indexPath];
    };
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

- (void)didSelectedTableViewCell:(NSIndexPath *)indexPath
{
    
}


//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    id object = [self.dataArr objectAtIndex:indexPath.row];
//    if ([object isKindOfClass:[PromotionModel class]]) {
//        PromotionModel *model = (PromotionModel *) object;
//        if ([model.picStr isEqualToString:@""] || model.picStr == nil) {
//            return 102 + 1;
//        } else
//            return 102 + 150.0 + 1;
//    }
//    return 0.0f;
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


@end
