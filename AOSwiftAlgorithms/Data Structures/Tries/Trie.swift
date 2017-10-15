//
//  Trie.swift
//  AOSwiftAlgorithms
//
//  Created by Altynbek Orumbayev on 10/10/17.
//  Copyright © 2017 Altynbek Orumbayev. All rights reserved.
//

import Foundation

class TrieNode<T: Hashable> {
    var value: T?
    
    weak var parent: TrieNode?
    var isTerminating = false
    var children : [T: TrieNode] = [:]
    
    init(value : T? = nil, parent : TrieNode? = nil) {
        self.value = value
        self.parent = parent
    }
    
    func add(child: T) {
        guard children[child] == nil else {return}
        children[child] = TrieNode(value: child, parent: self)
    }
}

class Trie {
    typealias Node = TrieNode<Character>
    fileprivate let root : Node
    
    init() {
        root = Node()
    }
    
    func insert(word: String) {
        guard !word.isEmpty else {return}
        
        var currentNode = root
        
        let chars = Array(word.lowercased().characters)
        var currentIndex = 0
        
        while currentIndex < chars.count {
            let character = chars[currentIndex]
            
            if let child = currentNode.children[character] {
                currentNode = child
            } else {
                currentNode.add(child: character)
                currentNode = currentNode.children[character]!
            }
            
            currentIndex += 1
        }
        
        if currentIndex == chars.count {
            currentNode.isTerminating = true
        }
    }
    
    func contains(word: String) -> Bool {
        guard !word.isEmpty else {return false}
        var currentNode = root
        
        let characters = Array(word.lowercased().characters)
        var currentIndex = 0
        
        while currentIndex < characters.count, let child = currentNode.children[characters[currentIndex]] {
            currentIndex += 1
            currentNode = child
        }
        
        if currentIndex == characters.count && currentNode.isTerminating {
            return true
        } else {
            return false
        }
    }
}
