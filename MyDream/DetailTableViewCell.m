//
//  DetailTableViewCell.m
//  MyDream
//
//  Created by JingXueLong on 2017/1/5.
//  Copyright © 2017年 jingxuelong. All rights reserved.
//

#import "DetailTableViewCell.h"
@implementation DetailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self.contentView addSubview:self.twentyLabel];
        [self.contentView addSubview:self.timeLabel];
        [self.twentyLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(150, 50));
            make.left.equalTo(self.contentView.mas_left).offset(40);
        }];
        [self.timeLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(100, 50));
            make.right.equalTo(self.contentView.mas_right).offset(-15);
        }];
    }
    return self;
}



- (UILabel *)twentyLabel{
    if (_twentyLabel == nil) {
        _twentyLabel = [[UILabel alloc] init];
        [_twentyLabel setTextAlignment:0];
        [_twentyLabel setFont:[UIFont systemFontOfSize:20 weight:15]];
    }
    return _twentyLabel;
}

- (UILabel *)timeLabel{
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc] init];
        [_timeLabel setTextAlignment:2];
        [_timeLabel setTextColor:[UIColor lightGrayColor]];
//        [_timeLabel setFont:[UIFont systemFontOfSize:12]];
        _timeLabel.numberOfLines = 0;
    }
    return _timeLabel;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
