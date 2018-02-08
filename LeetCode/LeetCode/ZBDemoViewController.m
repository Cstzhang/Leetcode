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
//    NSLog(@"-----leetCodeTwoSum-----");
//    TwoSum *twoSum = [[TwoSum alloc] init];
//    NSArray * testArray = @[@2,@3,@4,@5,@6];
//    NSArray * re = [twoSum twoSum:testArray :8];
//    NSLog(@"%@", re);
    
    NSString *tempstr = @"abbbccefafggd";
    //首先就是遍历数组的啦
    NSMutableArray *arrm = [NSMutableArray array];
    for ( int i = 0 ; i < tempstr.length; i++) {
        NSRange range = NSMakeRange(i, 1);
        NSString *temp1str = [tempstr substringWithRange:range];
        
        [arrm addObject:temp1str];
    }
    //    NSLog(@"%@",arrm);把每个子字符串放到数组中的啦
    
    for (int i = 0 ; i<arrm.count; i++) {//在从数组中找出重复只的啦
        //这里的思路是这样：通过使用数组中每个字符串切割tempstr这个完整的字符串。然后返回给temparr这个数组，如果
        //这个数组的count成员数是2意味着该字符在tempstr这个字符串中有且只有一个，之后打印第一个粗现的字符就可以了
        //（我又特么卖萌了，罪过！！)
        NSArray *temparr = [tempstr componentsSeparatedByString:arrm[i]];
        if (temparr.count == 2)
        {
            NSLog(@"%@",arrm[i]);
            NSLog(@"%@",temparr);
        }
        
    }
    
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

- (void)quicksort{
    NSLog(@"-----bubbleSort-----");
    NSArray * arrToSort = @[@3,@7,@1,@9,@11,@18,@4,@99,@2,@8];
    Quicksort *sort = [[Quicksort alloc] init];
    [sort quicksort:arrToSort :0 :arrToSort.count -1];
}

- (void)insertionSort{
    NSLog(@"-----bubbleSort-----");
    NSArray * arrToSort = @[@3,@7,@1,@9,@11,@18,@4,@99,@2,@8];
    InsertionSort *sort = [[InsertionSort alloc] init];
    NSLog(@"sort result :%@", [sort insertionSort:arrToSort].description);
}

- (void)lengthOfLongestSubstring{
    NSLog(@"-----lengthOfLongestSubstring-----");
    NSString *testString1 = @"abcabcbb";
    NSString *testString2 = @"bbbbb";
    NSString *testString3 = @"pwwkew";
    WithoutRepeatingCharacters *subString = [[WithoutRepeatingCharacters alloc]init];
    NSCAssert([subString lengthOfLongestSubstring:testString1] == 3, @"success");
    NSCAssert([subString lengthOfLongestSubstring:testString2] == 1, @"success");
    NSCAssert([subString lengthOfLongestSubstring:testString3] == 3, @"success");
}


@end
