//
//  저주의숫자3.swift
//  Algorithms
//
//  Created by 정근호 on 7/24/25.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/120871

import Foundation

func cursedNum3(_ n: Int) -> Int {
    
/// 존재하지 않는 인덱스를 접근할 수 있음!
//    var answer = 0
//    var numList = [Int]()
//    for i in 1...100 {
//        if i % 3 != 0 && !i.description.contains("3") {
//            numList.append(i)
//        }
//    }
//
//    print(numList)
//    print(numList.count - 1)
//
//    answer = numList[n]
//
//    return answer
    
    var answer = 0
    var i = 0
    
    while answer < n {
        i += 1
        if i % 3 != 0 && !i.description.contains("3") {
            answer += 1
        }
    }
    
    return i
}
