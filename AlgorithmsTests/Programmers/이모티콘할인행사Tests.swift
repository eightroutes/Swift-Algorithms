//
//  이모티콘할인행사Tests.swift
//  AlgorithmsTests
//
//  Created by 정근호 on 10/9/25.
//

import Foundation
import XCTest
@testable import Algorithms

final class EmoticonEventTests: XCTestCase {
    func test() {
        let a = [[40, 10000], [25, 10000]]
        let b = [7000, 9000]
        let result = [1, 5400]
        
        let answer = emoticonEvent(a, b)
        XCTAssertEqual(result, answer)
    }
}

