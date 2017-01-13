//
//  AAA.h
//  MyDream
//
//  Created by 荆学龙 on 17/1/7.
//  Copyright © 2017年 jingxuelong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AAA : NSObject

@property (copy, nonatomic)  void(^abc)(NSString*);


+ (instancetype)shareAAA;

- (void)aaa:(void(^)(void))abc;

@end
