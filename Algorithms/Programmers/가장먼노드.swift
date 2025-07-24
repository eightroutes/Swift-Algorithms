//
//  가장먼노드.swift
//  Algorithms
//
//  Created by 정근호 on 3/26/25.
//

import Foundation

var distances = [Int:Int]()
var visited = [Bool]()
var edges = [[Int]]()
var q:[Int] = []

func mostFarNode(_ n:Int, _ edge:[[Int]]) -> Int {
    
    visited = Array(repeating: false, count: n+1)
    edges = Array(repeating:[], count: n+1)
    print("edge: \(edge)")
    edge.forEach() {
        edges[$0[0]].append($0[1])
        edges[$0[1]].append($0[0])
    }
    print("edges: \(edges)")
    distances[0] = 0; distances[1] = 0
    q.append(1)
    var start = 0
    while start < q.count {
        let current = q[start]
        let d = distances[current]! + 1
        visited[current] = true
        print(current, d, edges[current])
        for e in edges[current] {
            if !visited[e] {
                if distances[e] == nil {
                    distances[e] = d
                } else {
                    distances[e] = min(distances[e]!, d)
                }
                q.append(e)
            }
        }
        start += 1
    }
    print(visited)
    print(distances)
    let maxd = distances.values.max()!
    return distances.filter({$0.value == maxd}).count
}
