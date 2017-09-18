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
    
    
    public static func binarySearchIterative<T: Comparable>(_ array: [T], key: T) -> Int? {
        var lowBound = 0
        var upperBound = array.count
        
        while lowBound < upperBound {
            let midIndex = lowBound + (upperBound - lowBound)/2
            
            if array[midIndex] == key {
                return midIndex
            }
            else if array[midIndex] < key {
                lowBound = midIndex + 1
            } else {
                upperBound = midIndex
            }
        }
        
        return nil
    }
}

// Boyer-Moore String Search

extension String {
    //MARK: - Boyer-Moore
    func index(of pattern: String) -> Index? {
        let patternLength = pattern.characters.count
        guard patternLength > 0, patternLength <= characters.count else {return nil}
        
        var skipTable = [Character: Int]()
        for (i, c) in pattern.characters.enumerated() {
            skipTable[c] = patternLength - i - 1
        }
        
        let p = pattern.index(before: pattern.endIndex)
        let lastChar = pattern[p]
        
        var i = index(startIndex, offsetBy: patternLength - 1)
        
        func backwards() -> Index? {
            var q = p
            var j = i
            while q > pattern.startIndex {
                j = index(before: j)
                q = index(before: q)
                if self[j] != pattern[q] {return nil}
            }
            return j
        }
        
        while i < endIndex {
            let c = self[i]
            
            if c == lastChar {
                if let k = backwards() {return k}
                i = index(after: i)
            } else {
                i = index(i, offsetBy: skipTable[c] ?? patternLength, limitedBy: endIndex) ?? endIndex
            }
        }
        
        return nil
    }
    
    //MARK: - Boyer-Moore-Horspool
    func indexHorspool(of pattern: String) -> Index? {
        // Cache the length of the search pattern because we're going to
        // use it a few times and it's expensive to calculate.
        let patternLength = pattern.characters.count
        guard patternLength > 0, patternLength <= characters.count else { return nil }
        
        // Make the skip table. This table determines how far we skip ahead
        // when a character from the pattern is found.
        var skipTable = [Character: Int]()
        for (i, c) in pattern.characters.enumerated() {
            skipTable[c] = patternLength - i - 1
        }
        
        // This points at the last character in the pattern.
        let p = pattern.index(before: pattern.endIndex)
        let lastChar = pattern[p]
        
        // The pattern is scanned right-to-left, so skip ahead in the string by
        // the length of the pattern. (Minus 1 because startIndex already points
        // at the first character in the source string.)
        var i = index(startIndex, offsetBy: patternLength - 1)
        
        // This is a helper function that steps backwards through both strings
        // until we find a character that doesn’t match, or until we’ve reached
        // the beginning of the pattern.
        func backwards() -> Index? {
            var q = p
            var j = i
            while q > pattern.startIndex {
                j = index(before: j)
                q = index(before: q)
                if self[j] != pattern[q] { return nil }
            }
            return j
        }
        
        // The main loop. Keep going until the end of the string is reached.
        while i < endIndex {
            let c = self[i]
            
            // Does the current character match the last character from the pattern?
            if c == lastChar {
                
                // There is a possible match. Do a brute-force search backwards.
                if let k = backwards() { return k }
                
                // Ensure to jump at least one character (this is needed because the first
                // character is in the skipTable, and `skipTable[lastChar] = 0`)
                let jumpOffset = max(skipTable[c] ?? patternLength, 1)
                i = index(i, offsetBy: jumpOffset, limitedBy: endIndex) ?? endIndex
            } else {
                // The characters are not equal, so skip ahead. The amount to skip is
                // determined by the skip table. If the character is not present in the
                // pattern, we can skip ahead by the full pattern length. However, if
                // the character *is* present in the pattern, there may be a match up
                // ahead and we can't skip as far.
                i = index(i, offsetBy: skipTable[c] ?? patternLength, limitedBy: endIndex) ?? endIndex
            }
        }
        return nil
    }
}
