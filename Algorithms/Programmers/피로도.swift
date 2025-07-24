//
//  피로도.swift
//  Algorithms
//
//  Created by 정근호 on 4/2/25.
//

import Foundation

func fatigue(_ k:Int, _ dungeons:[[Int]]) -> Int {
    
    var maxDungeonCount = 0
    var visited = [Bool](repeating: false, count: dungeons.count)
    var cycleCount = 0
    
    func dfs(_ fatigue: Int, _ count: Int) {
        print("dfsCount: \(cycleCount)")
        cycleCount+=1
        
        maxDungeonCount = max(maxDungeonCount, count)
        
        for i in 0..<dungeons.count {
            print(i, dungeons[i], visited, maxDungeonCount, fatigue)
            
            let (required, consume) = (dungeons[i][0], dungeons[i][1])
            
            if !visited[i] && fatigue >= required {
                visited[i] = true
                dfs(fatigue - consume, count+1)
                visited[i] = false
            }
        }
    }
    
    dfs(k, 0)
    
    
    return maxDungeonCount
    

//    var visited = Array(repeating: false, count: dungeons.count)
//    var maxCount = 0
//    
//    func dfs(_ fatigue: Int, _ count: Int) {
//        maxCount = max(maxCount, count)
//        
//        for i in dungeons.indices {
//
//            let required = dungeons[i][0]
//            let consume = dungeons[i][1]
//            
//            if !visited[i] && required > consume {
//                visited[i] = true
//                dfs(fatigue - consume, count+1)
//                visited[i] = false
//            }
//        }
//    }
//    dfs(k, 0)
//    
//    return maxCount

}


