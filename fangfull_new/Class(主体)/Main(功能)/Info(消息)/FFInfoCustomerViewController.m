//
//  FFInfoCustomerViewController.m
//  fangfull_new
//
//  Created by Lee on 16/8/4.
//  Copyright © 2016年 zhonhong. All rights reserved.
//

#import "FFInfoCustomerViewController.h"
#import "INCustomerModel.h"
#import "CustomerTableViewCell.h"

@implementation FFInfoCustomerViewController


- (void)requestData
{
    NSDictionary *parameters = @{
                                 @"session_id":@"",
                                 @"type":[NSString stringWithFormat:@"%d",INTypeCustomer],
                                 @"page":[NSString stringWithFormat:@"%ld",(long)_page],
                                 @"pageSize":[NSString stringWithFormat:@"%ld",(long)_pageSize]
                                 };
    
    NSLog(@"page is:%ld",(long)_page);
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
            id promotion = [responseObject objectForKey:@"customer"];
            if ([promotion isKindOfClass:[NSArray class]]) {
                if (1 == _page) {
                    [self.dataArr removeAllObjects];
                }
                for (int i = 0; i < [promotion count]; i++) {
                    id promotionDic = [promotion objectAtIndex:i];
                    if ([promotionDic isKindOfClass:[NSDictionary class]]) {
                        INCustomerModel *model = [INCustomerModel mj_objectWithKeyValues:promotionDic];
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
        _page++;
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"customerTableViewCell";
    CustomerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[CustomerTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    id rowObj = [self.dataArr objectAtIndex:indexPath.row];
    if ([rowObj isKindOfClass:[INCustomerModel class]]) {
        INCustomerModel *model = (INCustomerModel *)rowObj;
        [cell reloadCellWithModel:model];
    }
    return cell;
}

@end
