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
    
    // split - 빈문자열 제거 vs components - 빈문자열 포함
    let separated = toRadix
        .split(separator: "0")
        .map { Int($0)! }
        .filter { $0 >= 2 }
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
    
//    let sqrtedN = Int(sqrt(Double(n)))
    // sqrt() - C, .squareRoot() - Swift
    let sqrtedN = Int(Double(n).squareRoot())
    if sqrtedN < 2 { return true }
            
    for i in 2...sqrtedN {
        print(i)
        if n % i == 0 {
            return false
        }
    }
    return true
}
