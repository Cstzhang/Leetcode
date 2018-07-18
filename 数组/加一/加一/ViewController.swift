//
//  ViewController.swift
//  加一
//
//  Created by bigfish on 2018/7/18.
//  Copyright © 2018年 bigfish. All rights reserved.
//
/*
 Given a non-empty array of digits representing a non-negative integer, plus one to the integer.
 
 The digits are stored such that the most significant digit is at the head of the list, and each element in the array contain a single digit.
 
 You may assume the integer does not contain any leading zero, except the number 0 itself.
 
 Example 1:
 
 Input: [1,2,3]
 Output: [1,2,4]
 Explanation: The array represents the integer 123.
 Example 2:
 
 Input: [4,3,2,1]
 Output: [4,3,2,2]
 Explanation: The array represents the integer 4321.
 
 */

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let testArr:[Int] = [4,3,2,1]
        let reArr = plusOne(testArr)
        print(reArr)
        
    }
    func plusOne(_ digits: [Int]) -> [Int] {
        var tmp = digits
        for  (index,value) in tmp.enumerated().reversed() {
            if value == 9 {
                tmp[index] = 0
            }else{
                tmp[index] += 1
                return tmp
            }
        }
        if tmp.first == 0 {
            tmp.insert(1, at: 0)
        }
        
        return tmp
    }
    
    func plusOne1(_ digits: [Int]) -> [Int] {
        var carry = 1
        var result = digits
        for (index,value) in result.enumerated().reversed() {
            if carry == 0 {
                return result
            }
            let tmp = value + carry
            carry = tmp / 10
            result[index] = tmp % 10
        }
        if carry != 0 {
            result.insert(1, at: 0)
        }
    
        return result
    }

}

