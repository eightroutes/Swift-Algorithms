//
//  K소수개수.swift
//  Algorithms
//
//  Created by 정근호 on 10/8/25.
//

import Foundation

func kPrimeCount(_ n:Int, _ k:Int) -> Int {
    
    var count = 0
    
    // n을 k진수로
    let toRadix = String(n, radix: k)
    print(toRadix) // 211020101011 -> 211, 2, 11
    
    let separated = toRadix.components(separatedBy: "0").map { Int($0)! }.filter { $0 != 1}
    print(separated)
    
    separated.forEach {
        print($0)
        if isPrime($0) {
            count += 1
        }
    }
    
    return count
}

func isPrime(_ n:Int) -> Bool {
    
    for i in 2..<n {
        print(i)
        if n % i == 0 {
            return false
        }
    }
    return true
}
