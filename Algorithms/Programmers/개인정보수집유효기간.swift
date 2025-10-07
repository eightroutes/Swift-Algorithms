//
//  개인정보수집유효기간 .swift
//  Algorithms
//
//  Created by 정근호 on 10/3/25.
//

import Foundation

func personalInfoValid(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    
    // today = "2022.05.19" - 오늘 날짜
    // terms = ["A 6", "B 12",..] - 약관 / 개월 수
    // privacies = ["2021.05.02 A",..] - 수집일자 / 약관
    let ymdToday = today.split(separator: ".").map { Int($0)! }
    print(ymdToday)
    
    // : [String: Int]
//    let durationDict =
//    Dictionary(uniqueKeysWithValues: terms.map {
//        let termParts = $0.split(separator: " ")
//        return (termParts[0], Int(termParts[1])!)
//    })
    let durationDict = terms.reduce(into: [String: Int]()) { dict, term in
        let parts = term.components(separatedBy: " ")
        dict[String(parts[0])] = Int(parts[1])!
    }
    print(durationDict)
    
    let convertedPrivacies =
    privacies.map { privacy -> ([Int], Int) in
        let pvParts = privacy.components(separatedBy: " ")
        let ymdPV = pvParts[0].components(separatedBy: ".").map { Int($0)! }
        let duration = durationDict[pvParts[1]]!
        return (ymdPV, duration)
    }
    print(convertedPrivacies)
    
    let calculatedPrivacies =
    convertedPrivacies.map { privacy -> (Int, Int, Int) in
        var newYear = privacy.0[0]
        var newMonth = privacy.0[1] + privacy.1
        if newMonth > 12 {
            newYear += newMonth / 12
            newMonth = newMonth % 12
            if newMonth == 0 {
                newMonth = 12
                newYear -= 1
            }
        }
        return (newYear, newMonth, privacy.0[2])
    }
    print(calculatedPrivacies)
    
    var result = [Int]()
    
    calculatedPrivacies.enumerated().forEach {
        let (ty, tm, td) = (ymdToday[0], ymdToday[1], ymdToday[2])
        let (y, m, d) = ($1.0, $1.1, $1.2)
        
        if (y < ty) || (y == ty) && (m < tm) || (y == ty) && (m == tm) && (d <= td) {
            result.append($0 + 1)
        }
    }
    
    return result
    
}
