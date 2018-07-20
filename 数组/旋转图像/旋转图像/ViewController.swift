//
//  ViewController.swift
//  旋转图像
//
//  Created by bigfish on 2018/7/20.
//  Copyright © 2018年 bigfish. All rights reserved.
//

/*
 You are given an n x n 2D matrix representing an image.
 
 Rotate the image by 90 degrees (clockwise).
 
 Note:
 
 You have to rotate the image in-place, which means you have to modify the input 2D matrix directly. DO NOT allocate another 2D matrix and do the rotation.
 
 Example 1:
 
 Given input matrix =
 [
 [1,2,3],
 [4,5,6],
 [7,8,9]
 ],
 
 rotate the input matrix in-place such that it becomes:
 [
 [7,4,1],
 [8,5,2],
 [9,6,3]
 ]
 Example 2:
 
 Given input matrix =
 [
 [ 5, 1, 9,11],
 [ 2, 4, 8,10],
 [13, 3, 6, 7],
 [15,14,12,16]
 ],
 
 rotate the input matrix in-place such that it becomes:
 [
 [15,13, 2, 5],
 [14, 3, 4, 1],
 [12, 6, 8, 9],
 [16, 7,10,11]
 ]
 
 */

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var matrix1  =  [
            [1,2,3],
            [4,5,6],
            [7,8,9]
        ]
        var matrix2  =  [
            [ 5, 1, 9,11],
            [ 2, 4, 8,10],
            [13, 3, 6, 7],
            [15,14,12,16]
        ]
        
        rotate(&matrix1)
        rotate(&matrix2)
        rotate2(&matrix1)
        rotate2(&matrix2)
    }

    /*
      对于当前位置，计算旋转后的新位置，然后再计算下一个新位置，第四个位置又变成当前位置了，所以这个方法每次循环换四个数字
     
     */
    func rotate(_ matrix: inout [[Int]]) {
        print(matrix)
         print("-----------------")
        let n = matrix.count
        for i in 0 ..<  n/2 {
            for j in i..<(n - 1 - i) {
                let tmp  = matrix[i][j]
                print("tmp : \(tmp)" )
                print("i \(i) j \(j)")
                matrix[i][j] = matrix[n - 1 - j][i]
                   print(matrix)
                 print("-----------------")
                matrix[n - 1 - j][i] = matrix[n - 1 - i][n - 1 - j]
                   print(matrix)
                 print("-----------------")
                matrix[n - 1 - i][n - 1 - j] = matrix[j][n - 1 - i]
                   print(matrix)
                 print("-----------------")
                matrix[j][n - 1 - i] = tmp
                   print(matrix)
                 print("-----------------")
            }
        
        }
        
        print(matrix)
    }

    //首先以从对角线为轴翻转，然后再以x轴中线上下翻转即可得到结果。
    func rotate2(_ matrix: inout [[Int]]) {
        print(matrix)
        let n = matrix.count
        for i in 0..<(n - 1) {
            for j in 0..<(n - i){
                let temp = matrix[i][j]
                matrix[i][j] = matrix[n - 1 - j][n - 1 - i]
                matrix[n - 1 - j][n - 1 - i] = temp
            }
        }
        
        for i in 0..<n/2{
            for j in 0..<n{
                let temp = matrix[i][j]
                matrix[i][j]    =  matrix[n - 1 - i][j]
                matrix[n - 1 - i][j] = temp
                
            }
            
        }
        print(matrix)
    }
    
    func rotate3(_ matrix: inout [[Int]]) {
        let temp = matrix
        
        let rows = matrix.count
        let cols = rows
        
        let maxRow = rows - 1
        _ = maxRow
        
        for i in 0..<rows {
            for j in 0..<cols {
                matrix[j][maxRow - i] = temp[i][j]
            }
        }
    }
}

