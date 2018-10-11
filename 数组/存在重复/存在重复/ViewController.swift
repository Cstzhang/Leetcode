//
//  ViewController.swift
//  存在重复
//
//  Created by bigfish on 2018/10/11.
//  Copyright © 2018 bigfish. All rights reserved.
//
/*
 Given an array of integers, find if the array contains any duplicates.
 
 Your function should return true if any value appears at least twice in the array, and it should return false if every element is distinct.
 
 Example 1:
 
 Input: [1,2,3,1]
 Output: true
 Example 2:
 
 Input: [1,2,3,4]
 Output: false
 Example 3:
 
 Input: [1,1,1,3,3,4,3,2,4,2]
 Output: true
 
 */
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let arr1:[Int] = [1,2,3,1]
        let arr2:[Int] = [1,2,3,4]
        let arr3:[Int] = [1,1,1,3,3,4,3,2,4,2]
        assert(containsDuplicate(arr1), "test failed!")
        assert(!containsDuplicate(arr2),"test failed!")
        assert(containsDuplicate(arr3), "test failed!")
    
    
    }

    
//    func containsDuplicate(_ nums: [Int]) -> Bool {
//        guard nums.count > 1 else {
//            return false
//        }
//        for i in 0..<nums.count {
//            for j in 0..<nums.count{
//                if nums[i] == nums[j] && i != j{
//                    print("ok")
//                    return true
//                }
//            }
//        }
//        print("no")
//        return false
//    }
//
//    func containsDuplicate(_ nums: [Int]) -> Bool {
//        let set = Set(nums)
//        return set.count != nums.count
//    }
    
    //排序
//    func containsDuplicate(_ nums: [Int]) -> Bool {
//        if nums.isEmpty || nums.count == 1 {
//            return false
//        }
//        
//        let nums = nums.sorted()
//        
//        for i in 0..<nums.count - 1 {
//            if nums[i] == nums[i + 1] {
//                return true
//            }
//        }
//        return false
//    }
    
    //哈希表
    func containsDuplicate(_ nums: [Int]) -> Bool {
        for i in 0..<nums.count {
            if let _ = dic[nums[i]] {
                return true
            }
            dic[nums[i]] = i
        }
        return false
    }
    
  
//    func containsDuplicate(_ nums: [Int]) -> Bool {
//       return nums.count != Set.init(nums).count
//    }
    
}

