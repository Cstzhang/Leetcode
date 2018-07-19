//
//  ViewController.swift
//  两数之和
//
//  Created by bigfish on 2018/7/19.
//  Copyright © 2018年 bigfish. All rights reserved.
//
/*
Given an array of integers, return indices of the two numbers such that they add up to a specific target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

Example:

Given nums = [2, 7, 11, 15], target = 9,

Because nums[0] + nums[1] = 2 + 7 = 9,
return [0, 1].
 
 可以直接遍历两遍数组，第一遍用target-nums[i]，第二遍找nums数组中是否存在target-nums[i]这个数字，找到就返回两个数字组成的数组，这个方法时间复杂度比较大为O(n²)
 
 还有可以用哈希表先把数组中的数字和对应的下标存储一遍，即数字作为键，下标作为值，存储，当遍历数组的时候用target-nums[i]，得到差k，然后在map中找是否存在 k，找到即返回k所对应的value,也就是所对应的数组下标。这样时间复杂度就为O(n+l)，快了好多。

 */
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let testArr1  = [2, 7, 11, 15]
        let target1 = 9
        let re = twoSum2(testArr1, target1)
        print(re)
        let testArr2  = [2, 7, 11, 15,22,34,1,8]
        let target2 = 9
        let re2 = twoSum2(testArr2, target2)
        print(re2)
        let testArr3  = [1, 7, 11, 15,2,8,0,9]
        let target3 = 9
        let re3 = twoSum2(testArr3, target3)
        print(re3)
    }

    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var result:[Int] = [Int](repeating: 0, count: 2)
        for (index,value) in nums.enumerated() {
            let diff = target - value;
            for (i,v) in nums.enumerated(){
                if v == diff && index != i {
                    result[0] = index;
                    result[1] = i;
                    return result;
                }
            }
        }
        
        return result
    }

    func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
//        var result:[Int] = [Int](repeating: 0, count: 2)
//        var dic = [Int:Int]()
//        for (i,v) in nums.enumerated() {
//            dic[v] = i
//        }
//        for (a,b) in nums.enumerated() {
//            let diff = target - b
//            if dic[diff] != nil && a != dic[diff]{
//                result[0] = a
//                result[1] = dic[diff]!
//                return result
//            }
//        }
//
//        return result
        
        
        var dict = [Int:Int]()
        for i in 0 ..< nums.count {
            let complement = target - nums[i]
            if let index = dict[complement] {
                return [index,i]
            }
            
            dict[nums[i]] = i
        }
        
        return [Int]()
    }


}

