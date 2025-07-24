//
//  큰수만들기.swift
//  Algorithms
//
//  Created by 정근호 on 4/14/25.
//

import Foundation

func makeBigNumber(_ number:String, _ k:Int) -> String {
    
    
//    var stack = [Character]()
//    var number: [Character] = number.map { $0 }
//    var answer = ""
//    var sortedNumber = number.sorted{ $0 > $1 }.prefix(number.count - k)
//    var array: [String?] = Array(repeating: nil, count: number.count)
//    
//    print(sortedNumber)
//    
//    for snum in sortedNumber {
//        var index = number.firstIndex(of: snum)!
//        array[index] = String(snum)
//        number[index] = "0"
//    }
//    
//    print(array)
//    
//    answer = array.compactMap { $0 }.joined()
//    
//    return answer
    
    var stack = [Character]()
    var removeCount = k
    
    for num in number {
        while removeCount > 0, let last = stack.last, last < num {
            stack.removeLast()
            removeCount -= 1
        }
        stack.append(num)
    }
    
    return stack.map { String($0) }.prefix(number.count - k).joined()
}


