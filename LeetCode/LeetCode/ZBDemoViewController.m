//
//  ZBDemoViewController.m
//  DesignPatternsDemo
//
//  Created by Mzhangzb on 2017/12/28.
//  Copyright © 2017年 zhangzhengbin. All rights reserved.
//

#import "ZBDemoViewController.h"
#import "LeetCode-Swift.h"
@interface ZBDemoViewController ()

@end

@implementation ZBDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self leetCodeTwoSum];
}

- (void)leetCodeTwoSum{
    TwoSum * twoSum = [[TwoSum alloc] init];
    NSArray * testArray = @[@2,@3,@4,@5,@6];
    NSArray * re = [twoSum twoSum:testArray :8];
    NSLog(@"%@", re);
}



@end
