//
//  ListNode.swift
//  LeetCode
//
//  Created by zhangzb on 2018/1/15.
//  Copyright © 2018年 zhangzb. All rights reserved.
//

import UIKit

class ListNode: NSObject {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
