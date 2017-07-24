//
//  InfoTableViewCell.m
//  ZhongHongRealEstate
//
//  Created by Lee on 16/6/16.
//  Copyright © 2016年 crab. All rights reserved.
//

#import "InfoTableViewCell.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"

static CGFloat redDotWidth =  10.0f;

@interface InfoTableViewCell ()

@property (nonatomic, strong)UILabel        *timeLabel;
@property (nonatomic, strong)UIView         *backView;
@property (nonatomic, strong)UIImageView    *picImageView;
@property (nonatomic, strong)UILabel        *titleLabel;
@property (nonatomic, strong)UILabel        *subTitleLabel;
@property (nonatomic, strong)UIView         *separatorLine;
@property (nonatomic, strong)UILabel        *readAllLabel;
@property (nonatomic, strong)UIImageView    *arrowImageView;
@property (nonatomic, strong)UIButton       *cellClearBtn;
@property (nonatomic, strong)UIButton       *readClearBtn;
@property (nonatomic, strong)UIView         *redDotView;

@end


@implementation InfoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.timeLabel];
        [self.contentView addSubview:self.backView];
        [self.backView addSubview:self.titleLabel];
        [self.backView addSubview:self.picImageView];
        [self.backView addSubview:self.subTitleLabel];
        [self.backView addSubview:self.separatorLine];
        [self.backView addSubview:self.readAllLabel];
        [self.backView addSubview:self.arrowImageView];
        [self.backView addSubview:self.redDotView];
        [self.contentView addSubview:self.cellClearBtn];
        [self.contentView addSubview:self.readClearBtn];
        
        [self addSubviewsConstraints];
    }
    return self;
}

- (void)addSubviewsConstraints{
    __weak typeof(self) weakSelf = self;
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(5);
        make.height.mas_equalTo(14);
    }];
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.equalTo(weakSelf.timeLabel.mas_bottom).with.offset(5);
        make.bottom.mas_equalTo(-1);
    }];
    
    [self.picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.picImageView.mas_bottom).with.offset(5);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10).priorityLow();
    }];
    [self.redDotView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.titleLabel.mas_right).priorityHigh();
        make.top.equalTo(weakSelf.titleLabel.mas_top).with.offset(-3);
        make.width.height.mas_equalTo(10);
    }];
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.titleLabel.mas_bottom).with.offset(5);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(12);
    }];
    
    [self.separatorLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.equalTo(weakSelf.subTitleLabel.mas_bottom).with.offset(7);
        make.height.mas_equalTo(1);
    }];
    
    [self.readAllLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.equalTo(weakSelf.arrowImageView.mas_right).with.offset(5);
        make.top.equalTo(weakSelf.separatorLine.mas_bottom).with.offset(9);
        make.bottom.mas_equalTo(-10);
        make.height.mas_equalTo(14);
    }];
    
    [self.arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.top.equalTo(weakSelf.separatorLine.mas_bottom).with.offset(9);
        make.bottom.mas_equalTo(-10);
        make.width.mas_equalTo(14);
        make.height.mas_equalTo(14);
    }];
    
    [self.cellClearBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.backView.mas_right);
        make.top.equalTo(weakSelf.backView.mas_top);
        make.bottom.equalTo(weakSelf.backView.mas_bottom);
        make.left.equalTo(weakSelf.backView.mas_left);
    }];
    
    [self.readClearBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20);
        make.top.equalTo(weakSelf.separatorLine.mas_bottom).with.offset(3);
        make.bottom.equalTo(weakSelf.backView.mas_bottom).with.offset(-3);
        make.left.mas_equalTo(20);
    }];
    
    [self.titleLabel setContentHuggingPriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    [self.titleLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    [self.redDotView setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [self.redDotView setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    
}

- (UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.textColor = [UIColor colorWithHexString:@"#666666"];
        _timeLabel.text = @"11:20";
        _timeLabel.textAlignment = NSTextAlignmentCenter;
        _timeLabel.font = [UIFont systemFontOfSize:10.0f];
    }
    return _timeLabel;
}

- (UIView *)backView{
    if (!_backView) {
        _backView = [[UIView alloc] init];
        _backView.backgroundColor = [UIColor whiteColor];
    }
    return _backView;
}

- (UIImageView *)picImageView{
    if (!_picImageView) {
        _picImageView = [[UIImageView alloc] init];
        _picImageView.image = nil;

    }
    return _picImageView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"推广标题";
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.textColor = [UIColor colorWithHexString:@"#323232"];
        _titleLabel.font = [UIFont systemFontOfSize:15.0f];
    }
    return _titleLabel;
}

- (UILabel *)subTitleLabel{
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc] init];
        _subTitleLabel.textColor = [UIColor colorWithHexString:@"#969696"];
        _subTitleLabel.text = @"副标题或简单的内容简介";
        _subTitleLabel.font = [UIFont systemFontOfSize:12.0];    }
    return _subTitleLabel;
}

- (UIView *)separatorLine{
    if (!_separatorLine) {
        _separatorLine = [[UIView alloc] init];
        _separatorLine.backgroundColor = [UIColor colorWithHexString:@"#d4d4d4"];
    }
    return _separatorLine;
}

- (UILabel *)readAllLabel{
    if (!_readAllLabel) {
        _readAllLabel = [[UILabel alloc] init];
        _readAllLabel.text = @"阅读全文";
        _readAllLabel.textColor = [UIColor colorWithHexString:@"#969696"];
        _readAllLabel.font = [UIFont systemFontOfSize:12.0];
    }
    return _readAllLabel;
}

- (UIImageView *)arrowImageView
{
    if (!_arrowImageView) {
        _arrowImageView = [[UIImageView alloc] init];
        _arrowImageView.image = [UIImage imageNamed:@"arrowImageView"];
        _arrowImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _arrowImageView;
}

- (UIButton *)cellClearBtn{
    if (!_cellClearBtn) {
        _cellClearBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _cellClearBtn.tag = self.tag;
        UIImage *image = [[UIImage imageNamed:@"grayColorImage"] stretchableImageWithLeftCapWidth:10 topCapHeight:10];
        [_cellClearBtn setBackgroundImage:nil forState:UIControlStateNormal];
        [_cellClearBtn setBackgroundImage:image forState:UIControlStateHighlighted];
        [_cellClearBtn addTarget:self action:@selector(cellClearBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cellClearBtn;
}

- (UIButton *)readClearBtn{
    if (!_readClearBtn) {
        _readClearBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _readClearBtn.tag = self.tag;
        UIImage *image = [[UIImage imageNamed:@"grayColorImage"] stretchableImageWithLeftCapWidth:10 topCapHeight:10];
        [_readClearBtn setBackgroundImage:nil forState:UIControlStateNormal];
        [_readClearBtn setBackgroundImage:image forState:UIControlStateHighlighted];
        [_readClearBtn addTarget:self action:@selector(readClearBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _readClearBtn;
}

- (UIView *)redDotView
{
    if (!_redDotView) {
        _redDotView = [[UIView alloc] init];
        _redDotView.backgroundColor = [UIColor colorWithHexString:@"#dc2827"];
        _redDotView.layer.masksToBounds = YES;
        _redDotView.layer.cornerRadius = redDotWidth/2;
    }
    return _redDotView;
}


- (void)cellClearBtnClick:(UIButton *)btn
{
    if (_selcetedCell)_selcetedCell(self.tag);
}

- (void)readClearBtnClick:(UIButton *)btn
{
    if (_selcetedCellReadBtn)_selcetedCellReadBtn(self.tag);
}

- (void)reloadCellWithPromotionModel:(PromotionModel *)model{
    _timeLabel.text = model.showTime;
    _titleLabel.text = model.titleStr;
    _redDotView.hidden = model.readedBool?YES:NO;
    if (!model.picStr || [model.picStr isEqualToString:@""]) {
        _picImageView.image = nil;
        [self.picImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0);
        }];
        [self.picImageView setNeedsUpdateConstraints];
    }
    else {
        [self.picImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(150 * SYSTEM_SCREEN_WIDTH /320);
        }];
        [self.picImageView setNeedsUpdateConstraints];
        NSString *strPath = [[NSBundle mainBundle] pathForResource:@"images_house" ofType:@".jpg"];
        UIImage *img = [UIImage imageWithContentsOfFile:strPath];
        [_picImageView sd_setImageWithURL:[NSURL URLWithString:model.picStr] placeholderImage:img];
    }
    _subTitleLabel.text = model.subTitleStr;
}

@end
