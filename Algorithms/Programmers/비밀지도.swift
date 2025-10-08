//
//  비밀지도.swift
//  Algorithms
//
//  Created by 정근호 on 10/3/25.
// https://school.programmers.co.kr/learn/courses/30/lessons/17681

import Foundation

func secretMap(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    
//    var map = Array(repeating: Array(repeating: " ", count: n), count: n)
    
    for i in 0..<arr1.count {
//        let binary1 = String(arr1[i], radix: 2)
//        let binary2 = String(arr2[i], radix: 2)
//        let test = String(9, radix: 2)
//        print(test)
        let didOr = arr1[i] | arr2[i]
        var binary = String(didOr, radix: 2)
        if binary.count != n {
            let zeroCount = n - binary.count
            for _ in 0..<zeroCount {
                binary = "0" + binary
            }
        }
        print(binary)
        let toSharp = binary.map {
            $0 == "1" ? "#" : " "
        }.joined()
        print(toSharp)
        
        answer.append(toSharp)
    }
    
    print(answer)
    return answer
}
