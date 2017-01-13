//
//  ViewController.m
//  MyDream
//
//  Created by 荆学龙 on 17/1/3.
//  Copyright © 2017年 jingxuelong. All rights reserved.
//

#import "ViewController.h"
#import "ViewModel.h"
#import "ViewModelTableViewCell.h"
#import "DetailViewController.h"
#import <AFNetworking.h>
#import <FMDB.h>
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) NSMutableArray <ViewModel*>*dataArr;

@property (assign, nonatomic) UITableViewCellEditingStyle editType;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:NOTICE_MAIN_VC_REFRESH object:nil];
    [self fixNavBar];
    [self refreshData];
    [self.view addSubview:self.tableView];
    NSLog(@"Retain count is %ld", CFGetRetainCount((__bridge CFTypeRef)self));
    
    
    
    
    FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:@""];
    FMDatabase *base = [FMDatabase databaseWithPath:@""];
    
    
//    [[AFHTTPSessionManager manager] GET:@"https://api.app.net/stream/0/posts/stream/global" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        
////        NSLog(@"%@", self.tableView);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        
//    }];
//    CFGetRetainCount((__bridge CFTypeRef)self);
//    NSLog(@"Retain count is %ld", CFGetRetainCount((__bridge CFTypeRef)self));

    
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)refreshData{
    self.dataArr  = [NSMutableArray arrayWithCapacity:0];
    [LOCAL_MANAGER.totleArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        ViewModel *model = [[ViewModel alloc] init];
        model.dataArray = obj;
        [self.dataArr addObject:model];
    }];
    [self.tableView reloadData];
}

- (void)fixNavBar{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(addNewShareCertificate:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(editShareCertificate:)];
}

- (void)addNewShareCertificate:(id)sender{
//    [self.tableView setEditing:YES animated:YES];
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"添加" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alertVC addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
       textField.placeholder = @"Name";
    }];
    
    [alertVC addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Price";
        [textField setKeyboardType:UIKeyboardTypeNumbersAndPunctuation];
    }];
    
    [alertVC addAction:[UIAlertAction actionWithTitle:@"Sure" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self insertData:alertVC];
    }]];
    
    [alertVC addAction:[UIAlertAction actionWithTitle:@"Cancle" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    
    
    [self presentViewController:alertVC animated:YES completion:nil];
    
}

- (void)insertData:(UIAlertController*)alert{
    NSString *name = [NSString stringWithString:alert.textFields.firstObject.text];
    NSString *mianpice = [NSString stringWithString:alert.textFields.lastObject.text];
    if (name.length && mianpice.length) {
        SingleModel *model = [[SingleModel alloc] initWithMainMoney:mianpice.doubleValue andName:name];
        [LOCAL_MANAGER.totleArr addObject:[NSMutableArray arrayWithObject:model]];
        [LOCAL_MANAGER saveData];
        [self refreshData];
    }
}

- (void)editShareCertificate:(id)sender{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"EditType" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [alertController addAction:[UIAlertAction actionWithTitle:@"insert" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.editType = UITableViewCellEditingStyleInsert;
        [self.tableView setEditing:YES animated:YES];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"delete" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.editType = UITableViewCellEditingStyleDelete;
        [self.tableView setEditing:YES animated:YES];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"cancle" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [self presentViewController:alertController animated:YES completion:nil];
}



#pragma mark-- <UITableViewDelegate>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 190;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ViewModelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    ViewModel *model = [self.dataArr objectAtIndex:indexPath.row];
    [cell setModel:model];
    return cell;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.editType;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView setEditing:NO animated:YES];
    ViewModel *model = [self.dataArr objectAtIndex:indexPath.row];

    if (editingStyle == UITableViewCellEditingStyleInsert) {
        //
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"AddNewData" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.placeholder = @"New data";
            textField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
        }];
        [alertController addAction:[UIAlertAction actionWithTitle:@"Sure" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSString *value = alertController.textFields.firstObject.text;
            SingleModel *singModel =[[SingleModel alloc] initWithMainMoney:value.doubleValue andName:model.title];
            [model.dataArray insertObject:singModel atIndex:0];
            [LOCAL_MANAGER saveData];
            [self refreshData];
        }]];
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"cancle" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }]];
        [self presentViewController:alertController animated:YES completion:nil];
        
    }else{
        [LOCAL_MANAGER.totleArr removeObjectAtIndex:indexPath.row];
        [LOCAL_MANAGER saveData];
        [self refreshData];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    ViewModel *model = [self.dataArr objectAtIndex:indexPath.row];
    DetailViewController *vc = [[DetailViewController alloc] init];
    vc.dataArray = [LOCAL_MANAGER.totleArr objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark- <Setters and Getters>


- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[ViewModelTableViewCell class] forCellReuseIdentifier:@"cell"];
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
