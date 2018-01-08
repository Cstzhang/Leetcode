//
//  TwoSum.swift
//  LeetCode
//
//  Created by zhangzb on 2018/1/8.
//  Copyright © 2018年 zhangzb. All rights reserved.
//

import Foundation

class TwoSum:NSObject{
//    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//        for (j,num) in nums.enumerated() {
//            if (j == nums.count - 1) {
//                break
//            }
//            for i in index+1...nums.count - 1{
//                if num + nums[i] == target{
//                    return [j,i]
//                }
//            }
//        }
//       return [Int]()
//    }
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int : Int]()
        for (i, num) in nums.enumerated() {
            if let lastIndex = dict[target - num] {
                return [lastIndex, i]
            }
            dict[num] = i
        }
        return []
    }
    
}
