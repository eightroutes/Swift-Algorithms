//
//  CursedNum3Tests.swift
//  AlgorithmsTests
//
//  Created by 정근호 on 7/24/25.
//

import XCTest
@testable import Algorithms

final class CursedNum3Tests: XCTestCase {
    func test() {
        let n = 15
        let answer = 25
        
        let result = cursedNum3(n)
        XCTAssertEqual(result, answer)
    }
}

