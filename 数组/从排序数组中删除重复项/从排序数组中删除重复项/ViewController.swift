//
//  ViewController.swift
//  从排序数组中删除重复项
//
//  Created by zhangzb on 2018/7/4.
//  Copyright © 2018年 Guangzhou Shirui Electronics Co., Ltd. All rights reserved.
//

/*
 给定一个排序数组，你需要在原地删除重复出现的元素，使得每个元素只出现一次，返回移除后数组的新长度。
 
 不要使用额外的数组空间，你必须在原地修改输入数组并在使用 O(1) 额外空间的条件下完成。
 
 */
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var tmpArray:[Int] = [1,1,2,2,3,3,3,4];
        
        assert(removeDuplicates(&tmpArray) == 4 , "去除重负数去成功")
        
        
    }
    
    func removeDuplicates(_ nums:inout [Int]) -> Int {
        if  nums.count == 0{
            return 0
        }
        var index:Int = 1
        for num in nums.enumerated(){
            if num.offset >= 1{
                if num.element != nums[num.offset - 1]{
                    nums[index] = num.element
                    index = index + 1
                }
            }
        }
        
        return index;
    }
    
    // var tmpArray:[Int] = [1,1,1,2,2,3,3,3,4];
    
    func removeDuplicates2(_ nums:inout [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        var i = 0
        for j in 0 ..< nums.count {
            if nums[i] != nums[j] {
                i += 1
                nums[i] = nums[j]
            }
        }
        return i + 1
    }
    
    
    
}


