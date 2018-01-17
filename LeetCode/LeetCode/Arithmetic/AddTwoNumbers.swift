//
//  AddTwoNumbers.swift
//  LeetCode
//
//  Created by zhangzb on 2018/1/8.
//  Copyright © 2018年 zhangzb. All rights reserved.
//

import Foundation



class ListNode: NSObject {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    /// show listNode desc
    ///
    /// - Returns: listNode desc
    func desc()->String{
        var ret:String = String(val)
        var node = next
        while node != nil {
            ret = ret.appendingFormat("->%d", (node?.val)!)
            node=node!.next
        }
        return ret
    }
    
     /// create a listNode with string
     ///
     /// - Parameter str: string like "1->2->3"
     /// - Returns: listNode
    func ListNodeCreate(str: String) ->ListNode {
        // 字符串分割 "->"
        let str:[String] = str.components(separatedBy: "->")
        var list:ListNode = ListNode(-1)
        let ret = list
        for s in str {
            list.next = ListNode(Int(s)!)
            list=list.next!
        }
        return ret.next!
    }
}

class AddTwoNumbers:NSObject{
    
    func addTwoNumbers(l1: ListNode?, l2: ListNode?) -> ListNode? {
        let dummyHead:ListNode = ListNode.init(0)
        var l1 = l1
        var l2 = l2
        if l1 == nil && l2 == nil {
            return dummyHead
        }
        var sum:Int = 0
        var carry:Int = 0
        var curr:ListNode = dummyHead
        while l1 != nil || l2 != nil {
            let num1 = l1 == nil ? 0 : l1?.val
            let num2 = l2 == nil ? 0 : l2?.val
            sum = num1! + num2! + carry
            curr.next = ListNode.init(sum % 10)
            curr = curr.next!
            carry = sum / 10
            l1 = l1 == nil ? nil : l1?.next
            l2 = l2 == nil ? nil : l2?.next
        }
        if carry != 0 {
            curr.next = ListNode.init(carry)
        }
        return dummyHead.next
    }
    /*
     You are given two linked lists representing two non-negative numbers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
     Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
     Output: 7 -> 0 -> 8
     需要注意以下几点：
     1.因为存储是反过来的，即数字342存成2->4->3，所以要注意进位是向后的；
     2.链表l1或l2为空时，直接返回，这是边界条件，省掉多余的操作；
     3.链表l1和l2长度可能不同，因此要注意处理某个链表剩余的高位；
     4.2个数相加，可能会产生最高位的进位，因此要注意在完成以上1－3的操作后，判断进位是否为0，不为0则需要增加结点存储最高位的进位。
     */
}
