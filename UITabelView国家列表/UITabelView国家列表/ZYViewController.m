//
//  ZYViewController.m
//  UITabelView国家列表
//
//  Created by 章芝源 on 16/1/29.
//  Copyright © 2016年 ZZY. All rights reserved.
//

#import "ZYViewController.h"
#import "ZYCarModel.h"


@interface ZYViewController ()<UITableViewDataSource>
@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)NSArray *cars;


@end

@implementation ZYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置tableView
    UITableView *tableView = [[UITableView alloc]init];
    tableView.frame = self.view.bounds;
    self.tableView = tableView;
    [self.view addSubview:tableView];
    self.tableView.dataSource = self;
}

#pragma mark - 数据源方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.cars.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    ZYCarModel *car = self.cars[section];
    
    return car.cars.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1.获得数组模型
    ZYCarModel *car = self.cars[indexPath.section];
    //2.拿到每辆车的名字
    NSString *carName = car.cars[indexPath.row];
    //3.创建cell
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    //4.设置cell的值
    cell.textLabel.text = carName;
    return cell;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    ZYCarModel *car = self.cars[section];
    return car.title;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    ZYCarModel *car = self.cars[section];
    return car.desc;
}


#pragma mark - 懒加载
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        _tableView.frame = self.view.bounds;
    }
    return _tableView;
}

//懒加载数据
- (NSArray *)cars
{
    if (!_cars) {
        _cars = [NSArray array];
        NSString *path = [[NSBundle mainBundle]pathForResource:@"cars_simple.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayM = [[NSMutableArray alloc]init];
        for (NSDictionary *dict in array) {
            ZYCarModel *car = [[ZYCarModel alloc]initWithDict:dict];
            [arrayM addObject:car];
        }
        _cars = arrayM;
    }
    return _cars;
}


@end
