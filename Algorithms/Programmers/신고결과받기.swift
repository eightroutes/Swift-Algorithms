//
//  신고결과받기.swift
//  Algorithms
//
//  Created by 정근호 on 4/28/25.
//

import Foundation

func reportResult(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    
    // [String:[String]]에 유저id:[신고한id] 저장
    // [String:Int]에 유저id:신고당한횟수 저장
    // 여기서 Int가 >= k 인값 저장 [frodo, neo]
    // [String:[String]]에서 저장된 값[frodo,neo]들의 개수가 담긴 리스트가 정답
    
    
    // id_list: ["muzi", "frodo", "apeach", "neo"]
    // report: ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"]
    // k: 2
    
    var reportedDict = [String:Set<String>]()
    for r in report {
        let parts = r.components(separatedBy: " ")
//            if id == name[0] {
//                if reportedDict[id] != nil {
//                    reportedDict[id]!.append(name[1])
//                } else {
//                    reportedDict[id] = [name[1]]
//                }
//            }
        let reporter = parts[0]
        let reported = parts[1]
        reportedDict[reporter, default: []].insert(reported)
        // Array - append
        // Set - insert
    }
    print("reportedDict:", reportedDict)
    
    var countDict = [String:Int]()
    for id in id_list {
        countDict[id] = 0
    }
    for reported in reportedDict.values {
        reported.forEach {
            countDict[$0]! += 1
        }
    }
    print("countDict:", countDict)
    
    var suspended = [String]()
    for dict in countDict {
        if dict.value >= k {
            suspended.append(dict.key)
        }
    }
    print("suspended:", suspended)
    
    var userDict = [String:Int]()
    for dict in reportedDict {
        for s in suspended {
            if dict.value.contains(s) {
                userDict[dict.key, default: 0] += 1
            }
        }
    }
    print("userDict:", userDict)
    
    var answer = [Int]()
    for id in id_list {
        answer.append(userDict[id, default: 0])
    }
    print("answer:", answer)
    
    return answer
}
