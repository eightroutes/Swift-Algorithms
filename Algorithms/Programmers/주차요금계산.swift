//
//  주차요금계산.swift
//  Algorithms
//
//  Created by 정근호 on 10/8/25.
//

import Foundation

func parkingFee(_ fees:[Int], _ records:[String]) -> [Int] {
    
    // fees
    // 기본 시간(분)    기본 요금(원)    단위 시간(분)    단위 요금(원)
    
    // records
    // 시:분 번호 in/out
    
    let defaultMinute = fees[0]
    let defaultFee = fees[1]
    let unitMinute = fees[2]
    let unitFee = fees[3]
    
    var parkingTimes = [Int]()
    
    var records = records.map {
        $0.components(separatedBy: " ")
    }
    
    records.sort {
        Int($0[1])! < Int($1[1])!
    }
    print(records)
    
    var totalMinute = 0
        
    for i in 0..<records.count-1 {
        if records[i][1] == records[i+1][1] {
            
            totalMinute +=
            recordToMinute(record: records[i+1][0])
            - recordToMinute(record: records[i][0])
            
            if records[i+1][2] == "IN" {
                let minuteLast = ((23*60)+59) - recordToMinute(record: records[i+1][0])
                totalMinute += minuteLast
            }
        } else {
            parkingTimes.append(totalMinute)
            totalMinute = 0
        }
    }
    
    print(parkingTimes)
    return []
}


func recordToMinute(record: String) -> Int {
    let time = record
        .components(separatedBy: ":")
        .map{ Int($0)! }
    
    let minute = (time[0]*60 + time[1])
    return minute
}
