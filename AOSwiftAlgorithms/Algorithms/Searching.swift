//
//  Searching.swift
//  AOSwiftAlgorithms
//
//  Created by Altynbek Orumbayev on 9/18/17.
//  Copyright © 2017 Altynbek Orumbayev. All rights reserved.
//

import Foundation

struct Search {
    
    //MARK: - Binary Search
    
    public static func binarySearch<T: Comparable>(_ array: [T], key: T, range: Range<Int>) -> Int? {
        let lowBound = range.lowerBound
        let upperBound = range.upperBound
        
        if (lowBound >= upperBound) {
            return nil
        }
            
        else {
            let midIndex = lowBound + (upperBound - lowBound) / 2
            
            if array[midIndex] > key {
                return binarySearch(array, key: key, range: lowBound..<midIndex)
            }
            
            else if array[midIndex] < key {
                return binarySearch(array, key: key, range: midIndex+1..<upperBound)
            } else {
                return midIndex
            }
        }
    }
}
