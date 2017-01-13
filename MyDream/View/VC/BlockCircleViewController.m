//
//  BlockCircleViewController.m
//  MyDream
//
//  Created by 荆学龙 on 17/1/7.
//  Copyright © 2017年 jingxuelong. All rights reserved.
//

#import "BlockCircleViewController.h"
#import "AAA.h"
@interface BlockCircleViewController ()

@property (nonatomic, strong) NSString *abc;
@property (nonatomic, strong) AAA *aa;
@end

@implementation BlockCircleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view.
    self.abc = @"abc";
    
    
//    self.operation = [NSBlockOperation blockOperationWithBlock:^{
//        
//    }];
//    
//    
//    [self.operation setCompletionBlock:^{
//        
//    }];
//    
//    
//    [self.operation start];
//    AAA*aa = [AAA shareAAA];
    self.aa = [[AAA alloc] init];
    
    __weak typeof(self)weakSelf  =  self;
//    NSLog(@"指针地址1%x", &weakSelf);
//    NSLog(@"指针指向地址1%p", weakSelf);

//    [self.aa setAbc:^(NSString *value){
//        __strong ty
//            NSLog(@"%@",self.abc);
//    }];
//    
//    self.aa.abc(@"11");
    [self.aa aaa:^{
//        __strong typeof(weakSelf)strongSelf = weakSelf;
////        NSLog(@"指针指向地址2%p", strongSelf);
//        dispatch_async(dispatch_get_global_queue(0, 0), ^{
//            [NSThread sleepForTimeInterval:10];
//            
            NSLog(@"%@",self.abc);
//        });
//
    }];
    
    
    
}


- (void)dealloc{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
