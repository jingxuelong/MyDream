//
//  SingleModel.h
//  MyDream
//
//  Created by 荆学龙 on 17/1/3.
//  Copyright © 2017年 jingxuelong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingleModel : NSObject

@property (strong, nonatomic) NSDate *date;

@property (assign, nonatomic) double mainMoney;

@property (strong, nonatomic) NSString *name; 


- (instancetype)initWithMainMoney:(double)mainMoney andName:(NSString*)name;

@end
