//
//  ViewController.m
//  DesignPatternsDemo
//
//  Created by Mzhangzb on 2017/12/19.
//  Copyright © 2017年 zhangzhengbin. All rights reserved.
//

#import "ViewController.h"
#import "ZBDemoViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

/**  mian tableView for design patterns */
@property (nonatomic,strong) UITableView *mainTableView;
/** design Patterns */
@property (nonatomic,strong) NSArray *designPatterns;

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

#pragma mark ——— init UI

/**
initialization UI
 */
- (void)initUI{
    self.view = self.mainTableView;
    self.navigationItem.title = @"LeetCode";
}



#pragma mark ——— UITableViewDataSource UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section{
    return self.designPatterns.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [
          [UITableViewCell alloc]
          initWithStyle:UITableViewCellStyleDefault
          reuseIdentifier:@"cell"
        ];
    }
    cell.textLabel.text = _designPatterns[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   // NSLog(@"did select row at indexPath: %lu",indexPath.row);
    
    ZBDemoViewController *demoVC = [ [ZBDemoViewController alloc] init ];
    demoVC.title = _designPatterns[indexPath.row];
    demoVC.view.backgroundColor = _mainTableView.backgroundColor;
    [self .navigationController pushViewController:demoVC animated:YES];
}

#pragma mark ——— lazy func

/**
 lazy init func for  mian tableView
 */
- (UITableView *)mainTableView{
    if (!_mainTableView) {
        _mainTableView = [
          [UITableView alloc]
          initWithFrame:self.view.frame
          style:UITableViewStylePlain
        ];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.rowHeight = 60;
        _mainTableView.tableFooterView = [ [UIView alloc] init ];
    }
    return _mainTableView;
}

/**
 lazy init func design Patterns array
 */
- (NSArray *)designPatterns{
    if (!_designPatterns) {
        _designPatterns = @[@"leetCodeTwoSum",@"addTwoNumbers",@"bubbleSort",@"quicksort",@"insertionSort",@"lengthOfLongestSubstring"];
    }
    return _designPatterns;
}

@end
