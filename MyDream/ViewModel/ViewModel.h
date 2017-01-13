//
//  ViewModel.h
//  MyDream
//
//  Created by JingXueLong on 2017/1/4.
//  Copyright © 2017年 jingxuelong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SingleModel.h"

@interface ViewModel : NSObject

@property (strong, nonatomic) NSMutableArray <SingleModel*>*dataArray;

@property (strong, nonatomic) NSString *title;

@property (strong, nonatomic) NSString *timeStr;

@property (assign, nonatomic) double threeDaytotal;

@property (assign, nonatomic) double fiveDaytotal;

@property (assign, nonatomic) double sevenDaytotal;

@property (assign, nonatomic) double tenDaytotal;

@property (assign, nonatomic) double fifteenDaytotal;

@property (assign, nonatomic) double twentyDaytotal;

@property (assign, nonatomic) double allDaytotal;


@end
