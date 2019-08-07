//
//  Food.swift
//  WeekOneBigEat
//
//  Created by Jian Ma on 8/2/19.
//  Copyright © 2019 Jian Ma. All rights reserved.
//

import Foundation


enum Food : Int{
    case chicken
    case water
    
    var value : Int{
        switch self{
        case .chicken:
            return 20
        case .water:
            return 5
        }
    }
}
