//
//  PlayerData.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 23/11/2018.
//  Copyright © 2018 Gino Preti. All rights reserved.
//

import Foundation

struct PlayerData
{
    static let EXP_POINTS_TO_NEXT_LEVEL: Double = 5
    static let HP_POINTS_FOR_HEALTH: Int = 3
    static let HEALTH_BONUS: Float = 0.02
    static let INVENTORY_EMPTY_VALUE: Int = 0
    static let INVENTORY_MAX_VALUE: Int = 10
    
    static let START_GOLD: Int = 0
    static let MIN_GOLD: Int = 0
    static let MAX_GOLD: Int = 100000
    
    static let MIN_HEALTH: Float = 0.0
    static let MAX_HEALTH: Float = 1.0
    static let START_HEALTH: Float = 0.3 //PlayerData.MAX_HEALTH
    
    static let MIN_STRENGHT: Float = 0.0
    static let MAX_STRENGHT: Float = 1.0
    static let START_STRENGHT: Float = PlayerData.MAX_STRENGHT / 5.0
    
    static let MIN_TIREDNESS: Float = 0.0
    static let MAX_TIREDNESS: Float = 1.0
    static let START_TIREDNESS: Float = 0.9 //PlayerData.MIN_TIREDNESS
    
    static let MAX_EXP: Int = 10000
    static let MIN_EXP: Int = 0
    
    static let START_LEVEL: Int = 1
    static let MIN_LEVEL: Int = 1
    static let MAX_LEVEL: Int = 64
    
    static let START_HP: Int = 0
    static let MAX_HP: Int = 1000
    static let MIN_HP: Int = 0
    
    static let HEALTH_PER_POINTS_DAMAGES: Float = 0.04
    static let TIREDNESS_PER_POINTS_DAMAGES: Float = 0.02
}

