//
//  LinkedListNode.swift
//  AOSwiftAlgorithms
//
//  Created by Altynbek Orumbayev on 9/21/17.
//  Copyright © 2017 Altynbek Orumbayev. All rights reserved.
//

import Foundation

public class LinkedListNode<T> {
    
    var value: T
    var next: LinkedListNode?
    weak var previous: LinkedListNode?
    
    public init(value: T) {
        self.value = value
    }
    
}
