//
//  개인정보수집유효기간Tests.swift
//  AlgorithmsTests
//
//  Created by 정근호 on 10/5/25.
//

import XCTest
@testable import Algorithms

final class personalInfoValidTests: XCTestCase {
    func test() {
        let today = "2022.05.19"
        let terms = ["A 6", "B 12", "C 3"]
        let privacies = ["2021.05.02 A", "2021.07.01 B", "2022.02.19 C", "2022.02.20 C"]
        let answer = [1, 3]
        
        let result = personalInfoValid(today, terms, privacies)
        XCTAssertEqual(result, answer)
    }
}
