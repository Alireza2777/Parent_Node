//
//  main.swift
//  Parentsnode
//
//  Created by Alireza Karimi on 2023-08-02.
// get help by chatgpt but Im sure I undrestand the tree consepts 

import Foundation

func getParentNode(_ n: Int, _ edges: [(Int, Int)]) -> [Int] {
    var parentNodes = Array(repeating: -1, count: n + 1)
    var adjacencyList = [Int: [Int]]()
    
    for (a, b) in edges {
        if adjacencyList[a] == nil {
            adjacencyList[a] = []
        }
        adjacencyList[a]?.append(b)
    }
    
    var stack = [(node: 1, parent: -1)]
    
    while !stack.isEmpty {
        let (currentNode, parentNode) = stack.removeLast()
        parentNodes[currentNode] = parentNode
        
        if let children = adjacencyList[currentNode] {
            for child in children {
                stack.append((child, currentNode))
            }
        }
    }
    
    return parentNodes
}

// Sample input
let n = 7
let edges = [(1, 6), (6, 3), (3, 5), (4, 1), (2, 4), (4, 7)]

let parentNodes = getParentNode(n, edges)

for i in 2...n {
    print(parentNodes[i])
}




