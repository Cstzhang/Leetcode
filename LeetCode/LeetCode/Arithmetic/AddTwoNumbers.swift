//
//  AddTwoNumbers.swift
//  LeetCode
//
//  Created by zhangzb on 2018/1/8.
//  Copyright © 2018年 zhangzb. All rights reserved.
//

import Foundation



class AddTwoNumbers:NSObject{
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l2
        }
        
        if l2 == nil {
            return l1
        }
        
        var headNode:ListNode?
        
        var head1:ListNode? = l1
        var head2:ListNode? = l2
        var carry:Int = 0
        
        while head1 != nil {
            
            let value:Int = (head1?.val)! + (head2?.val)! + carry
            
            let listNode:ListNode? = ListNode(value % 10)
            
            if headNode == nil {
                headNode = listNode
            } else {
                var nextNode:ListNode? = headNode
                while nextNode?.next != nil {
                    nextNode = nextNode?.next
                }
                nextNode?.next = listNode
            }
            carry = value / 10
            head1 = head1?.next
            head2 = head2?.next
        }
        
        return headNode
    }
    /*
     本题要求将以链表存储的两个整数相加，求和的结果依然存储在一个链表中，最后返回结果链表的头指针。
     
     题目的难点在于
     
     1. 两个整数逆序存储，低位向高位有进位时不再是向前而是向后进位。
     
     2. 两个整数不一定有相同的位数，所以遍历链表时要判断是否遍历结束，如果结束，就将其相应位置为0。
     
     3. 两个整数的最高位相加可能产生进位。
     
     综上考虑，应创建一个新的链表，其头节点为head,指向其的头指针为p,用carry表示对应位相加后的进位，sum表示相加后结果。

     */
    
}
