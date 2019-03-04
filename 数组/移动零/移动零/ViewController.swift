//
//  ViewController.swift
//  移动零
//
//  Created by bigfish on 2019/3/4.
//  Copyright © 2019 zzb. All rights reserved.
//
/*
 给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。
 
 示例:
 
 输入: [0,1,0,3,12]
 输出: [1,3,12,0,0]
 说明:
 
 必须在原数组上操作，不能拷贝额外的数组。
 尽量减少操作次数
 
 */



import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var num1 = [0,1,0,3,12];
        moveZeroes(&num1)
//        print(num1);
        // Do any additional setup after loading the view, typically from a nib.
    }

    func moveZeroes(_ nums: inout [Int]) {
        var x:Int = 0;
        for (index,element) in nums.enumerated() {
            if element == 0{
                nums.append( element)
                nums.remove(at: index - x)
                x = x + 1
            }
        }
        
        
        
    }
    
    func moveZeroes2(_ nums: inout [Int]) {
        let n = nums.count
        var zeroIndex = 0
        for _ in 0..<n {
            if  nums[zeroIndex] == 0 {
                nums.remove(at: zeroIndex)
                nums.append(0)
            }else{
                zeroIndex += 1
            }
        }
    }

}

