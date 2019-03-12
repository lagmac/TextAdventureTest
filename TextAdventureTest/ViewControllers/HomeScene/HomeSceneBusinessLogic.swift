//
//  HomeSceneBusinessLogic.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 23/01/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import Foundation

protocol HomeSceneBusinessLogic: class
{
    func requestSavedGameExist()
    func requestLoadSavedGame()
    func requestDeleteSavedGame()
    func requestSetAudioOnOff()
    func requestExistingCharacter()
    func requestPlayerStatistics() -> PlayerStatistics?
    func requestRoomNumber() -> Int?
    func resetElapsedGameTime()
    func playMusic()
    func stopMusic()
    func preloadMainTheme()
    func preloadInGameTheme()
}
