//
//  비밀지도Tests.swift
//  AlgorithmsTests
//
//  Created by 정근호 on 10/8/25.
//

import Foundation
import XCTest
@testable import Algorithms

final class SecretMapTests: XCTestCase {
    func test() {
        let n = 6
        let arr1 = [46, 33, 33 ,22, 31, 50]
        let arr2 = [27 ,56, 19, 14, 14, 10]
        let result = ["######", "###  #", "##  ##", " #### ", " #####", "### # "]
        
        let answer = secretMap(n, arr1, arr2)
        XCTAssertEqual(result, answer)
    }
}

