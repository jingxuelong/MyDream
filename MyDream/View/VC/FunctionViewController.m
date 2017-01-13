//
//  FunctionViewController.m
//  MyDream
//
//  Created by JingXueLong on 2017/1/6.
//  Copyright © 2017年 jingxuelong. All rights reserved.
//

#import "FunctionViewController.h"
#import "SingleModel.h"
@interface FunctionViewController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@property (weak, nonatomic) IBOutlet UIButton *checkBtn;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) NSMutableArray *dateArr;

@end

@implementation FunctionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    [self.textView.layer setCornerRadius:10];
    self.textView.delegate = self;
    self.dateArr = LOCAL_MANAGER.totleArr;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text; {
    
    if ([@"\n" isEqualToString:text] == YES) {
        [textView resignFirstResponder];  
        return NO;
    }
    return YES;
    
}

- (IBAction)checkText:(id)sender {
    NSString *valuesStr = self.textView.text.copy;
    NSArray *arr = [valuesStr componentsSeparatedByString:@","];
    NSMutableArray *nameArr = [NSMutableArray arrayWithCapacity:0];
    NSMutableArray *valuesArr = [NSMutableArray arrayWithCapacity:0];
    [arr enumerateObjectsUsingBlock:^(NSString*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx%2==0) {
            [nameArr addObject:obj];
        }else{
            [valuesArr addObject:obj];
        }
    }];
    
    [nameArr enumerateObjectsUsingBlock:^(NSString*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *value = [valuesArr objectAtIndex:idx];
        SingleModel *model = [[SingleModel alloc] initWithMainMoney:value.doubleValue andName:obj];
        NSMutableArray *arr = [NSMutableArray arrayWithCapacity:0];
        [arr addObject:model];
        [self.dateArr addObject:arr];
    }];
    [LOCAL_MANAGER saveData];
    [self sendNoticeRefreshMain];
    
}



- (IBAction)addValues:(id)sender {
    NSString *valuesStr = self.textView.text.copy;
    NSArray *arr = [valuesStr componentsSeparatedByString:@","];
    if (arr.count == self.dateArr.count) {
        [arr enumerateObjectsUsingBlock:^(NSString*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSMutableArray *array = [self.dateArr objectAtIndex:idx];
            SingleModel *oldModel = array.firstObject;
            SingleModel *model = [[SingleModel alloc] initWithMainMoney:obj.doubleValue andName:oldModel.name];
            [array insertObject:model atIndex:0];
        }];
        [LOCAL_MANAGER saveData];
        [self sendNoticeRefreshMain];
    }
}

- (void)sendNoticeRefreshMain{
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTICE_MAIN_VC_REFRESH object:nil];
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
