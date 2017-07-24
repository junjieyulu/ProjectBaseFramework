//
//  InfoTableViewCell.h
//  ZhongHongRealEstate
//
//  Created by Lee on 16/6/16.
//  Copyright © 2016年 crab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PromotionModel.h"

//使用block语块代替delegate回调。省的引入协议和写delegate方法
typedef void (^selectedCell_t)(NSInteger selectedTag);
typedef void (^selectedCell_readBtn)(NSInteger selectedTag);

@interface InfoTableViewCell : UITableViewCell

@property (nonatomic, copy) selectedCell_t selcetedCell;
@property (nonatomic, copy) selectedCell_readBtn selcetedCellReadBtn;

- (void)reloadCellWithPromotionModel:(PromotionModel *)model;

@end
