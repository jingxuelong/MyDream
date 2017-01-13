//
//  LocalDataManager.m
//  MyDream
//
//  Created by 荆学龙 on 17/1/3.
//  Copyright © 2017年 jingxuelong. All rights reserved.
//

#import "LocalDataManager.h"

#define DOC_NAME    @"/newDream.archiver"
#define PATH         NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject
#define MAIN_PATH   [PATH stringByAppendingString:DOC_NAME]
@interface LocalDataManager()

@end

@implementation LocalDataManager

+ (instancetype)shareManager{
    static LocalDataManager* manager;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        BOOL  isExistFile = [[NSFileManager defaultManager] fileExistsAtPath:MAIN_PATH];
        if (isExistFile) {
            NSData *data = [NSData dataWithContentsOfFile:MAIN_PATH];
            manager = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        }else{
            manager = [[self alloc] init];
            manager.totleArr = [NSMutableArray arrayWithCapacity:0];
        }
    });
    return manager;
}


- (void)saveData{
    [self writeToFile:MAIN_PATH atomically:YES];
}

@end
