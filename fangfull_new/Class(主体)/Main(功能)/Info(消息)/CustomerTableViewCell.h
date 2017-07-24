//
//  CustomerTableViewCell.h
//  ZhongHongRealEstate
//
//  Created by Lee on 16/6/16.
//  Copyright © 2016年 crab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "INCustomerModel.h"
@interface CustomerTableViewCell : UITableViewCell

- (void)reloadCellWithModel:(INCustomerModel *)model;


@end
