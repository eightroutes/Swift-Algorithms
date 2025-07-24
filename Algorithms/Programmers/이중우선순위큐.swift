//
//  이중우선순위큐.swift
//  Algorithms
//
//  Created by 정근호 on 3/24/25.
//

import Foundation


func dualPriorityQueue(_ operations:[String]) -> [Int] {
    
    var queue = [Int]()
    var minMax = [0, 0]
    
    for operation in operations {
        let opr = operation.split(separator: " ")[0]
        let val = Int(operation.split(separator: " ")[1])!
        
        
        if opr == "I" {
            queue.append(val)
            queue.sort()
        } else if val == 1 {
            if !queue.isEmpty {
                queue.removeLast()
            }
        } else if val == -1 {
            if !queue.isEmpty {
                queue.removeFirst()
            }
        }
    }
    
    minMax[0] = queue.max() ?? 0
    minMax[1] = queue.min() ?? 0
    
    
    return minMax
    
    
//    var temp = [Int]()
    
//    operations.forEach { str in
//        let removeSpace = str.components(separatedBy: " ")
//        print(removeSpace)
//        let order = removeSpace[0]
//        let number = Int(removeSpace[1])!
//        
//        if order == "D" {
//            if temp.count > 0 {
//                if number == 1 {
//                    temp.remove(at: 0)
//                } else {
//                    temp.remove(at: temp.count - 1)
//                }
//            }
//        }
//        else if order == "I" {
//            temp.append(number)
//        }
//        
//        temp.sort(by: {$0 > $1})
//    }
//    
//    
//    return temp.count == 0 ? [0,0] : [temp.first!,temp.last!]
}
