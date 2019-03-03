//
//  MainSceneBusinessLogic.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 22/11/2018.
//  Copyright © 2018 Gino Preti. All rights reserved.
//

import Foundation

protocol MainSceneBusinessLogic: class
{
    func requestCreatePlayer(fromData loadData: Bool)
    func requestBuildingRoom(withName name: String, isSavedGame: Bool)
    func resetSelectedObject()
    func requestObject(withId id: URL, in characterRange: NSRange) -> Bool
    func requestResponse(forAction action: ObjectAction)
    func requestItemsInInventory() -> [RoomObject]?
    func requestItemsInventoryCount() -> Int?
    func requestItemFromInventory(atIndex index: Int)
    func requestSavingGame(andBackToHome backToHome: Bool)
    func requestSavingStartTime()
    func requestSavingElapsedGameTime()
    func requestStartTirednessCalculator()
    func requestStopTirednessCalculator()
    func playMusic()
    func stopMusic()
}
