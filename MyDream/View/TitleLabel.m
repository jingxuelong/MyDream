//
//  TitleLabel.m
//  MyDream
//
//  Created by JingXueLong on 2017/1/6.
//  Copyright © 2017年 jingxuelong. All rights reserved.
//

#import "TitleLabel.h"
@interface TitleLabel ()

@property (strong, nonatomic) UILabel *titleLabel;

@property (strong, nonatomic) UILabel *numberLabel;

@end



@implementation TitleLabel


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setItems];
    }
    return self;
}

- (void)setItems{
    _titleLabel = [[UILabel alloc] init];
    [_titleLabel setTextAlignment:NSTextAlignmentRight];
    [_titleLabel setFont:[UIFont systemFontOfSize:15 weight:15]];
    [self addSubview:_titleLabel];
    
    
    _numberLabel = [[UILabel alloc] init];
    [_numberLabel setTextAlignment:NSTextAlignmentCenter];
    [_numberLabel setFont:[UIFont systemFontOfSize:19 weight:19]];
    [self addSubview:_numberLabel];
}

- (void)setTitle:(NSString *)title andNumber:(double)number{
    [self.titleLabel setText:title];
    self.numberLabel.textColor = number>0?REDCOLOR:RGB(100, 200, 100);
    NSString *numStr = nil;
    
    if (fabs(number)>10000) {
        
        numStr = [NSString stringWithFormat:@"%.1fY",number/10000];
    }else{
        
        numStr = [NSString stringWithFormat:@"%.0fW",number];
    }
    [self.numberLabel setText:numStr];
}

- (void)layoutItems{
    [_titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom);
        make.width.mas_equalTo(CGRectGetWidth(self.frame)/3);
    }];
    
    [_numberLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_right);
        make.right.equalTo(self.mas_right);
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom);
    }];
}


- (void)layoutSubviews{
    [super layoutSubviews];
    [self layoutItems];
}

@end
