//
//  섬연결하기.swift
//  Algorithms
//
//  Created by 정근호 on 4/11/25.
//

import Foundation

//func solution(_ n: Int, _ costs: [[Int]]) -> Int {
//    var parent = Array(0..<n)
//    
//    func find(_ x: Int) -> Int {
//        if parent[x] != x {
//            parent[x] = find(parent[x])
//        }
//        return parent[x]
//    }
//    
//    func union(_ a: Int, _ b: Int) {
//        let rootA = find(a)
//        let rootB = find(b)
//        if rootA != rootB {
//            parent[rootB] = rootA
//        }
//    }
//    
//    let sortedCosts = costs.sorted { $0[2] < $1[2] }
//    var result = 0
//    var edgeCount = 0
//    
//    for edge in sortedCosts {
//        let (a, b, cost) = (edge[0], edge[1], edge[2])
//        if find(a) != find(b) {
//            union(a, b)
//            result += cost
//            edgeCount += 1
//        }
//        if edgeCount == n - 1 {
//            break
//        }
//    }
//    
//    return result
//}

// costs [섬1번호, 섬2번호, 건설비용]

/*
 1. **모든 다리(간선)를 비용 기준으로 오름차순 정렬**
 2. **가장 가중치(비용)이 적은 다리부터 선택**
 3. **단, 이미 연결된 섬들 사이에 다리를 놓으면 사이클이 생기므로 이를 방지해야 함**
 4. **총 n-1개의 다리를 선택하면 모든 섬이 연결됨**
*/

//func connectIsland(_ n: Int, _ costs: [[Int]]) -> Int {
//    
//    var answer = 0
//
//    let costsSorted = costs.sorted { $0[2] < $1[2] }
//
//    print(costsSorted)
//    
//    var selected = [Set<Int>]()
//    for cost in costsSorted {
//                
//        if selected.contains(Set(cost)) {
//            continue
//        }
//        
//        selected.append(Set(cost))
//        
//        answer += cost[2]
//        
//        if selected.count == n-1 {
//            return answer
//        }
//    }
//    
//    return 0
//}


// 크루스칼 알고리즘 구현:
// 1. 모든 간선을 비용(가중치) 기준으로 오름차순 정렬
// 2. 비용이 가장 작은 섬(간선)부터 선택
// 3. 선택한 섬(간선)이 사이클을 형성하지 않는 경우에만 MST에 포함
// 4. (n-1)개의 섬(간선)을 선택할 때까지 2~3단계 반복

//func connectIsland(_ n: Int, _ costs: [[Int]]) -> Int {
//    // 부모 노드를 저장할 배열 초기화
//    // 초기에는 각 노드의 부모를 자기 자신으로 설정
//    var parent = [Int](0..<n)
//    
//    // 1. 모든 간선을 비용(가중치) 기준으로 오름차순 정렬
//    let sortedCosts = costs.sorted { $0[2] < $1[2] }
//    
//    var totalCost = 0 // 최종 MST의 총 비용
//    var edgeCount = 0 // 현재까지 선택한 간선의 수
//    
//    // 2. 비용이 가장 작은 섬(간선)부터 선택하는 과정 시작
//    for cost in sortedCosts {
//        let from = cost[0]    // 시작 섬
//        let to = cost[1]      // 도착 섬
//        let weight = cost[2]  // 다리 건설 비용
//        
//        print("cost: \(cost)")
//        
//        // 3. 선택한 간선이 사이클을 형성하지 않는 경우에만 MST에 포함
//        if findParent(&parent, from) != findParent(&parent, to) {
//            union(&parent, from, to)
//            print("unioned: \(parent)")
//            totalCost += weight
//            edgeCount += 1
//            // 4. (n-1)개의 간선을 선택하면 알고리즘 종료
//            // 참고로 MST는 항상 (정점 수 - 1)개의 간선을 가짐
//            if edgeCount == n - 1 {
//                break
//            }
//        }
//    }
//    
//    // 최소 비용 반환
//    return totalCost
//}
//
//// 3. 선택한 섬(간선)이 사이클을 형성하지 않는 경우를 판단하기 위해 필요한 함수들
//
//// Find 연산: 노드의 루트 노드(집합의 대표)를 찾는 함수
//// 두 노드가 같은 집합에 속하는지(같은 루트를 가지는지) 확인하여 사이클 형성 여부를 판단합니다.
//func findParent(_ parent: inout [Int], _ node: Int) -> Int {
//    // 자신이 루트 노드가 아니라면
//    // 재귀적으로 루트를 찾고, 그 결과를 바로 parent 배열에 저장
////    if node != parent[node] {
////        return findParent(&parent, parent[node])
////    } else {
////        return parent[node]
////    }
////    if node != parent[node] {
////        parent[node] = findParent(&parent, parent[node])
////        print(parent)
////        return parent[node]
////    } else {
////        return parent[node]
////    }
//    if node != parent[node] {
//        print("findParent: \(parent)")
//        parent[node] = findParent(&parent, parent[node])
//    }
//    return parent[node]
//}
//
//// Union 연산: 두 집합을 하나로 합치는 함수
//// 사이클 없이 모든 정점을 연결하는 신장 트리를 구성하기 위해 필요합니다.
//func union(_ parent: inout [Int], _ a: Int, _ b: Int) {
//    // 각 노드가 속한 집합의 루트 노드 찾기
//    let rootA = findParent(&parent, a)
//    let rootB = findParent(&parent, b)
//    // 두 루트 노드의 값을 비교하여 일정한 규칙으로 부모를 정해
//    // 합치는 방향을 일관되게 유지하며
//    // 두 집합 합치기
//    parent[rootB] = rootA
//}


func connectIsland(_ n: Int, _ costs: [[Int]]) -> Int {
    // 부모 노드를 저장할 배열 초기화
    // 초기에는 각 노드의 부모를 자기 자신으로 설정
    var parent = [Int](0..<n)
    
    // 1. 모든 간선을 비용(가중치) 기준으로 오름차순 정렬
    let sortedCosts = costs.sorted { $0[2] < $1[2] }
    
    var totalCost = 0 // 최종 MST의 총 비용
    var edgeCount = 0 // 현재까지 선택한 간선의 수
    
    // 2. 비용이 가장 작은 섬(간선)부터 선택하는 과정 시작
    for cost in sortedCosts {
        let from = cost[0]    // 시작 섬
        let to = cost[1]      // 도착 섬
        let weight = cost[2]  // 다리 건설 비용
        
        print("cost: \(cost)")
        
        // 3. 선택한 간선이 사이클을 형성하지 않는 경우에만 MST에 포함
        if findParent(&parent, from) != findParent(&parent, to) {
            union(&parent, from, to)
            print("unioned: \(parent)")
            totalCost += weight
            edgeCount += 1
            // 4. (n-1)개의 간선을 선택하면 알고리즘 종료
            // 참고로 MST는 항상 (정점 수 - 1)개의 간선을 가짐
            if edgeCount == n - 1 {
                break
            }
        }
    }
    
    // 최소 비용 반환
    return totalCost
}

// 3. 선택한 섬(간선)이 사이클을 형성하지 않는 경우를 판단하기 위해 필요한 함수들

// Find 연산: 노드의 루트 노드(집합의 대표)를 찾는 함수
// 두 노드가 같은 집합에 속하는지(같은 루트를 가지는지) 확인하여 사이클 형성 여부를 판단합니다.
func findParent(_ parent: inout [Int], _ node: Int) -> Int {
    // 자신이 루트 노드가 아니라면
    // 재귀적으로 루트를 찾고, 그 결과를 바로 parent 배열에 저장
    if node != parent[node] {
        print("findParent: \(parent)")
        parent[node] = findParent(&parent, parent[node])
    }
    return parent[node]
}

// Union 연산: 두 집합을 하나로 합치는 함수
// 사이클 없이 모든 정점을 연결하는 신장 트리를 구성하기 위해 필요합니다.
func union(_ parent: inout [Int], _ a: Int, _ b: Int) {
    // 각 노드가 속한 집합의 루트 노드 찾기
    let rootA = findParent(&parent, a)
    let rootB = findParent(&parent, b)
    // 두 루트 노드의 값을 비교하여 일정한 규칙으로 부모를 정해
    // 합치는 방향을 일관되게 유지하며
    // 두 집합 합치기
//    parent[rootB] = rootA
    if rootB < rootA {
        parent[rootA] = rootB
    } else {
        parent[rootB] = rootA
    }
}
