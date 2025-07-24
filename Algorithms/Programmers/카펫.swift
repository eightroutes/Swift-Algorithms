//
//  카펫.swift
//  Algorithms
//
//  Created by 정근호 on 3/31/25.
//

import Foundation

func carpet(_ brown:Int, _ yellow:Int) -> [Int] {
    
//    let area = brown + yellow
//    var width: Int
//    var height: Int
//    var result = [Int]()
//    
//    for i in 1 ... area {
//        height = i
//        for j in i ... area {
//            width = j
//            if width * height == area && (width + height) * 2 - 4 == brown {
//                result.append(width)
//                result.append(height)
//            }
//        }
//    }
//    
//    return result
    
    let area = brown + yellow
    
    // width가 height보다 커야함, area의 제곱근은 최대 정사각형일때의 height값. -> 최대 height = 정사각형일때 height
    // yellow가 1로 최소일때, height는 최소 3
    
    print(Double(area).squareRoot())

    
    for height in 3 ... Int(sqrt(Double(area))) {
        // area = width * height, 둘 다 정수값이어야 함
        if area % height == 0 {
            // 여기서 실수값 height가 들어오게 되는 것 방지
            let width = area / height
            if (width*2 + height*2 - 4) == brown && (width - 2) * (height - 2) == yellow {
                return [width, height]
            }
        }
    }
    
    return []
}
