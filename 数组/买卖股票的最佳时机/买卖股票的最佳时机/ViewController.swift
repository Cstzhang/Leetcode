//
//  ViewController.swift
//  买卖股票的最佳时机
//
//  Created by bigfish on 2018/10/10.
//  Copyright © 2018 bigfish. All rights reserved.
//

/*
 Say you have an array for which the ith element is the price of a given stock on day i.
 
 Design an algorithm to find the maximum profit. You may complete as many transactions as you like (i.e., buy one and sell one share of the stock multiple times).
 
 Note: You may not engage in multiple transactions at the same time (i.e., you must sell the stock before you buy again).
 
 Example 1:
 
 Input: [7,1,5,3,6,4]
 Output: 7
 Explanation: Buy on day 2 (price = 1) and sell on day 3 (price = 5), profit = 5-1 = 4.
 Then buy on day 4 (price = 3) and sell on day 5 (price = 6), profit = 6-3 = 3.
 Example 2:
 
 Input: [1,2,3,4,5]
 Output: 4
 Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
 Note that you cannot buy on day 1, buy on day 2 and sell them later, as you are
 engaging multiple transactions at the same time. You must sell before buying again.
 Example 3:
 
 Input: [7,6,4,3,1]
 Output: 0
 Explanation: In this case, no transaction is done, i.e. max profit = 0.
 
 */

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let arr1:[Int] = [7,1,5,3,6,4]
        let arr2:[Int] = [1,2,3,4,5]
        let arr3:[Int] = [7,6,4,3,1]
        
        let re:Int =  maxProfit(arr1)
        assert(re == 7, "max \(re)")
        print(re)
        
        let re2:Int =  maxProfit(arr2)
        assert(re2 == 4, "max \(re2)")
        print(re2)
        
        let re3:Int =  maxProfit(arr3)
        assert(re3 == 0, "max \(re3)")
        print(re3)
        
    }

    func maxProfit(_ prices: [Int]) -> Int {
        var result:Int = 0
        if prices.count == 0  {
            return 0
        }
        for i in 1..<prices.count {//贪心算法，有钱就赚
            let d:Int = prices[i] - prices[i-1]
            if d > 0{
                result += d
            }
        }
        return result
    }
    
//    func maxProfit(_ prices: [Int]) -> Int {
//        var max = 0
//        guard prices.count > 1 else {
//            return max
//        }
//        for i in 1..<prices.count where prices[i] > prices[i - 1] {
//            max += prices[i] - prices[i - 1]
//        }
//        return max
//    }
    
    
}

