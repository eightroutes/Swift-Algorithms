//
//  주차요금계산Tests.swift
//  AlgorithmsTests
//
//  Created by 정근호 on 10/8/25.
//

import Foundation
import XCTest
@testable import Algorithms

final class Tests: XCTestCase {
    func test() {
        let a = [120, 0, 60, 591]
        let b = [
            "16:00 3961 IN",
            "16:00 0202 IN",
            "18:00 3961 OUT",
            "18:00 0202 OUT",
            "23:58 3961 IN"
        ]
        let result = [0, 591]
        
        let answer = parkingFee(a, b)
        XCTAssertEqual(result, answer)
    }
}

