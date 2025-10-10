//
//  이모티콘할인행사.swift
//  Algorithms
//
//  Created by 정근호 on 10/9/25.
//

import Foundation

func emoticonEvent(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {
    
    // users
    /*
     사용자    비율    가격
     1    40    10,000
     2    25    10,000
     */
    
    // emoticons
    /*
     이모티콘    가격
     1    7,000
     2    9,000
     */
    
    // 할인율 - 10%, 20%, 30%, 40% 중 설정
    let discountRate = [0.1, 0.2, 0.3, 0.4]
    
    for user in users {
        let rateLimit = user[0]
        let priceLimit = user[1]
        var totalPrice = 0
        var emoticonList = [Int]()
        
        for rate in discountRate {
            var tempList = [Int]()
            for emoticon in emoticons {
                let newPrice = Int(Double(emoticon) * (1.0-rate))
                tempList.append(newPrice)
            }
            let sum = tempList.reduce(into: 0) { $0 += $1 }
            print(rate)
            emoticonList.append(sum)
        }
        print(emoticonList)
    }
    
    
        
    
    return []
}
