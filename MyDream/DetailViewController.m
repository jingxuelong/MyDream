//
//  DetailViewController.m
//  MyDream
//
//  Created by JingXueLong on 2017/1/5.
//  Copyright © 2017年 jingxuelong. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailTableViewCell.h"
@interface DetailViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
}


#pragma mark-- <UITableViewDelegate>


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SingleModel *model = [self.dataArray objectAtIndex:indexPath.row];
    DetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateStyle = kCFDateFormatterShortStyle;
    formatter.timeStyle = kCFDateFormatterShortStyle;
    NSString *time = [formatter stringFromDate:model.date];
    [cell.timeLabel setText:time];
    [cell.twentyLabel setText:[NSString stringWithFormat:@"%.0fW",model.mainMoney]];
    cell.twentyLabel.textColor = model.mainMoney>0?[UIColor redColor]:[UIColor greenColor];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}
#pragma mark- <Setters and Getters>


- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[DetailTableViewCell class] forCellReuseIdentifier:@"cell"];
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
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
