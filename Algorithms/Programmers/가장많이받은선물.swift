//
//  가장많이받은선물.swift
//  Algorithms
//
//  Created by 정근호 on 3/21/25.
//

//import Foundation
//
//func gift(_ friends:[String], _ gifts:[String]) -> Int {
//    
//    let friendMap = Dictionary(
//        uniqueKeysWithValues: friends.enumerated().map { ($1, $0)
//        })
//    let n = friends.count
//    
//    var giftTable = Array(repeating: Array(repeating: 0, count: 4), count: n)
//    var given = Array(repeating: 0, count: n)
//    var received = Array(repeating: 0, count: n)
//    
//    for gift in gifts {
//        let parts = gift.split(separator: " ").map { String($0) }
//        let giver = friendMap[parts[0]]!
//        let receiver = friendMap[parts[1]!
//        giftTable[giver][receiver] += 1
//        given[giver] += 1
//
//    }
//    
//
//    return 0
//}
