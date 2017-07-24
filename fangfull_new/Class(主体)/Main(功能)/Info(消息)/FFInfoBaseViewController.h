//
//  FFInfoBaseViewController.h
//  fangfull_new
//
//  Created by Lee on 16/8/4.
//  Copyright © 2016年 zhonhong. All rights reserved.
//

#import "FFBaseViewController.h"

@interface FFInfoBaseViewController : FFBaseViewController
{
    NSInteger _page;
    NSInteger _pageSize;
    NSInteger _totalCount;
}
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArr;
@end
