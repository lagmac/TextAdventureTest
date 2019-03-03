//
//  PlayerStatistics.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 01/03/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import Foundation

struct PlayerStatistics
{
    static let GAME_TIME: String = "gameTimeText"
    static let VISITED_ROOMS: String = "visitedRoomText"
    static let LEVEL_TEXT: String = "levelText"
    static let EXP_TEXT: String = "expText"
    static let GOLD_TEXT: String = "goldText"
    static let TREASURES_FOUND: String = "treasuresFoundText"
    
    var elapsedTime: TimeInterval?
    var numberOfVisitedRooms: Int?
    var gold: Int?
    var experience: Int?
    var reachedLevel: Int?
    var tresuresFound: Int?
}
