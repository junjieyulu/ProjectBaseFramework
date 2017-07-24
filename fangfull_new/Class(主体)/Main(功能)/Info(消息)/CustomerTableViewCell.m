//
//  CustomerTableViewCell.m
//  ZhongHongRealEstate
//
//  Created by Lee on 16/6/16.
//  Copyright © 2016年 crab. All rights reserved.
//

#import "CustomerTableViewCell.h"
@interface CustomerTableViewCell ()

@property (nonatomic, strong) UIButton *headBtn;
@property (nonatomic, strong) UIImageView *badgeImgV;
@property (nonatomic, strong) UILabel  *badgeLabel;
@property (nonatomic, strong) UILabel  *contentLabel;
@property (nonatomic, strong) UILabel  *timeLabel;
@property (nonatomic, strong) UILabel  *titleLabel;
@property (nonatomic, strong) UIView   *separatorlineView;

@end

@implementation CustomerTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.headBtn];
        [self.contentView addSubview:self.badgeImgV];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.timeLabel];
        [self.contentView addSubview:self.contentLabel];
        [self.contentView addSubview:self.separatorlineView];
        
        [self addSubviewsConstraints];
    }
    return self;
}

- (void)addSubviewsConstraints{
    
    __weak typeof(self) weakSelf = self;
    [self.headBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(10);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(50);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.equalTo(weakSelf.headBtn.mas_right).with.offset(10);
        make.right.equalTo(weakSelf.timeLabel.mas_left).with.offset(-10);
        make.height.mas_equalTo(15);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(15);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.headBtn.mas_right).with.offset(10);
        make.top.equalTo(weakSelf.timeLabel.mas_bottom).with.offset(5);
//        make.bottom.mas_equalTo(weakSelf.separatorlineView.mas_top).with.offset(-9);
        make.right.mas_equalTo(-10);
        make.bottom.mas_equalTo(-10);

    }];

    [self.badgeImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.headBtn.mas_right).with.offset(4);
        make.top.equalTo(weakSelf.headBtn.mas_top).with.offset(-4);
        make.width.mas_equalTo(10);
        make.height.mas_equalTo(10);
    }];
    
    [self.separatorlineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
        make.bottom.mas_equalTo(0);
    }];
    
}

- (UIButton *)headBtn{
    if (!_headBtn) {
        _headBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_headBtn setImage:[UIImage imageNamed:@"head_man"] forState:UIControlStateNormal];
        _headBtn.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _headBtn;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"客户新动态的名称";
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.textColor  = [UIColor colorWithHexString:@"#323232"];
        _titleLabel.font = [UIFont systemFontOfSize:15.0f];
    }
    return _titleLabel;
}

- (UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.text = @"10:30";
        _timeLabel.textAlignment = NSTextAlignmentRight;
        _timeLabel.textColor = [UIColor colorWithHexString:@"#969696"];
        _timeLabel.font = [UIFont systemFontOfSize:11.0f];
    }
    return _timeLabel;
}

- (UILabel *)contentLabel
{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.textColor = [UIColor colorWithHexString:@"#969696"];
        _contentLabel.text = @"客户信息，动态内容（一行显示）";
        _contentLabel.textAlignment = NSTextAlignmentLeft;
        _contentLabel.font = [UIFont systemFontOfSize:11.0f];
    }
    return _contentLabel;
}

- (UIImageView *)badgeImgV{
    if (!_badgeImgV) {
        _badgeImgV = [[UIImageView alloc] init];
        _badgeImgV.image = [[UIImage imageNamed:@"red_msg"] stretchableImageWithLeftCapWidth:5 topCapHeight:5];
        _badgeImgV.contentMode = UIViewContentModeScaleAspectFit;
        _badgeLabel.layer.masksToBounds = YES;
        _badgeLabel.layer.cornerRadius = 5.0f;
    }
    return _badgeImgV;
}

- (UIView *)separatorlineView{
    if (!_separatorlineView) {
        _separatorlineView = [[UIView alloc] init];
        _separatorlineView.backgroundColor = [UIColor colorWithHexString:@"#d4d4d4"];
    }
    return _separatorlineView;
}

- (void)reloadCellWithModel:(INCustomerModel *)model{
    self.titleLabel.text = model.titleStr;
    self.contentLabel.text = model.content;
    self.timeLabel.text = model.showTime;
    [self.headBtn setImage:[UIImage imageNamed:model.headStr] forState:UIControlStateNormal];
    self.badgeImgV.hidden = model.readedBool?YES:NO;
}

@end
