//
//  MDTabBarViewController.m
//  MyDream
//
//  Created by 荆学龙 on 17/1/6.
//  Copyright © 2017年 jingxuelong. All rights reserved.
//

#import "MDTabBarViewController.h"
#import "ViewController.h"
#import "FunctionViewController.h"
#import "MeViewController.h"
#import <IQKeyboardManager.h>
@interface MDTabBarViewController ()

@end

@implementation MDTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setItemsVC];
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    manager.enableAutoToolbar = NO;
}



- (void)setItemsVC{
    
    ViewController *mainVC = [[ViewController alloc] init];
    [self addChildrenController:mainVC andTitle:@"Main"];
    
    FunctionViewController* funVC = [[FunctionViewController alloc] init]; 
    [self addChildrenController:funVC andTitle:@"Function"];
    
    MeViewController *meVC = [[MeViewController alloc] init];
    [self addChildrenController:meVC andTitle:@"Me"];

    
}

- (void)addChildrenController:(UIViewController*)controller andTitle:(NSString*)title
{
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:controller];
    nav.tabBarItem.title = title;
    [self addChildViewController:nav];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    if ([item.title isEqualToString:@"Main"]) {
    }
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
