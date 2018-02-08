//
//  Test.swift
//  LeetCode
//
//  Created by zhangzb on 2018/1/26.
//  Copyright © 2018年 zhangzb. All rights reserved.
//

import UIKit

class Test: NSObject {
  //  let addTwo = addNum(2)
    func swap<T>(_ nums: inout [T], _ p: Int, _ q: Int) {
        (nums[p], nums[q]) = (nums[q], nums[p])
    }
    //
    //    func addTo(_ adder: Int) -> (Int) -> Int {
    //        return { num in
    //            return num + adder
    //        }
    //    }
    
    // let addOne = addTo() //addOne: Int -> Int
    //    let addTwo = addTo(2)  //addTwo: Int -> Int
    //
    //    let oneResult = addOne(3)   // oneResult == 4
    //    let twoResult = addTwo(4)   // twoResult == 6
    //
    
//    func getMin<T: compareble>(a:T,b:T) -> T {
//        return a > b ? b : a
//    }
    
    
}
