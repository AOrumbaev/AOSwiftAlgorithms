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
    
    //MARK: - Merge
    
    func mergeSortBottomUp<T>(_ a: [T], _ isOrderedBefore: (T, T) -> Bool) -> [T] {
        let n = a.count
        
        var z = [a, a]      // 1
        var d = 0
        
        var width = 1
        while width < n {   // 2
            
            var i = 0
            while i < n {     // 3
                
                var j = i
                var l = i
                var r = i + width
                
                let lmax = min(l + width, n)
                let rmax = min(r + width, n)
                
                while l < lmax && r < rmax {                // 4
                    if isOrderedBefore(z[d][l], z[d][r]) {
                        z[1 - d][j] = z[d][l]
                        l += 1
                    } else {
                        z[1 - d][j] = z[d][r]
                        r += 1
                    }
                    j += 1
                }
                while l < lmax {
                    z[1 - d][j] = z[d][l]
                    j += 1
                    l += 1
                }
                while r < rmax {
                    z[1 - d][j] = z[d][r]
                    j += 1
                    r += 1
                }
                
                i += width*2
            }
            
            width *= 2
            d = 1 - d      // 5
        }
        return z[d]
    }
    
    public static func mergeSort(_ array: [Int]) -> [Int] {
        
        guard array.count > 1 else { return array }
        
        let middleIndex = array.count / 2
        
        let leftArray = mergeSort(Array(array[0..<middleIndex]))
        
        let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
        
        return merge(leftPile: leftArray, rightPile: rightArray)
    }
    
    fileprivate static func merge(leftPile: [Int], rightPile: [Int]) -> [Int] {
        var leftIndex = 0
        var rightIndex = 0
        
        var orderedPile = [Int]()
        
        while leftIndex < leftPile.count && rightIndex < rightPile.count {
            if leftPile[leftIndex] < rightPile[rightIndex] {
                orderedPile.append(leftPile[leftIndex])
                leftIndex += 1
            }
            else if rightPile[rightIndex] < leftPile[leftIndex] {
                orderedPile.append(rightPile[rightIndex])
                rightIndex += 1
            }
            else {
                orderedPile.append(leftPile[leftIndex])
                leftIndex += 1
                orderedPile.append(rightPile[rightIndex])
                rightIndex += 1
            }
        }
        
        while leftIndex < leftPile.count {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
        }
        
        while rightIndex < rightPile.count {
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        }
        
        return orderedPile
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
