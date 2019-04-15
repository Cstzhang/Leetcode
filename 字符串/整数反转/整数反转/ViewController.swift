//
//  ViewController.swift
//  整数反转
//
//  Created by bigfish on 2019/4/10.
//  Copyright © 2019 zzb. All rights reserved.
//
/*
 Given a 32-bit signed integer, reverse digits of an integer.
 
 Example 1:
 
 Input: 123
 Output: 321
 Example 2:
 
 Input: -123
 Output: -321
 Example 3:
 
 Input: 120
 Output: 21
 Note:
 Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.
 
 */

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let input1 = 123
        let output1 = reverse(input1)
        assert(output1 == 321, "test1 success")
        
        let input2 = -123
        let output2 = reverse(input2)
        assert(output2 == -321, "test2 success")
        
        let input3 = 120
        let output3 = reverse(input3)
        assert(output3 == 21, "test2 success")
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    func reverse(_ x: Int) -> Int {
        var result = 0
        var y = x
        let max = 2147483648
        while y != 0 {
            result = result*10 + y%10
            y = y/10
            if result > max-1 || result < -max{
                return 0
            }
        }
        return result
        
        
//        var num:Int = x
//        var rev:Int = 0
//        while num != 0 {
//            let pop:Int = num % 10
//            num /= 10
//            //边界处理，Int32.max值为214748367，Int32.min值为-2147483648
//            if ((rev > Int32.max/10)||(rev == Int32.max/10 && pop > 7)){return 0}
//            if ((rev < Int32.min/10)||(rev == Int32.min/10 && pop < -8)){return 0}
//            rev = rev*10 + pop
//        }
//        return rev
    }

    
    
 
}

