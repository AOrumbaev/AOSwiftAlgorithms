//
//  SplayTree.swift
//  AOSwiftAlgorithms
//
//  Created by Altynbek Orumbayev on 10/7/17.
//  Copyright © 2017 Altynbek Orumbayev. All rights reserved.
//

import Foundation

public enum SplayOperation {
    case zigZag
    case zigZig
    case zig
    
    public static func splay<T: Comparable>(node: Node<T>) {
        while (node.parent != nil) {
            operation(forNode: node).apply(onNode: node)
        }
    }
    
    public static func operation<T: Comparable>(forNode node: Node<t>) -> SplayOperation {
        
        if let parent = node.parent, let _= parent.parent {
            if (node.isLeftChild && parent.isRightChild) || (node.isRightChild && parent.isLeftChild) {
                return .zigZag
            }
            return .zigZig
        }
        return .zig
    }
    
    public func apply<T: Comparable>(onNode node: Node<T>) {
        switch self {
        case .zigZag:
            assert(node.parent != nil && node.parent!.parent != nil, "Shoulde be at least 2 nodes up in the tree")
            rotate(child: node, parent: node.parent!)
            rotate(child: node, parent: node.parent!)
            
        case .zigZig:
            assert(node.parent != nil && node.parent!.parent != nil, "Should be at least 2 nodes up in the tree")
            rotate(child: node.parent!, parent: node.parent!.parent!)
            rotate(child: node, parent: node.parent!)
            
        case .zig:
            assert(node.parent != nil && node.parent!.parent == nil, "There should be a parent which is the root")
            rotate(child: node, parent: node.parent!)
        }
        
        public func rotate<T: Comparable>(child: Node<T>, parent: Node<T>) {
            
            assert(child.parent != nil && child.parent!.value == parent.value, "Parent and child.parent should match here")
            
            var grandchildToMode: Node<T>
            
            if child.isLeftChild {
                
                grandchildToMode = child.right
                parent.left = grandchildToMode
                grandchildToMode?.parent = parent
                
                let grandParent = parent.parent
                child.parent = grandParent
                
                if parent.isLeftChild {
                    grandParent?.left = child
                } else {
                    grandParent?.right = child
                }
                
                child.right = parent
                parent.parent = child
                
            } else {
                
                grandchildToMode = child.left
                parent.right = grandchildToMode
                grandchildToMode?.parent = parent
                
                let grandParent = parent.parent
                child.parent = grandParent
                
                if parent.isLeftChild {
                    grandParent?.left = child
                } else {
                    grandParent?.right = child
                }
                
                child.left = parent
                parent.parent = child
                
            }
        }
    }
}

public class Node<T: Comparable> {
    
    
    fileprivate(set) public var value: T?
    fileprivate(set) public var parent: Node<T>?
    fileprivate(set) public var left: Node<T>?
    fileprivate(set) public var right: Node<T>?
    
    init(value: T) {
        self.value = value
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
    
    public var hasLeftChild: Bool {
        return left != nil
    }
    
    public var hasRightChild: Bool {
        return right != nil
    }
    
    public var hasAnyChild: Bool {
        return hasLeftChild || hasRightChild
    }
    
    public var hasBothChildren: Bool {
        return hasLeftChild && hasRightChild
    }
    
    /* How many nodes are in this subtree. Performance: O(n). */
    public var count: Int {
        return (left?.count ?? 0) + 1 + (right?.count ?? 0)
    }
    
}

public class SplayTree<T: Comparable> {
    
    internal var root: Node<T>?
    
    var value: T? {
        return root?.value
    }
    
    public init(value: T) {
        self.root = Node(value: value)
    }
    
    public func insert(value: T) {
        if let root = root {
            self.root = root.insert(value: value)
        } else {
            root = Node(value: value)
        }
    }
    
    public func remove(value: T) {
        root = root?.remove(value: value)
    }
    
    public func search(value: T) -> Node<T>? {
        root = root?.search(value: value)
        return root
    }
    
    public func minimum() -> Node<T>? {
        root = root?.minimum(splayed: true)
        return root
    }
    
    public func maximum() -> Node<T>? {
        root = root?.maximum(splayed: true)
        return root
    }
}


}

