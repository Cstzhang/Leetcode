//
//  ViewController.swift
//  两个数组的交集 II
//
//  Created by bigfish on 2019/2/15.
//  Copyright © 2019 zzb. All rights reserved.
//

/*
 
 给定两个数组，编写一个函数来计算它们的交集。
 
 示例 1:
 
 输入: nums1 = [1,2,2,1], nums2 = [2,2]
 输出: [2,2]
 示例 2:
 
 输入: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
 输出: [4,9]
 说明：
 
 输出结果中每个元素出现的次数，应与元素在两个数组中出现的次数一致。
 我们可以不考虑输出结果的顺序。
 进阶:
 
 如果给定的数组已经排好序呢？你将如何优化你的算法？
 如果 nums1 的大小比 nums2 小很多，哪种方法更优？
 如果 nums2 的元素存储在磁盘上，磁盘内存是有限的，并且你不能一次加载所有的元素到内存中，你该怎么办？
 
 */

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let nums1:[Int] = [1,2,2,1]
        let nums2:[Int] = [2,2]
        let re =  intersect(nums1, nums2);
        assert(re.count == 2,  "test1 failed")
        print(re)

        let nums3:[Int] = [4,9,5]
        let nums4:[Int] = [9,4,9,8,4]
        let re2 =  intersect(nums3, nums4);
        print(re2)
        assert(re2.count == 2, "test2 failed")

        let nums5:[Int] = [1,2]
        let nums6:[Int] = [1,1]
        let re3 =  intersect(nums5, nums6);
        print(re3)
        assert(re3.count == 1, "test3 failed")

        let nums7:[Int] = [3,1,2]
        let nums8:[Int] = [1,1]
        let re4 =  intersect(nums7, nums8);
        print(re4)
        assert(re4.count == 1, "test4 failed")
        
        let nums9:[Int] = [54,93,21,73,84,60,18,62,59,89,83,89,25,39,41,55,78,27,65,82,94,61,12,38,76,5,35,6,51,48,61,0,47,60,84,9,13,28,38,21,55,37,4,67,64,86,45,33,41]
        
        let nums10:[Int] =
        [17,17,87,98,18,53,2,69,74,73,20,85,59,89,84,91,84,34,44,48,20,42,68,84,8,54,66,62,69,52,67,27,87,49,92,14,92,53,22,90,60,14,8,71,0,61,94,1,22,84,10,55,55,60,98,76,27,35,84,28,4,2,9,44,86,12,17,89,35,68,17,41,21,65,59,86,42,53,0,33,80,20]
        let re5 =  intersect(nums9, nums10);
        print(re5)
        assert(re5.count == 30, "test5 failed")
        // Do any additional setup after loading the view, typically from a nib.
    }

    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var re = [Int]()
        var bigDic = [Int :Int]()
        var smallDic = [Int :Int]()
        var reDic = [Int :Int]()
        let bigNum =   nums1.count > nums2.count ? nums1 : nums2
        let smallNum = nums2.count < nums1.count ? nums2 : nums1
        
        for i in bigNum {
            if bigDic[i] != nil{
                bigDic[i]  = bigDic[i]! + 1
            }else{
                bigDic[i] = 1
            }
        }
        
        for n in smallNum {
            if smallDic[n] != nil{
                smallDic[n]  = smallDic[n]! + 1
            }else{
                smallDic[n] = 1
            }
        }
        
        for x in smallNum {
            if bigNum.contains(x) && !re.contains(x){
                re.append(x)
                reDic[x] = 1
            }else if bigNum.contains(x) && re.contains(x) && (Int)(reDic[x]!) < (Int)(smallDic[x]!) && (Int)(reDic[x]!) < (Int)(bigDic[x]!){
                re.append(x)
                reDic[x]  = reDic[x]! + 1
            }
        }
        print(re.count)
        return re;
    }
    
    
    func intersectBetter(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var map: [Int: Int] = [:]
        for num in nums1 {
            if let count = map[num] {
                map[num] = count + 1
            } else {
                map[num] = 1
            }
        }
        
        var result: [Int] = []
        for num in nums2 {
            if let count = map[num], count >= 1 {
                result.append(num)
                map[num] = count - 1
            }
        }
        return result
    }

}

