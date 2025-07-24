//
//  표편집.swift
//  Algorithms
//
//  Created by 정근호 on 4/30/25.
//

import Foundation

func chart(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    
    // count n개의 배열 생성
    // 스타트 지점 k 설정
    // cmd에서 U 업, D 다운, C 삭제, Z 되돌리기 .split(separator:" ") 이용

    // 선택된 인덱스에 1을 넣어줬는데 그걸로 답을 매겨버림
    
    // 효율성 - Linked List
    
    // 기존 로직 - U, D value가 두자리 이상인 경우 안됨
    
    var array = Array(repeating: "O", count: n)
    
    var currentIndex = k
    var removedIndex = [Int]()
        
    for str in cmd {
        print(str)
        if str.count == 1 {
            switch str {
            case "C":
                if currentIndex - 1 > 0 {
                    array[currentIndex] = "X"
                    removedIndex.append(currentIndex)
                    currentIndex -= 1
                } else {
                    array[currentIndex] = "X"
                    removedIndex.append(currentIndex)
                    currentIndex += 1
                }
            case "Z":
                if let popedIndex = removedIndex.popLast() {
                    array[popedIndex] = "O"
                }
            default:
                break
            }
            
        } else {
            let components = str.split(separator: " ")
            let direction = components[0]
            guard let value = Int(components[1]) else { break }
            
            switch direction {
            case "U":
                if currentIndex - value >= 0 {
                    currentIndex = currentIndex - value
                } else {
                    break
                }
            case "D":
                if currentIndex + value <= n {
                    currentIndex = currentIndex + value
                } else {
                    break
                }
            default:
                break
            }
        }
        print(array, currentIndex)
    }
    return array.joined()
}
