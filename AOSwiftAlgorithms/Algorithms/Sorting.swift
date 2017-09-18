//
//  InsertionSort.swift
//  AOSwiftAlgorithms
//
//  Created by Altynbek Orumbayev on 9/18/17.
//  Copyright © 2017 Altynbek Orumbayev. All rights reserved.
//

import Foundation

struct Sort {
    
    //MARK: - Insertion
    
    public static func insertionSort(_ array: [Int]) -> [Int] {
        var a = array
        for x in 0..<a.count {
            var y = x
            while y > 0 && a[y] < a[y-1] {
                a.swapAt((y - 1), y)
                y -= 1
            }
        }
        return a
    }
    
    public static func insertionSortWithoutSwaps(_ array: [Int]) -> [Int] {
        var a = array
        for x in 0..<a.count {
            var y = x
            let temp = a[y]
            while y > 0 && temp < a[y-1] {
                a[y] = a[y-1]
                y -= 1
            }
            a[y] = temp
        }
        return a
    }
    
    //MARK: - Selection
    
    public static func selectionSort(_ array: [Int]) -> [Int] {
        var a = array
        for x in 0..<a.count {
            var min = x
            for y in x+1..<a.count {
                if a[y] < a[min] {
                    min = y
                }
            }
            a.swapAt(x, min)
        }
        return a
    }
}

struct GSort<T> {

    //MARK: - Insertion With Generics
    
    public static func insertionSortWithGenerics(_ array: [T], _ isOrderedBefore : (T, T) -> Bool) -> [T] {
        var a = array
        for x in 0..<a.count {
            var y = x
            let temp = a[y]
            while y > 0 && isOrderedBefore(temp, a[y-1]) {
                a[y] = a[y-1]
                y -= 1
            }
            a[y] = temp
        }
        return a
    }
    
    //MARK: - Selection With Generics
    
}
