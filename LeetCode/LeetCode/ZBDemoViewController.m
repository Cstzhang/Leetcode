//
//  ZBDemoViewController.m
//  DesignPatternsDemo
//
//  Created by Mzhangzb on 2017/12/28.
//  Copyright © 2017年 zhangzhengbin. All rights reserved.
//

#import "ZBDemoViewController.h"
#import "LeetCode-Swift.h"

//#define SuppressPerformSelectorLeakWarning(Stuff) \  //直接忽略不可取
//do { \
//_Pragma("clang diagnostic push") \
//_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
//Stuff; \
//_Pragma("clang diagnostic pop") \
//} while (0)


@interface ZBDemoViewController ()

@end

@implementation ZBDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    SuppressPerformSelectorLeakWarning(
//       [self performSelector:NSSelectorFromString(self.title)];
//                                       );
    [self selectorFunc];
}

- (void)selectorFunc{
    //if (!_controller) { return; } 如果是调用其他controller的方法，则需要校验
    SEL selector = NSSelectorFromString(self.title);
    IMP imp = [self methodForSelector:selector];
    void (*func)(id,SEL) = (void *)imp;
    func(self,selector);
}


- (void)leetCodeTwoSum{
    NSLog(@"-----leetCodeTwoSum-----");
    TwoSum *twoSum = [[TwoSum alloc] init];
    NSArray * testArray = @[@2,@3,@4,@5,@6];
    NSArray * re = [twoSum twoSum:testArray :8];
    NSLog(@"%@", re);
}


- (void)addTwoNumbers{
    NSLog(@"-----addTwoNumbers-----");
    AddTwoNumbers *add = [[AddTwoNumbers alloc] init];
    ListNode * l1 = [[ListNode alloc]ListNodeCreateWithStr:@"2->4->3"];
    ListNode * l2 = [[ListNode alloc]ListNodeCreateWithStr:@"5->6->4"];
    ListNode * l3 = [add addTwoNumbersWithL1:l1 l2:l2];
    NSLog(@"return listNode : %@",l3.desc);
}
- (void)bubbleSort{
    NSLog(@"-----bubbleSort-----");
    NSArray * arrToSort = @[@3,@7,@1,@9,@11,@18,@1,@99,@2,@8];
    BubbleSort *sort = [[BubbleSort alloc] init];
    NSLog(@"sort result :%@", [sort bubbleSort:arrToSort].description);
    
    
    
}


@end
