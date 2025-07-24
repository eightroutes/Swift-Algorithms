//
//  AlgorithmsTests.swift
//  AlgorithmsTests
//
//  Created by 정근호 on 7/24/25.
//

import XCTest
@testable import Algorithms

final class FatigueTests: XCTestCase {
    func test() {
        // TODO: 테스트 케이스를 추가하세요.
        let k = 80
        let dungeons = [[80,20],[50,40],[30,10]]
        let answer = 3
        
        let result = fatigue(k, dungeons)
        print("결과: \(result)")
        XCTAssertEqual(result, answer)
    }
}
