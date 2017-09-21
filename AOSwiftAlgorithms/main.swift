//
//  main.swift
//  AOSwiftAlgorithms
//
//  Created by Altynbek Orumbayev on 9/18/17.
//  Copyright © 2017 Altynbek Orumbayev. All rights reserved.
//

import Foundation

//MARK: - DataStructures
//MARK: -
//MARK: Stack
var testStack = Stack<String>()
testStack.push("hello")
testStack.push("world")
print(testStack)
let lastItem = testStack.pop()
print("\(testStack) last item \(lastItem)")

//MARK:  Queue
var testQueue = Queue<Int>()
testQueue.enqueue(4)
testQueue.enqueue(2)
testQueue.enqueue(19)
print(testQueue)
let firstItem = testQueue.dequeue()
print("\(testQueue) first item \(firstItem)")

//MARK:  EfficientQueue
var q = EfficientQueue<String>()
print(q.array)

//MARK: Binary Search Tree
var bsTree = BinarySearchTree<Int>.init(array: [7, 2, 5, 10, 9, 1])
BinarySearchTree.prettyPrint(tree: bsTree, offset: 0)

//MARK: Ordered Array

var sortedArr = OrderedArray<Int>(array: [5, 6, 10])
sortedArr.insert(-5)
sortedArr.insert(3)
sortedArr.insert(7)


//MARK: Linked List

var llist = LinkedList<Int>.init()
llist.append(value: 4)
llist.append(value: 6)
llist.append(value: -1)
print("head = \(llist.head?.value), first = \(llist.first?.value)\n\(llist.count())")

// ----------------------------------------------------------------------
//MARK: - Algorithms
//MARK: - Sorting
//MARK: Insertion Sort
let list = [ 10, -1, 3, 9, 2, 27, 8, 5, 1, 3, 0, 26]
print(Sort.insertionSort(list))
print(GSort.insertionSortWithGenerics(list, >))

//MARK: Selection Sort
print(Sort.selectionSort(list))


//MARK: - Searching
//MARK: Binary Search
let binaryList = Sort.selectionSort([10, -1, 3, 9, 2, 27, 8, 5, 1, 3, 0, 26])
print(Search.binarySearch(binaryList, key: 10, range: 0..<binaryList.count))

//MARK: Boyer-Moore String pattern

let index = "Hello World".index(of: "l")
print(index?.encodedOffset)
