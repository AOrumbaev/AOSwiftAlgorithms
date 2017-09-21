//
//  LinkedList.swift
//  AOSwiftAlgorithms
//
//  Created by Altynbek Orumbayev on 9/21/17.
//  Copyright © 2017 Altynbek Orumbayev. All rights reserved.
//

import Foundation

public class LinkedList<T> {
    public typealias Node = LinkedListNode<T>
    
    public var head: Node?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node? {
        return head
    }
    
    public var last: Node? {
        if var node = head {
            while let next = node.next {
                node = next
                print("text")
            }
            return node
        } else {
            return nil
        }
    }
    
    public func append(value: T) {
        let node = Node.init(value: value)
        if let lastNode = last {
            node.previous = lastNode
            lastNode.next = node
        } else {
            head = node
        }
    }
    
    public func count() -> Int {
        var counter = 0
        if var node = head {
            while let next = node.next {
                node = next
                counter += 1
            }
        }
        return counter
    }
    
    public func nodeAt(_ index: Int) -> Node? {
        if index >= 0 {
            var node = head
            var i = index
            while node != nil {
                if i == 0 { return node }
                i -= 1
                node = node!.next
            }
        }
        return nil
    }
    
    public subscript(index: Int) -> T {
        let node = nodeAt(index)
        assert(node != nil)
        return node!.value
    }
}
