//
//  ViewController.swift
//  中心点
//
//  Created by zhang zhengbin on 2019/8/18.
//  Copyright © 2019 zhang zhengbin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        func pivotIndex(_ nums: [Int]) -> Int {
            if nums.count == 0 {
                return -1
            }
            var sum:Int = 0
            var leftSum:Int = 0
            //总和
            for i in 0...nums.count - 1 {
                sum = sum + nums[i]
            }
            
            for j in 0...nums.count - 1 {
                if leftSum == sum - leftSum - nums[j] {
                    return j
                }
                leftSum = leftSum + nums[j]
            }
            return -1
            
        }
        
        
        
        func test()  {
            let test1 = [-1,-1,-1,-1,-1,0]
            let test2 = [1, 7, 3, 6, 5, 6]
            let test3 = [1, 2, 3]
            let test4 = [-1,-1,-1,-1,-1,-1]
            let test5 = [-1,-1,0,0,-1,-1]
            let test6 = [-1,-1,-1,0,1,1]
            let test7 = [-1,-1,1,0,1,1]
            let test8 = [0,-1,-1,-1,-1,0]
            let test9 = [-1,-1,0,1,0,-1]

            print(pivotIndex(test1))
            assert(pivotIndex(test1) == 2)
            print(pivotIndex(test2))
            assert(pivotIndex(test2) == 3)
            print(pivotIndex(test3))
            assert(pivotIndex(test3) == -1)
            print(pivotIndex(test4))
            assert(pivotIndex(test4) == -1)
            print(pivotIndex(test5))
            assert(pivotIndex(test5) == 2)
            print(pivotIndex(test6))
            assert(pivotIndex(test6) == 0)
            print(pivotIndex(test7))
            assert(pivotIndex(test7) == 5)
            print(pivotIndex(test8))
            assert(pivotIndex(test8) == -1)
            print(pivotIndex(test9))
            assert(pivotIndex(test9) == 4)
        }
        
        test()
        // Do any additional setup after loading the view.
    }


}

