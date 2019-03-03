//
//  Direction.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 25/11/2018.
//  Copyright © 2018 Gino Preti. All rights reserved.
//

import Foundation

struct Direction: Equatable, Codable
{
    static func == (lhs: Direction, rhs: Direction) -> Bool {
        
        return lhs.id! == rhs.id! && lhs.name! == rhs.name! && lhs.toRoom! == rhs.toRoom! && lhs.fromRoom! == rhs.fromRoom!
    }
    
    var id: String?
    var name: String?
    var toRoom: String?
    var fromRoom: String?
    
    init(withId id: String, name: String, toDestination: String, fromDestination: String) {
        
        self.id = id
        self.name = name
        self.toRoom = toDestination
        self.fromRoom = fromDestination
    }
}
