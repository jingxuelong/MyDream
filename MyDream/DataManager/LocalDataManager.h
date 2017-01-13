//
//  LocalDataManager.h
//  MyDream
//
//  Created by 荆学龙 on 17/1/3.
//  Copyright © 2017年 jingxuelong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AutoCoding.h>
#import "SingleModel.h"

@interface LocalDataManager : NSObject

//@property (strong, nonatomic) NSMutableDictionary *totleDic;

@property (strong, nonatomic) NSMutableArray *totleArr;

+ (instancetype)shareManager;

- (void)saveData; 


@end
