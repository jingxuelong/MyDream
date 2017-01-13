//
//  ViewModelTableViewCell.m
//  MyDream
//
//  Created by JingXueLong on 2017/1/5.
//  Copyright © 2017年 jingxuelong. All rights reserved.
//

#import "ViewModelTableViewCell.h"
#import "TitleLabel.h"

@interface ViewModelTableViewCell()

@property (strong, nonatomic) UILabel *titleLabel;

@property (strong, nonatomic) TitleLabel *totalLabel;

@property (strong, nonatomic) TitleLabel *threeLabel;

@property (strong, nonatomic) TitleLabel *fiveLabel;

@property (strong, nonatomic) TitleLabel *sevenLabel;

@property (strong, nonatomic) TitleLabel *tenLabel;

@property (strong, nonatomic) TitleLabel *fifteenLabel;

@property (strong, nonatomic) TitleLabel *twentyLabel;

@property (strong, nonatomic) UILabel *timeLabel;

@end

@implementation ViewModelTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.totalLabel];
        [self.contentView addSubview:self.threeLabel];
        [self.contentView addSubview:self.fiveLabel];
        [self.contentView addSubview:self.sevenLabel];
        [self.contentView addSubview:self.tenLabel];
        [self.contentView addSubview:self.fifteenLabel];
        [self.contentView addSubview:self.twentyLabel];
        [self.contentView addSubview:self.timeLabel];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return self;
}


- (void)layoutItems{
    
    [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.left.equalTo(self.contentView.mas_left).offset(20);
        make.size.mas_equalTo(CGSizeMake(150, 30));
    }];
    
    [self.totalLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.right.equalTo(self.contentView.mas_right).offset(-20);
        make.size.mas_equalTo(CGSizeMake(150, 30));
    }];
    
    [self.threeLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(10);
        make.left.equalTo(self.contentView.mas_left).offset(20);
        make.size.mas_equalTo(CGSizeMake(150, 30));
    }];
    
    
    [self.fiveLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(10);
        make.right.equalTo(self.contentView.mas_right).offset(-20);
        make.size.mas_equalTo(CGSizeMake(150, 30));
    }];
    
    [self.sevenLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.threeLabel.mas_bottom).offset(10);
        make.left.equalTo(self.contentView.mas_left).offset(20);
        make.size.mas_equalTo(CGSizeMake(150, 30));
    }];
    
    
    [self.tenLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.threeLabel.mas_bottom).offset(10);
        make.right.equalTo(self.contentView.mas_right).offset(-20);
        make.size.mas_equalTo(CGSizeMake(150, 30));
    }];

    [self.fifteenLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.sevenLabel.mas_bottom).offset(10);
        make.left.equalTo(self.contentView.mas_left).offset(20);
        make.size.mas_equalTo(CGSizeMake(150, 30));
    }];
    
    
    [self.twentyLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.sevenLabel.mas_bottom).offset(10);
        make.right.equalTo(self.contentView.mas_right).offset(-20);
        make.size.mas_equalTo(CGSizeMake(150, 30));
    }];
    
    [self.timeLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
        make.size.mas_equalTo(CGSizeMake(150, 15));
        make.centerX.equalTo(self.contentView.mas_centerX);
    }];
    
}
- (void)layoutSubviews{
    [super layoutSubviews];
    [self layoutItems];
}

#pragma mark- <Setters and Getters>

- (void)setModel:(ViewModel *)model{
    _model = model;
    
    [self.titleLabel setText:model.title];
    [self.threeLabel setTitle:@"3s:" andNumber:model.threeDaytotal];
    [self.fiveLabel setTitle:@"5s:" andNumber:model.fiveDaytotal];
    [self.sevenLabel setTitle:@"7s:" andNumber:model.sevenDaytotal];
    [self.tenLabel setTitle:@"10s:" andNumber:model.tenDaytotal];
    [self.fifteenLabel setTitle:@"15s:" andNumber:model.fifteenDaytotal];
    [self.twentyLabel setTitle:@"20s:" andNumber:model.twentyDaytotal];
    [self.totalLabel setTitle:@"All:" andNumber:model.allDaytotal];
    [self.timeLabel setText:[NSString stringWithFormat:@"update%@",model.timeStr]];
}



- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
//        [_titleLabel setBackgroundColor:[UIColor lightGrayColor]];
        [_titleLabel setFont:[UIFont systemFontOfSize:20 weight:22]];
    }
    return _titleLabel;
}


- (TitleLabel *)totalLabel{
    if (_totalLabel == nil) {
        _totalLabel = [[TitleLabel alloc] init];
    }
    return _totalLabel;
}

- (TitleLabel *)threeLabel{
    if (_threeLabel == nil) {
        _threeLabel = [[TitleLabel alloc] init];

    }
    return _threeLabel;
}

- (TitleLabel *)fiveLabel{
    if (_fiveLabel == nil) {
        _fiveLabel = [[TitleLabel alloc] init];

    }
    return _fiveLabel;
}

- (TitleLabel *)sevenLabel{
    if (_sevenLabel == nil) {
        _sevenLabel = [[TitleLabel alloc] init];

    }
    return _sevenLabel;
}

- (TitleLabel *)tenLabel{
    if (_tenLabel == nil) {
        _tenLabel = [[TitleLabel alloc] init];
        }
    return _tenLabel;
}

- (TitleLabel *)fifteenLabel{
    if (_fifteenLabel == nil) {
        _fifteenLabel = [[TitleLabel alloc] init];
          }
    return _fifteenLabel;
}


- (TitleLabel *)twentyLabel{
    if (_twentyLabel == nil) {
        _twentyLabel = [[TitleLabel alloc] init];
    }
    return _twentyLabel;
}

- (UILabel *)timeLabel{
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc] init];
        [_timeLabel setFont:[UIFont systemFontOfSize:13]];
        [_timeLabel setTextAlignment:NSTextAlignmentCenter];
    }
    return _timeLabel;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
