//
//  ViewController.swift
//  两个数组的交集2
//
//  Created by bigfish on 2018/10/12.
//  Copyright © 2018 bigfish. All rights reserved.
//
/*
 Given two arrays, write a function to compute their intersection.
 
 Example 1:
 
 Input: nums1 = [1,2,2,1], nums2 = [2,2]
 Output: [2,2]
 Example 2:
 
 Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
 Output: [4,9]
 Note:
 
 Each element in the result should appear as many times as it shows in both arrays.
 The result can be in any order.
 Follow up:
 
 What if the given array is already sorted? How would you optimize your algorithm?
 What if nums1's size is small compared to nums2's size? Which algorithm is better?
 What if elements of nums2 are stored on disk, and the memory is limited such that you cannot load all elements into the memory at once?
 
 */
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let nums1 = [1,2,2,1]
        let nums2 = [2,2]
        var re:[Int]
        re = intersect(nums1, nums2)
        print(re)
        assert(re.count == 2, "test failed!")
        
        let nums3 = [4,9,5]
        let nums4 = [9,4,9,8,4]
        var re2:[Int]
        re2 = intersect(nums3, nums4)
        print(re2)
        assert(re2.count == 2, "test failed!")
        
        
        let nums5 = [3,1,2]
        let nums6 = [1,1]
        var re3:[Int]
        re3 = intersect(nums5, nums6)
        print(re3)
        assert(re3.count == 1, "test failed!")
        
        
        let nums7 = [1,2,2,1]
        let nums8 = [2]
        var re4:[Int]
        re4 = intersect(nums7, nums8)
        print(re4)
        assert(re4.count == 1, "test failed!")
        
       
        
       
    
    }
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var re =  Array<Int>()
        if nums1.isEmpty || nums2.isEmpty {
            return []
        }
        if nums1.count <= nums2.count {
            for i in nums1 {
                for j in nums2{
                    if i == j && re.count < nums1.count{
                        re.append(i)
                        break
                    }
                }
            }
        }else{
            for i in nums2 {
                for j in nums1 {
                    if i == j && re.count < nums2.count{
                        re.append(i)
                        break
                    }
                }
            }
        }
        return re
    }
    
}

