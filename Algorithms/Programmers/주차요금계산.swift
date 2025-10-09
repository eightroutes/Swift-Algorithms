//
//  주차요금계산.swift
//  Algorithms
//
//  Created by 정근호 on 10/8/25.
// https://school.programmers.co.kr/learn/courses/30/lessons/92341

import Foundation

func parkingFee(_ fees:[Int], _ records:[String]) -> [Int] {
    
    // fees
    // 기본 시간(분)    기본 요금(원)    단위 시간(분)    단위 요금(원)
    
    // records
    // 시:분 번호 in/out
    
    //    var parkingTimes = [Int]()
    //
    //    var records = records.map {
    //        $0.components(separatedBy: " ")
    //    }
    //
    //    records.sort {
    //        Int($0[1])! < Int($1[1])!
    //    }
    //    print(records)
    //
    //    var totalMinute = 0
    //
    //    for i in 0..<records.count-1 {
    //        if records[i][1] == records[i+1][1] {
    //
    //            totalMinute +=
    //            recordToMinute(record: records[i+1][0])
    //            - recordToMinute(record: records[i][0])
    //
    //            if records[i+1][2] == "IN" {
    //                let minuteLast = ((23*60)+59) - recordToMinute(record: records[i+1][0])
    //                totalMinute += minuteLast
    //            }
    //        } else {
    //            parkingTimes.append(totalMinute)
    //            totalMinute = 0
    //        }
    //    }
    //
    //    print(parkingTimes)
    
    var inRecords = [String:Int]() // 차 번호 : 시간
    var totalTimes = [String:Int]() // 차 번호 : 총 주차시간
    
    for record in records {
        let parts = record.components(separatedBy: " ")
        let time = parts[0]
        let carNum = parts[1]
        let action = parts[2]
        let minute = recordToMinute(record: time)
        
        if action == "IN" {
            inRecords[carNum] = minute
        } else {
            if let start = inRecords[carNum] {
                totalTimes[carNum, default: 0] += (minute - start)
                inRecords.removeValue(forKey: carNum)
            }
        }
    }
    
    // OUT 안한 차량 있을 시 23:59에 OUT 처리
    if !inRecords.isEmpty {
        for (carNum, minute) in inRecords {
            totalTimes[carNum, default: 0] += (23*60+59 - minute)
        }
    }
    
    print(totalTimes)
    
    func calculateFee(_ minute: Int) -> Int {
        let defaultMinute = fees[0]
        let defaultFee = fees[1]
        let unitMinute = fees[2]
        let unitFee = fees[3]
        
        if minute <= defaultMinute {
            return defaultFee
        } else {
            let val = Float(minute - defaultMinute) / Float(unitMinute)
            return defaultFee + Int(ceil(val)) * unitFee
        }
    }
    
    let sortedCarNumb = totalTimes.keys.sorted()
    print(sortedCarNumb)
    
    let sortedTotalTimes = sortedCarNumb.map {
        return calculateFee(totalTimes[$0]!)
    }
    
    print(sortedTotalTimes)
    
    return sortedTotalTimes
}


func recordToMinute(record: String) -> Int {
    let time = record
        .components(separatedBy: ":")
        .map{ Int($0)! }
    
    let minute = (time[0]*60 + time[1])
    return minute
}

