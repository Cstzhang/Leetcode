//
//  ViewController.swift
//  只出现一次的数字
//
//  Created by bigfish on 2018/7/9.
//  Copyright © 2018年 bigfish. All rights reserved.
//


/*
 Given a non-empty array of integers, every element appears twice except for one. Find that single one.
 
 Note:
 
 Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?
 
 Example 1:
 
 Input: [2,2,1]
 Output: 1
 Example 2:
 
 Input: [4,1,2,1,2]
 Output: 4
 
 */
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let temp:[Int] = [2,2,1]
        let re  = singleNumber2(temp)
        assert(re == 1, "test success");
        print(re);
        let temp2:[Int] = [4,1,2,1,2]
        let re2  = singleNumber2(temp2)
        assert(re2 == 4, "test success");
        print(re2);
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    
    func singleNumber(_ nums: [Int]) -> Int {
        var tmpArr = [Int]()
        var re:Int = 0
        for  a in nums {
            if !tmpArr.contains(a){
                tmpArr.append(a)
            }else{
                var i:Int = 0;
                for (index ,_) in tmpArr.enumerated(){
                    if tmpArr[index] == a {
                        i = index;
                    }
                }
                if tmpArr.count > 0 {
                     tmpArr.remove(at: i)
                }
               
            }
        }
        if tmpArr.count != 0 {
            re = tmpArr[0]
        }
        return re
    }

    
    /**
     * 利用异或的可交换性
       ：一个整数和它本身异或之后得到值是0，0与其他整数异或得到的是这个整数本身
     */
    func singleNumber2(_ nums: [Int]) -> Int {
        if nums.count == 0 { return 0 }
        var num = nums.first!
        for i in 1..<nums.count {
            num = num ^ nums[i]
        }
        return num
    }
}

