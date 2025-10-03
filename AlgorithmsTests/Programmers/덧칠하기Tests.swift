//
//  덧칠하기Tests.swift
//  AlgorithmsTests
//
//  Created by 정근호 on 7/25/25.
//

import XCTest
@testable import Algorithms

final class DoublePaintTests: XCTestCase {
    func test() {
        let n = 8
        let m = 4
        let section = [2, 3, 6]
        let answer = 2
        
        let result = doublePaint(n, m, section)
        XCTAssertEqual(result, answer)
    }
}

