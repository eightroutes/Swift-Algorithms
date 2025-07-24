//
//  타겟넘버.swift
//  Algorithms
//
//  Created by 정근호 on 4/1/25.
//

import Foundation

func targetNum (_ numbers:[Int], _ target:Int) -> Int {
    
    func dfs(_ index: Int, _ sum: Int) -> Int {
        
        if index == numbers.count {
            return target == sum ? 1 : 0
        }
        return dfs(index+1, sum+numbers[index]) + dfs(index+1, sum-numbers[index])
        
    }
    return dfs(0, 0)
}


class Solution {
    func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
        nums
            .reduce(into: [0]) { sums, num in    // Compute all the sums.
                sums = sums.flatMap { [$0 + num, $0 - num] }
            }
            .filter { $0 == target }             // Retain those that equal the "target".
            .count                               // Count them.
    }
}
