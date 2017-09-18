//
//  main.swift
//  AOSwiftAlgorithms
//
//  Created by Altynbek Orumbayev on 9/18/17.
//  Copyright © 2017 Altynbek Orumbayev. All rights reserved.
//

import Foundation


//MARK: - Stack
var testStack = Stack<String>()
testStack.push("hello")
testStack.push("world")
print(testStack)
let lastItem = testStack.pop()
print("\(testStack) last item \(lastItem)")

//MARK: - Queue
var testQueue = Queue<Int>()
testQueue.enqueue(4)
testQueue.enqueue(2)
testQueue.enqueue(19)
print(testQueue)
let firstItem = testQueue.dequeue()
print("\(testQueue) first item \(firstItem)")

//MARK: - EfficientQueue
var q = EfficientQueue<String>()
print(q.array)
