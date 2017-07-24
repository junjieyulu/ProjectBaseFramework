//
//  FFHomeDetailViewController.m
//  fangfull_new
//
//  Created by Lee on 16/7/28.
//  Copyright © 2016年 zhonhong. All rights reserved.
//

#import "FFHomeDetailViewController.h"
#import "FFHomeDetailTableViewCell.h"
@interface FFHomeDetailViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation FFHomeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    [self addHomeDetailViewControllerSubviewContraints];
    self.tableView.estimatedRowHeight = 44.0f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.tableFooterView = [UIView new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark --Contraints
- (void)addHomeDetailViewControllerSubviewContraints
{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}


#pragma mark --Properties


- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}


#pragma mark --UITableDataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        static NSString *homeDetailHeadCellId = @"homeDetail_headCell";
        FFHomeDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:homeDetailHeadCellId];
        if (cell == nil) {
            cell = (FFHomeDetailTableViewCell *)[[[NSBundle mainBundle] loadNibNamed:@"FFHomeDetailTableViewCell" owner:self options:nil] objectAtIndex:0];
        }
        return cell;
    }
    else if (indexPath.row == 1)
    {
        static NSString *homeDetailTelCellId = @"homeDetail_telCell";
        FFHomeDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:homeDetailTelCellId];
        if (cell == nil) {
            cell = (FFHomeDetailTableViewCell *)[[[NSBundle mainBundle] loadNibNamed:@"FFHomeDetailTableViewCell" owner:self options:nil] objectAtIndex:1];
        }
        return cell;
    }
    else if (indexPath.row == 4)
    {
        static NSString *homeDetailPhotoCellId = @"homeDetail_photoCell";
        FFHomeDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:homeDetailPhotoCellId];
        if (cell == nil) {
            cell = (FFHomeDetailTableViewCell *)[[[NSBundle mainBundle] loadNibNamed:@"FFHomeDetailTableViewCell" owner:self options:nil] objectAtIndex:3];
        }
        return cell;
    }
    else
    {
        static NSString *homeDetailNormalCellId = @"homeDetail_normalCell";
        FFHomeDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:homeDetailNormalCellId];
        if (cell == nil) {
            cell = (FFHomeDetailTableViewCell *)[[[NSBundle mainBundle] loadNibNamed:@"FFHomeDetailTableViewCell" owner:self options:nil] objectAtIndex:2];
        }
        return cell;
    }
}


#pragma mark --UITableDelegate


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
