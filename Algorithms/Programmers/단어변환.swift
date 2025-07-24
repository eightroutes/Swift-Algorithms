//
//  단어변환.swift
//  Algorithms
//
//  Created by 정근호 on 3/20/25.
//

import Foundation


//func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
//    
//    var result = [String]()
//    var begin = begin
//    
//    if !words.contains(target) {
//        return 0
//    }
//    
//    for word in words {
//        
//        var differenceT = 0
//        for (b,t) in zip(begin, target) {
//            if b != t {
//                differenceT += 1
//            }
//        }
//        
//        if differenceT == 1 {
//            result.append(target)
//            break
//        }
//        
//        var difference = 0
//        
//        for (b,w) in zip(begin, word) {
//            if b != w {
//                difference += 1
//            }
//        }
//        
//        if difference == 1 {
//            result.append(word)
//            begin = word
//        }
//    }
//    
//    print(result)
//    return result.count
//}
//

//print(wordConvert(begin, target, words))



func wordConvert(_ begin: String, _ target: String, _ words: [String]) -> Int {
    
    if !words.contains(target) { return 0 }

    
    // BFS를 위한 큐 구현 (단어와 변환 횟수를 저장)
    var queue: [(String, Int)] = [(begin, 0)]
    var visited = Set<String>()
    var index = 0
    
    // BFS 구현 ( queue.count와 index 비교 )
    // BFS 내에서 목표 단어에 도달했다면 변환 횟수 반환
    // BFS 내에서 현재 단어에서 변환 가능한 모든 단어 탐색
    // index 값 업데이트
    while index < queue.count {
        let current = queue[index]
        let currentWord = current.0
        let count = current.1
        
        if currentWord == target {
            return count
        }
        
        for word in words {
            if !visited.contains(word) && isDiffCount1(currentWord, word) {
                visited.insert(word)
                queue.append((word, count+1))
            }
        }
        
        index += 1
    }
        
    // 변환할 수 없는 경우 0 return
    return 0
    
}

// 두 단어가 딱 한 글자만 다른지 함수 구현
func isDiffCount1(_ first: String, _ second: String) -> Bool {
    var diffCount = 0
    for (f, s) in zip(first, second) {
        if f != s {
            diffCount += 1
        }
    }
    return diffCount == 1
}


