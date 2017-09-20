//
//  SortedArray.swift
//  AOSwiftAlgorithms
//
//  Created by Altynbek Orumbayev on 9/20/17.
//  Copyright © 2017 Altynbek Orumbayev. All rights reserved.
//

import Foundation

struct OrderedArray<T: Comparable> {
    
    fileprivate var array = [T]()
    
    public init(array: [T]) {
        self.array = array.sorted()
    }
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public subscript(index: Int) -> T {
        return array[index]
    }
    
    public mutating func removeAtIndex(index: Int) -> T {
        return array.remove(at: index)
    }
    
    public mutating func removeAll() {
        array.removeAll()
    }
    
    public mutating func insert(_ element: T) -> Int {
        let sortedPos = self.findSortedPos(element)
        array.insert(element, at: sortedPos)
        return sortedPos
    }
    
    fileprivate func findSortedPos(_ element: T) -> Int {
        
        var startIndex = 0
        var endIndex = self.count
        
        while startIndex < endIndex {
            let midIndex = startIndex + (endIndex - startIndex) / 2
            
            if element == array[midIndex] {
                return midIndex
            }
            else if element > array[midIndex] {
                startIndex = midIndex + 1
            }
            else {
                endIndex = midIndex
            }
        }
        
        return startIndex
    }
}

extension OrderedArray: CustomStringConvertible {
    public var description: String {
        return array.description
    }
}
