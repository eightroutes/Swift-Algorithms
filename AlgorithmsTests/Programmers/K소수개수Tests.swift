//
//  K소수개수Tests.swift
//  AlgorithmsTests
//
//  Created by 정근호 on 10/8/25.
//

import Foundation
import XCTest
@testable import Algorithms

final class kPrimeCountTests: XCTestCase {
    func test() {
        let n = 437674
        let k = 3
        let result = 3
        
        let answer = kPrimeCount(n, k)
        XCTAssertEqual(result, answer)
    }
}

