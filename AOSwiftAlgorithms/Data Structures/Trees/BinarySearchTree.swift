//
//  BinarySearchTree.swift
//  AOSwiftAlgorithms
//
//  Created by Altynbek Orumbayev on 9/18/17.
//  Copyright © 2017 Altynbek Orumbayev. All rights reserved.
//

import Foundation

public class BinarySearchTree<T: Comparable> {
    private(set) public var value: T
    private(set) public var parent: BinarySearchTree?
    private(set) public var left: BinarySearchTree?
    private(set) public var right: BinarySearchTree?
    
    public init(value: T) {
        self.value = value
    }
    
    public convenience init(array: [T]) {
        precondition(array.count > 0)
        self.init(value: array.first!)
        for v in array.dropFirst() {
            insert(v)
        }
    }
    
    public var isRoot: Bool {
        return parent == nil
    }
    
    public var isLeaf: Bool {
        return left == nil && right == nil
    }
    
    public var isLeftChild: Bool {
        return parent?.left === self
    }
    
    public var isRightChild: Bool {
        return parent?.right === self
    }
    
    public var hasLeftChild : Bool {
        return left != nil
    }
    
    public func insert(_ value: T) {
        if value < self.value {
            if let left = self.left {
                left.insert(value)
            } else {
                left = BinarySearchTree<T>.init(value: value)
                left?.parent = self
            }
        } else {
            if let right = self.right {
                right.insert(value)
            } else {
                right = BinarySearchTree<T>.init(value: value)
                right?.parent = self
            }
        }
    }
}
