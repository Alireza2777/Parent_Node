//
//  TreeFinder.swift
//  Parentsnode
//
//  Created by Alireza Karimi on 2023-08-02.
//
import Foundation

class TreeDiameterFinder {
    private var visited = [Bool]()
    private var distance = [Int]()
    private var tree = [Int: [(Int, Int)]]()
    private var v = 0

    init(_ v: Int, _ tree: [Int: [(Int, Int)]]) {
        self.v = v
        self.tree = tree
        self.visited = Array(repeating: false, count: v + 1)
        self.distance = Array(repeating: 0, count: v + 1)
    }

    private func dfs(_ node: Int) {
        visited[node] = true

        if let edges = tree[node] {
            for (neighbor, dist) in edges {
                if !visited[neighbor] {
                    distance[neighbor] = distance[node] + dist
                    dfs(neighbor)
                }
            }
        }
    }

    func findDiameter() -> Int {
        dfs(1)

        // Find the farthest node from the starting node
        var maxDistance = 0
        var maxNode = 1

        for i in 1...v {
            if distance[i] > maxDistance {
                maxDistance = distance[i]
                maxNode = i
            }
        }

        // Perform DFS from the farthest node to find the diameter
        visited = Array(repeating: false, count: v + 1)
        distance = Array(repeating: 0, count: v + 1)

        dfs(maxNode)

        // Find the maximum distance from the farthest node
        var diameter = 0
        for i in 1...v {
            if distance[i] > diameter {
                diameter = distance[i]
            }
        }

        return diameter
    }
}

// Sample input (you can replace this with your input)
let v = 7
let tree: [Int: [(Int, Int)]] = [
    1: [(6, 1)],
    6: [(3, 2)],
    3: [(5, 1)],
    4: [(1, 3), (7, 2)],
    2: [(4, 1)],
    7: [(-1, -1)],
]

let diameterFinder = TreeDiameterFinder(v, tree)
let diameter = diameterFinder.findDiameter()
//print(diameter)

