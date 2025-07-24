//
//  조이스틱.swift
//  Algorithms
//
//  Created by 정근호 on 4/16/25.
//

import Foundation

func joyStick(_ name:String) -> Int {
    
    var upDown = 0
    var leftRight = 0
    
    for char in name {
        upDown += Int(min(char.asciiValue! - Character("A").asciiValue!
                         , Character("Z").asciiValue! - char.asciiValue! + 1))
    }
    
    for char in name {
        
        leftRight = Int(min(char.asciiValue! - Character("A").asciiValue!
                            , Character("Z").asciiValue! - char.asciiValue!))
    }
        
    return 0
}
