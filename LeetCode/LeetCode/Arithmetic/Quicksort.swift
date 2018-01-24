//
//  Quicksort.swift
//  LeetCode
//
//  Created by zhangzb on 2018/1/24.
//  Copyright © 2018年 zhangzb. All rights reserved.
//

import UIKit

class Quicksort: NSObject {
    func quicksort(_ sortArr: [Int],_ left: Int,_ right: Int) -> (){
        var arr:[Int]  = sortArr
        var i, j, pivot : Int
        
        if left > right {
            return
        }
        pivot = arr[left]
        
        i = left
        j = right
        
        while i != j {
            while arr[j] >= pivot && i < j {
                j -= 1
            }
            
            while arr[i] <= pivot && i < j {
                i += 1
            }
            
            if i < j {
                arr.swapAt(i, j)
            }
        }
        
        arr[left] = arr[i]
        arr[i] = pivot
        
        print(arr)
        quicksort(arr, left, i - 1)
        quicksort(arr, i + 1, right)
    }
}
