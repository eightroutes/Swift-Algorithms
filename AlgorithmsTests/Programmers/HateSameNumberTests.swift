//
//  HateSameNumberTests.swift
//  AlgorithmsTests
//
//  Created by 정근호 on 7/24/25.
//

import XCTest
@testable import Algorithms

final class HateSameNumberTests: XCTestCase {
    func test() {
        let arr = [1,1,3,3,0,1,1]
        let answer = [1,3,0,1]
        
        let result = hateSameNumber(arr)
        XCTAssertEqual(result, answer)
    }
}
