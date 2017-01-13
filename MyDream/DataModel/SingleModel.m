//
//  SingleModel.m
//  MyDream
//
//  Created by 荆学龙 on 17/1/3.
//  Copyright © 2017年 jingxuelong. All rights reserved.
//

#import "SingleModel.h"

@implementation SingleModel

- (instancetype)initWithMainMoney:(double)mainMoney andName:(NSString *)name{
    if (self = [super init]) {
        self.date = [NSDate date];
        self.mainMoney = mainMoney;
        self.name = name;
    }
    return self;
}


- (NSString *)description{
    return [NSString stringWithFormat:@"%lf--%@--%@", self.mainMoney, self.name, self.date];
}
@end
