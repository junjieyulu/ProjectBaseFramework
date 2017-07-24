//
//  FFInfoBaseViewController.m
//  fangfull_new
//
//  Created by Lee on 16/8/4.
//  Copyright © 2016年 zhonhong. All rights reserved.
//

#import "FFInfoBaseViewController.h"

@interface FFInfoBaseViewController ()<UITableViewDelegate , UITableViewDataSource>

@end

@implementation FFInfoBaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _page = 1;
    _pageSize = 10;
    _totalCount = 0;
    
    [self.view addSubview:self.tableView];
    [self addInfoBaseViewControllerSubviewContraints];
    
    self.tableView.estimatedRowHeight = 44.0f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.tableFooterView = [UIView new];
    
    __weak typeof(self) weakSelf = self;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        _page = 1;
        [weakSelf requestData];
    }];
}

#pragma mark --requestData


- (void)requestData{}


#pragma mark --Contraints


- (void)addInfoBaseViewControllerSubviewContraints
{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}


#pragma mark -- properties


- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (NSMutableArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [[NSMutableArray alloc] init];
    }
    return _dataArr;
}

#pragma mark --UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {}

#pragma mark --UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {return nil;}

@end
