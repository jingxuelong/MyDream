//
//  AAA.m
//  MyDream
//
//  Created by 荆学龙 on 17/1/7.
//  Copyright © 2017年 jingxuelong. All rights reserved.
//

#import "AAA.h"

@implementation AAA


+ (instancetype)shareAAA{
    static AAA* aaa = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        aaa = [[self alloc] init];
    });
    return aaa;
}

- (void)setAbc:(void (^)(NSString *))abc{
    _abc = abc;
}

- (void)aaa:(void (^)(void))abc{
    abc();
}
- (void)dealloc{
    
}

@end
