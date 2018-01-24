//
//  InsertionSort.swift
//  LeetCode
//
//  Created by zhangzb on 2018/1/24.
//  Copyright © 2018年 zhangzb. All rights reserved.
//

import UIKit

class InsertionSort: NSObject {
    func insertionSort(_ array: [Int]) -> [Int] {
        var arr = array                           // 1
        for x in 1..<arr.count {                  // 2
            var y = x
            while y > 0 && arr[y] < arr[y - 1] {    // 3
                arr.swapAt(y - 1, y)
                y -= 1
            }
        }
        return arr
    }
}
