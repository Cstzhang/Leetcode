//
//  ViewController.swift
//  反转字符串
//
//  Created by bigfish on 2019/3/8.
//  Copyright © 2019 zzb. All rights reserved.
//

/*
 编写一个函数，其作用是将输入的字符串反转过来。输入字符串以字符数组 char[] 的形式给出。
 
 不要给另外的数组分配额外的空间，你必须原地修改输入数组、使用 O(1) 的额外空间解决这一问题。
 
 你可以假设数组中的所有字符都是 ASCII 码表中的可打印字符。
 
 
 
 示例 1：
 
 输入：["h","e","l","l","o"]
 输出：["o","l","l","e","h"]
 示例 2：
 
 输入：["H","a","n","n","a","h"]
 输出：["h","a","n","n","a","H"]
 
 */

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var arr1 = ["h","e","l","l","o"] as [Character]
        var arr2 = ["H","a","n","n","a","h"] as [Character]
        print("before   " + arr1)
        reverseString2(&arr1)
        print(arr1)
        print("before   " + arr2)
        reverseString2(&arr2)
        print(arr2)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func reverseString(_ s: inout [Character]) {
        for (index ,element) in s.enumerated().reversed() {
             if index < s.count - 1
             {
                s.append(element)
                s.remove(at: index)
            }
            
        }
    }
    
    func reverseString2(_ s: inout [Character]) {
        var left:Int = 0
        var right:Int = s.count - 1;
        while left < right {
            let tmp  = s[left]
            s[left]  = s[right]
            s[right] = tmp
            left += 1
            right -= 1
        }
    }
    
    
    func reverseString3(_ s: String) -> String {
        var newString :String = ""
        for c in s.reversed() {
            newString.append(c)
        }
        return newString
    }

}

