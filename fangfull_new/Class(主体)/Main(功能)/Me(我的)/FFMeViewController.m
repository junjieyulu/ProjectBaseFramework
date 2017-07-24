//
//  FFMeViewController.m
//  fangfull_new
//
//  Created by Lee on 16/7/18.
//  Copyright © 2016年 zhonhong. All rights reserved.
//

#import "FFMeViewController.h"
#import "FFMeTableViewCell.h"
#import "FFMeViewModel.h"
#import "FFMeModel.h"
#import "FFUser.h"
#import "FFLoginViewController.h"

@interface FFMeViewController ()<UITableViewDelegate, UITableViewDataSource, LoginViewControllerProtocol>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSDictionary *dictionary;
@property (nonatomic, strong) NSMutableArray *listDataArr;

@end

@implementation FFMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self addMeViewControllerSubviewContraints];
    self.tableView.estimatedRowHeight = 44.0f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    [self updateUI];
}

- (void)updateUI
{
    FFUser *user = [[FFUser sharedFFUser] loadUserData];
    if (user.status == 1) {
        self.dictionary = [FFMeViewModel tableViewDataWithUser:user];
    }
    else{
        self.dictionary = [FFMeViewModel defaultData];
    }
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark --Contraints
- (void)addMeViewControllerSubviewContraints
{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}


#pragma mark --Properties


- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (NSMutableArray *)listDataArr
{
    if (!_listDataArr) {
        _listDataArr = [[NSMutableArray alloc] init];
    }
    return _listDataArr;
}


#pragma mark --UITableViewDataSource


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[self.dictionary allKeys] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[self.dictionary objectForKey:[NSString stringWithFormat:@"%ld",(long)section]] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        static NSString *headCellId = @"me_headCell";
        FFMeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:headCellId];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"FFMeTableViewCell" owner:self options:nil] objectAtIndex:0];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        return cell;
    }
    else if (indexPath.section == 1)
    {
        static NSString *headCellId = @"me_secondCell";
        FFMeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:headCellId];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"FFMeTableViewCell" owner:self options:nil] objectAtIndex:1];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        return cell;
    }
    static NSString *identifier = @"mineCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    id dicObj = [self.dictionary objectForKey:[NSString stringWithFormat:@"%ld",(long)indexPath.section]];
    if ([dicObj isKindOfClass:[NSArray class]]) {
        NSArray *sectionArr = (NSArray *)dicObj;
        id arrObj = [sectionArr objectAtIndex:indexPath.row];
        if ([arrObj isKindOfClass:[FFMeModel class]]) {
            FFMeModel *rowModel = (FFMeModel *)arrObj;
            cell.textLabel.text = rowModel.nameStr;
        }
    }
    return cell;
}


#pragma mark --UITableViewDelegate

#define Mevc_HeadCell_Login NSLocalizedStringFromTable(@"Mevc_HeadCell_Login", @"FFMeViewController", @"mevc_headCell_login")

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        FFLoginViewController *loginvc = [[FFLoginViewController alloc] init];
        loginvc.hidesBottomBarWhenPushed = YES;
        loginvc.title = Mevc_HeadCell_Login;
        loginvc.delegate = self;
        [self.navigationController pushViewController:loginvc animated:YES];
    }
}

- (void)loginSuccess:(FFUser *)user
{
    [self updateUI];
}


@end
