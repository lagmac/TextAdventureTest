//
//  StatisticViewInteractor.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 03/02/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import Foundation

class StatisticViewInteractor: StatisticViewBusinessLogic
{
    weak var scene: StatisticViewDisplayLogic?
    
    init()
    {
        
    }
    
    func requestParsePlayerStatistics(fromData data: PlayerStatistics?)
    {
        var parsedData: [String : String] = [:]
        
        if let pc = data
        {
            let gameTimeString = Utilities.GameTimeFormattedString(fromTimeInterval: pc.elapsedTime!)
            
            parsedData[PlayerStatistics.GAME_TIME] = gameTimeString
            parsedData[PlayerStatistics.VISITED_ROOMS] = "\(pc.numberOfVisitedRooms!)" + LabelText.of.localized + "\(RoomData.totalRoomsNumber)"
            parsedData[PlayerStatistics.LEVEL_TEXT] = "\(pc.reachedLevel!)"
            parsedData[PlayerStatistics.EXP_TEXT] = "\(pc.experience!)"
            parsedData[PlayerStatistics.GOLD_TEXT] = "\(pc.gold!)"
            parsedData[PlayerStatistics.TREASURES_FOUND] = "\(pc.tresuresFound!)" + LabelText.of.localized + "\(RoomData.totalTreasuresNumber)"
        }
        else
        {
            parsedData[PlayerStatistics.GAME_TIME] = LabelText.notAvailable.localized
            parsedData[PlayerStatistics.VISITED_ROOMS] = LabelText.notAvailable.localized + LabelText.of.localized + "\(RoomData.totalRoomsNumber)"
            parsedData[PlayerStatistics.LEVEL_TEXT] = LabelText.notAvailable.localized
            parsedData[PlayerStatistics.EXP_TEXT] = LabelText.notAvailable.localized
            parsedData[PlayerStatistics.GOLD_TEXT] = LabelText.notAvailable.localized
            parsedData[PlayerStatistics.TREASURES_FOUND] = LabelText.notAvailable.localized + LabelText.of.localized + "\(RoomData.totalTreasuresNumber)"
        }
        
        scene?.responseParsePlayerStatistics(parsedData)
    }
}

