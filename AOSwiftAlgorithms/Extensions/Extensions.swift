//
//  Extensions.swift
//  AOSwiftAlgorithms
//
//  Created by Altynbek Orumbayev on 9/19/17.
//  Copyright © 2017 Altynbek Orumbayev. All rights reserved.
//

import Foundation

extension BinarySearchTree {
    
    public static func prettyPrint(tree: BinarySearchTree?, offset: Int) {
        guard let bTree = tree else {return}
        let height = getHeight(tree: bTree) * 2
        
        for i in 0..<height {
            printRow(tree: bTree, height: height, depth: i)
        }
    }
    
    fileprivate static func printRow(tree: BinarySearchTree?, height: Int, depth: Int) {
        
        let placeHolder = (1<<31) as! T
        var arr = [T]()
        getLineValues(tree: tree, depth: depth, arr: &arr)
        print(String.init(repeating: " ", count: (height - depth) * 2), terminator: "")
        var toogle = true
        
        if arr.count > 1
        {
            for val in arr {
                if (val != placeHolder) {
                    if toogle {
                        print("/   ", terminator: "")
                    } else {
                       print("\\   ", terminator: "")
                    }
                }
                toogle = !toogle
            }
            print("\n")
            print(String.init(repeating: " ", count: (height - depth) * 2), terminator: "")
        }
        for val in arr {
            if val != placeHolder {
                print("\(val)   ", terminator: "")
            }
        }
        print("\n")
    }
    
    fileprivate static func getLineValues(tree: BinarySearchTree?, depth: Int, arr: inout [T]) {
        
        let placeHolder = (1<<31)
        
        guard let bTree = tree else {return}
        
        if (depth <= 0 && tree != nil) {
            arr.append(bTree.value)
            return
        }
        if bTree.left != nil {
            getLineValues(tree: bTree.left, depth: depth-1, arr: &arr)
        }
        else if depth - 1 <= 0 {
            arr.append(placeHolder as! T)
        }
        if bTree.right != nil {
            getLineValues(tree: bTree.right, depth: depth-1, arr: &arr)
        }
        else if (depth - 1 <= 0) {
            arr.append(placeHolder as! T)
        }
        
    }
    
    
    public static func getHeight(tree: BinarySearchTree?) -> Int {
        if tree == nil {
            return -1
        }
        
        let lefth = getHeight(tree: tree?.left)
        let righth = getHeight(tree: tree?.right)
        
        if (lefth > righth) {
            return lefth + 1;
        } else {
            return righth + 1;
        }
    }
    
}
