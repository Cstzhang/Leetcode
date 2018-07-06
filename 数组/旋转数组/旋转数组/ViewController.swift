//
//  ViewController.swift
//  旋转数组
//
//  Created by bigfish on 2018/7/6.
//  Copyright © 2018年 bigfish. All rights reserved.
//
/*
 给定一个数组，将数组中的元素向右移动 k 个位置，其中 k 是非负数。
 示例 1:
 
 输入: [1,2,3,4,5,6,7] 和 k = 3
 输出: [5,6,7,1,2,3,4]
 解释:
 向右旋转 1 步: [7,1,2,3,4,5,6]
 向右旋转 2 步: [6,7,1,2,3,4,5]
 向右旋转 3 步: [5,6,7,1,2,3,4]
 
 示例 2:
 
 输入: [-1,-100,3,99] 和 k = 2
 输出: [3,99,-1,-100]
 解释:
 向右旋转 1 步: [99,-1,-100,3]
 向右旋转 2 步: [3,99,-1,-100]
 说明:
 
 尽可能想出更多的解决方案，至少有三种不同的方法可以解决这个问题。
 要求使用空间复杂度为 O(1) 的原地算法。
 
 */


import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //test1
        var arr1:[Int] = [1,2,3,4,5,6,7]
//        rotate1(&arr1, 3)
        rotate2(&arr1, 3)
        //test2
        var arr2:[Int] = [-1,-100,3,99]
//        rotate1(&arr2, 2)
        rotate2(&arr2, 2)
    }
    
    
    //(i + k) % n = 旋转后的位置
    func rotate1(_ nums: inout [Int], _ k: Int)  {
        
        if nums.count == 0 || k % nums.count == 0 {
            return
        }
        // 确保最少的旋转，如数组容量为8，旋转9次和旋转1次是一样的。
        let k = k % nums.count
        
        var tempArray = nums
        for i in 0..<nums.count {
            tempArray[(i + k) % nums.count] = nums[i]
        }
        nums = tempArray
        print(nums)
        
        
        
        
        
        /*
         if (nums.isEmpty || k%nums.count == 0){
         return
         }
         let temp = nums
         for i in 0..<nums.count {
         nums[((i+k)%nums.count)] = temp[i]
         }
         
         */
        
        
    }
    
    func rotate2(_ nums: inout [Int],_ k: Int)  {
        if k == 0 || nums.count == 0 {
            return
        }
        
        // 确保最少的旋转，如数组容量为8，旋转9次和旋转1次是一样的。
        let k = k % nums.count
        reversal(&nums, 0, nums.count - 1 - k)
        reversal(&nums, nums.count - k, nums.count - 1)
        reversal(&nums, 0, nums.count - 1)
        print(nums)
    }
    
    func reversal(_ nums: inout [Int],_ start:Int,_ end: Int)  {
        
        var m = start
        var n = end
        while m < n {
            let t = nums[n]
            nums[n] = nums[m];
            nums[m] = t;
            n = n - 1
            m = m + 1
        }
        
        
    }
    
    
    
    func rotate3(_ nums: inout [Int], _ k: Int) {
        var result:[Int] = []
        let j = k%nums.count
        let num = nums.count
        if j == 0{
            return
        }
        for i in num-j...num-1 {
            result.append(nums[i])
        }
        for i in 0...num-j-1{
            result.append(nums[i])
        }
        nums = result
    }
    
    
    
    
    
    


}

