//
//  BubbleSort.swift
//  LeetCode
//
//  Created by Mzhangzb on 23/01/2018.
//  Copyright © 2018 zhangzb. All rights reserved.
//

import Foundation

class BubbleSort: NSObject {
    
    func bubbleSort(_ sortArr: [Int]) -> [Int] {
        var arr:[Int]  = sortArr
        var tmp:Int
        for j in 0..<arr.count - 1  {
            for i in 0..<arr.count - 1 - j {
                if(arr[i] > arr[i+1]){
                    tmp = arr[i];
                    arr[i] = arr[i + 1];
                    arr[i + 1] = tmp;
                }
            }
        }
      return arr
    }
    
}
