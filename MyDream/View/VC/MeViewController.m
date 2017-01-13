//
//  MeViewController.m
//  MyDream
//
//  Created by JingXueLong on 2017/1/6.
//  Copyright © 2017年 jingxuelong. All rights reserved.
//

#import "MeViewController.h"
#import "BlockCircleViewController.h"
@interface MeViewController ()
@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation MeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    
    
}



- (void)testMasonry{
    self.scrollView = [[UIScrollView alloc] init];
    [self.view addSubview:self.scrollView];
    [self.scrollView setBackgroundColor:RandomColor];
    
    
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view); 
    }];
    
    
    UIView *contentView = [UIView new];
    [contentView setBackgroundColor:RandomColor];
    [self.scrollView addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.height.equalTo(self.scrollView);
    }];
    
    
    UIView *lastView = nil;
    
    for (int i = 0; i<10; i++) {
        UIView *view = [[UIView alloc] init];
        [view setBackgroundColor:RandomColor];
        [contentView addSubview:view];
        if (!lastView) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.top.bottom.equalTo(contentView);
                make.width.mas_equalTo(@50);
            }];
        }else{
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.bottom.equalTo(contentView);
                make.left.equalTo(lastView.mas_right);
                make.width.mas_equalTo(@50);
            }];
        }
        
        lastView = view;
    }
    
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(lastView); 
    }];

}
- (IBAction)push:(id)sender {
    BlockCircleViewController *vc = [[BlockCircleViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
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
