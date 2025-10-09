//
//  신고결과받기Tests.swift
//  AlgorithmsTests
//
//  Created by 정근호 on 10/9/25.
//

import Foundation
import XCTest
@testable import Algorithms

final class ReportResultTests: XCTestCase {
    func test() {
        let a = ["muzi", "frodo", "apeach", "neo"]
        let b = ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"]
        let k = 2
        let result = [2,1,1,0]
        
        let answer = reportResult(a, b, k)
        XCTAssertEqual(result, answer)
    }
}

