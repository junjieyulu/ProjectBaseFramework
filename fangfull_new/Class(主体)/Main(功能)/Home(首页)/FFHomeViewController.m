//
//  FFHomeViewController.m
//  fangfull_new
//
//  Created by Lee on 16/7/18.
//  Copyright © 2016年 zhonhong. All rights reserved.
//

#import "FFHomeViewController.h"
#import "FFHomeTableViewCell.h"
#import "FFHomeDetailViewController.h"

@interface FFHomeViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation FFHomeViewController

- (void)viewWillLayoutSubviews
{
    [self addHomeViewControllerSubviewContraints];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
//    [self addHomeViewControllerSubviewContraints];
    
    self.tableView.estimatedRowHeight = 96;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.tableFooterView = [UIView new];
    __weak typeof(self) weakSelf = self;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf.tableView.mj_header endRefreshing];
    }];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf.tableView.mj_footer endRefreshingWithNoMoreData];
    }];
    
    [[FFRequestManager sharedFFRequestManager] GET:@"" parameters:nil success:^(id  _Nonnull responseObject) {
        
    } failure:^(NSError * _Nonnull error) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark --SubviewContraints
- (void)addHomeViewControllerSubviewContraints
{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}


#pragma mark --Properties


- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}


#pragma mark --UITableViewDataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *homeCellId = @"homeCellId";
    FFHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:homeCellId];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"FFHomeTableViewCell" owner:self options:nil] lastObject];
    }
    return cell;
}


#pragma mark --UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    FFHomeDetailViewController *detailVC = [[FFHomeDetailViewController alloc] init];
    detailVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detailVC animated:YES];
}


@end
