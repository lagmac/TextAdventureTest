//
//  PlayerCharacteristics.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 01/03/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import Foundation

struct PlayerCharacteristics: Codable
{
    var name: String?
    var age: String?
    var race: String?
    var gender: PlayerGender?
}
