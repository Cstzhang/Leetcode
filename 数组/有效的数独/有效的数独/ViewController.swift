//
//  ViewController.swift
//  有效的数独
//
//  Created by bigfish on 2019/3/6.
//  Copyright © 2019 zzb. All rights reserved.
//
/*
 判断一个 9x9 的数独是否有效。只需要根据以下规则，验证已经填入的数字是否有效即可。
 
 数字 1-9 在每一行只能出现一次。
 数字 1-9 在每一列只能出现一次。
 数字 1-9 在每一个以粗实线分隔的 3x3 宫内只能出现一次。
 示例 1:
 
 输入:
 [
 ["5","3",".",".","7",".",".",".","."],
 ["6",".",".","1","9","5",".",".","."],
 [".","9","8",".",".",".",".","6","."],
 ["8",".",".",".","6",".",".",".","3"],
 ["4",".",".","8",".","3",".",".","1"],
 ["7",".",".",".","2",".",".",".","6"],
 [".","6",".",".",".",".","2","8","."],
 [".",".",".","4","1","9",".",".","5"],
 [".",".",".",".","8",".",".","7","9"]
 ]
 输出: true
 示例 2:
 
 输入:
 [
 ["8","3",".",".","7",".",".",".","."],
 ["6",".",".","1","9","5",".",".","."],
 [".","9","8",".",".",".",".","6","."],
 ["8",".",".",".","6",".",".",".","3"],
 ["4",".",".","8",".","3",".",".","1"],
 ["7",".",".",".","2",".",".",".","6"],
 [".","6",".",".",".",".","2","8","."],
 [".",".",".","4","1","9",".",".","5"],
 [".",".",".",".","8",".",".","7","9"]
 ]
 输出: false
 解释: 除了第一行的第一个数字从 5 改为 8 以外，空格内其他数字均与 示例1 相同。
 但由于位于左上角的 3x3 宫内有两个 8 存在, 因此这个数独是无效的。
 说明:
 
 一个有效的数独（部分已被填充）不一定是可解的。
 只需要根据以上规则，验证已经填入的数字是否有效即可。
 给定数独序列只包含数字 1-9 和字符 '.' 。
 给定数独永远是 9x9 形式的。
 */

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var board1 =  [[Character ]]()
          board1 =  [
            ["5" ,"3",".",".","7",".",".",".","."],
            ["6",".",".","1","9","5",".",".","."],
            [".","9","8",".",".",".",".","6","."],
            ["8",".",".",".","6",".",".",".","3"],
            ["4",".",".","8",".","3",".",".","1"],
            ["7",".",".",".","2",".",".",".","6"],
            [".","6",".",".",".",".","2","8","."],
            [".",".",".","4","1","9",".",".","5"],
            [".",".",".",".","8",".",".","7","9"]
        ];
        var board2 = [[Character ]]()
         board2 =  [
            ["8","3",".",".","7",".",".",".","."],
            ["6",".",".","1","9","5",".",".","."],
            [".","9","8",".",".",".",".","6","."],
            ["8",".",".",".","6",".",".",".","3"],
            ["4",".",".","8",".","3",".",".","1"],
            ["7",".",".",".","2",".",".",".","6"],
            [".","6",".",".",".",".","2","8","."],
            [".",".",".","4","1","9",".",".","5"],
            [".",".",".",".","8",".",".","7","9"]
        ];
        
        assert(isValidSudoku(board1) == true, "case 1 failed")
        assert(isValidSudoku(board2) == false, "case 2 failed" )
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func isValidSudoku(_ board: [[Character ]]) -> Bool {
        var x:Int = 0;
        var tmpDic = [Character: Character]()
        // 横排
        for arr  in board {
            tmpDic.removeAll()
             x = 0;
            for i in arr{
                if i != "."{
                   tmpDic[i] = i
                    x = x + 1
                }
            }
            if tmpDic.count != x {
                print(tmpDic);
                return false;
            }
        }
        
        //竖排
        for i in 0...8{
            tmpDic.removeAll()
             x = 0;
            for arr  in board {
                if arr[i] != "."{
                    tmpDic[arr[i]] = arr[i]
                    x = x + 1
                }
            }
            if tmpDic.count != x {
                print(tmpDic);
                return false;
            }
        }
//9格
        for l in 0...2{
        for k in 0...2{
            tmpDic.removeAll()
            x = 0;
            for n in  3*k...3*k+2{
                for m in  3*l...3*l+2{
                    if board[n][m] != "."{
                        tmpDic[board[n][m]] = board[n][m]
                        x = x + 1
                    }
                }
            }
            if tmpDic.count != x {
                print(tmpDic);
                return false;
            }
         }
      }
        return true;
    }
    
    
    func isValidSudoku2(_ board: [[Character ]]) -> Bool {
        //check row
        for i in 0..<board.count {
            let row = board[i]
            var nums = [Character]()
            
            for j in 0..<row.count {
                if row[j] != "." {
                    if nums.contains(row[j]) == false {
                        nums.append(row[j])
                    } else {
                        return false
                    }
                }
            }
        }
        
        //check col
        for i in 0..<board.count {
            var cols = [Character]()
            let row = board[i]
            for j in 0..<row.count {
                if board[j][i] != "." {
                    if cols.contains(board[j][i]) == false {
                        cols.append(board[j][i])
                    } else {
                        return false
                    }
                }
            }
        }
        
        //check sub board
        for i in stride(from: 0, to: board.count, by: 3) {
            for j in stride(from: 0, to: board.count, by: 3) {
                var subBoard = [Character]()
                for n in 0..<3 {
                    for m in 0..<3 {
                        if board[i + n][j + m] != "." {
                            if subBoard.contains(board[i + n][j + m]) == false {
                                subBoard.append(board[i + n][j + m])
                            } else {
                                return false
                            }
                        }
                    }
                }
            }
        }
        return true
    }

}


