//
//  ViewModel.m
//  MyDream
//
//  Created by JingXueLong on 2017/1/4.
//  Copyright © 2017年 jingxuelong. All rights reserved.
//

#import "ViewModel.h"

@implementation ViewModel

- (void)setDataArray:(NSMutableArray<SingleModel *> *)dataArray{
    _dataArray = dataArray;
    [self resetData];
    SingleModel *firstModel = dataArray.firstObject;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateStyle = kCFDateFormatterShortStyle;
    NSString *str = [formatter stringFromDate:firstModel.date];
    self.timeStr = str;
    
    self.title = dataArray.firstObject.name;
    
    [dataArray enumerateObjectsUsingBlock:^(SingleModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx<3) {
            self.threeDaytotal+=obj.mainMoney;
        }
        if (idx<5) {
            self.fiveDaytotal+=obj.mainMoney;
        }
        if (idx<7) {
            self.sevenDaytotal+=obj.mainMoney;
        }
        if (idx<10) {
            self.tenDaytotal+=obj.mainMoney;
        }
        if (idx<15) {
            self.fifteenDaytotal+=obj.mainMoney;
        }
        if (idx<20) {
            self.twentyDaytotal+=obj.mainMoney;
        }
        self.allDaytotal+=obj.mainMoney;
        
    }];
    
}

- (void)resetData{
    self.threeDaytotal = 0.0;
    self.fiveDaytotal = 0.0;
    self.sevenDaytotal = 0.0;
    self.tenDaytotal = 0.0;
    self.fifteenDaytotal = 0.0;
    self.twentyDaytotal = 0.0;
    self.allDaytotal = 0.0;
}
@end
