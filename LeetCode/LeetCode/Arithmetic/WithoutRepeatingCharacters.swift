//
//  WithoutRepeatingCharacters.swift
//  LeetCode
//
//  Created by zhangzb on 07/02/2018.
//  Copyright © 2018 zhangzb. All rights reserved.
//

/*
Given a string, find the length of the longest substring without repeating characters.

Examples:

Given "abcabcbb", the answer is "abc", which the length is 3.

Given "bbbbb", the answer is "b", with the length of 1.

Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
 
 */
// 方法是用一个 hash 记录每个字母出现的 index，然后把字符串扫一遍。不出现重复时就往 hash 表里填。出现重复时，从 hash 取出字母出现的 previousIndex ，把从当前串开头至 previousIndex 的字母都从 hash 中清掉。
// 看到一个更好的方法，不需要存字母出现的 index，出现重复时直接从当前串开头至出现重复字母的位置清掉 hash 即可。这种情况下也不需要用 Dictionary 存 hash，只需用 Set 即可。
// 本来 hash 需要的额外空间很小，但因为 swift 要遍历字符串中的字符必须把字符数组存出来一份。所以空间复杂度为 O(n)。
// 时间复杂度：O(n) 空间复杂度：O(n)

import UIKit

class WithoutRepeatingCharacters: NSObject {
//    //循环次数过多
//        func lengthOfLongestSubstring(_ s: String) -> Int {
//            var maxLenth = 0
//            var chars = Array(s)
//            guard chars.count > 1 else {
//                return chars.count
//            }
//            for index in 0..<chars.count {
//                var letterAppearedSet = Set<Character>()
//                var length = 1
//                while length <= chars.count - index{
//                    let char = chars[index + length - 1]
//                    if letterAppearedSet.contains(char){
//                        break
//                    }
//                    letterAppearedSet.insert(char)
//                    maxLenth = max(maxLenth, length)
//                    length += 1
//                }
//
//            }
//            return maxLenth
//        }
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var letterAppearedDict = [Character:Int]()
        var maxLenth = 0
        var currentLenth = 0
        var chars = Array(s)
        for index in 0..<chars.count {
            let char = chars[index]
            if letterAppearedDict[char] == nil{
                letterAppearedDict[char] = index
                currentLenth += 1
            }else{
                let previousIndex = letterAppearedDict[char]!
                for clearIndex in index - currentLenth..<previousIndex{
                    letterAppearedDict[chars[clearIndex]] = nil
                }
                letterAppearedDict[char] = index
                currentLenth = index - previousIndex
            }
            maxLenth = max(maxLenth, currentLenth)
        }
        return maxLenth
    }

    
    //理解错了不是简单的去重，而是找出最长的没有重复字符的子字符串的长度
//    func lengthOfLongestSubstring(_ s: String) -> Int {
//        var stringSet = Set<String>()
//        for character in s {
//            stringSet.insert(String(character))
//        }
//        return stringSet.count
//    }
    
}
