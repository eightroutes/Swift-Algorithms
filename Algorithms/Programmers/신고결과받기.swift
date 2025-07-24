//
//  신고결과받기.swift
//  Algorithms
//
//  Created by 정근호 on 4/28/25.
//

import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    
    // [String:[String]]에 유저id:[신고한id] 저장
    // [String:Int]에 유저id:신고당한횟수 저장
    // 여기서 Int가 >= k 인값 저장 [frodo, neo]
    // [String:[String]]에서 저장된 값[frodo,neo]들의 개수가 담긴 리스트가 정답
    
    var dict = [String:[String]]()
    var reportsCount = [String:Int]()
    var bannedId = [String]()
    var result = [Int]()
    
    
    for id in id_list {
        for r in report {
            let key = r.split(separator: " ")[0]
            let value = r.split(separator: " ")[1]
            print(key, value)
            if id == key {
                dict[id] = [String(value)]
            }
            print(dict)
        }
    }
    
    print(dict)
    
    return []
}
