//
//  같은숫자는싫어.swift
//  Algorithms
//
//  Created by 정근호 on 7/24/25.
//

import Foundation

func hateSameNumber(_ arr: [Int]) -> [Int] {
    var answer = [Int]()
    for num in arr {
        if answer.last != num {
            answer.append(num)
        }
    }
    return answer
}
