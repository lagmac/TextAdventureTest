//
//  ObjectCharacteristic.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 23/11/2018.
//  Copyright © 2018 Gino Preti. All rights reserved.
//

import Foundation

struct ObjectCharacteristic: Equatable, Codable
{
    static func == (lhs: ObjectCharacteristic, rhs: ObjectCharacteristic) -> Bool {
        
        return lhs.exp! == rhs.exp! && lhs.hp! == rhs.hp! && lhs.gold! == rhs.gold!
    }
    
    var exp: Int?
    var hp: Int?
    var gold: Int?
    
    init(withData data: [String : Int])
    {
        self.exp = data[RoomData.KEY_CHARACTERISTICS_EXP]
        self.hp = data[RoomData.KEY_CHARACTERISTICS_HP]
        self.gold = data[RoomData.KEY_CHARACTERISTICS_GOLD]
    }
    
}
