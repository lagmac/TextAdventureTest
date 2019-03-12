//
//  HomeSceneInteractor.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 23/01/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import Foundation

class HomeSceneInteractor: AudioManagerDelegate, HomeSceneBusinessLogic
{
    weak var scene: HomeViewDisplayLogic?
    
    override init()
    {
        
    }
    
    func resetElapsedGameTime()
    {
        PreferencesManager.setPlayerElapsedGameTimeToZero()
    }
    
    func requestExistingCharacter()
    {
        guard let pc = PreferencesManager.UnarchivePlayerCharacter() else {
            
            scene?.responseCharacterNotExist()
            return
        }
        
        scene?.responseCharacterExist(pc)
    }
    
    func requestSavedGameExist()
    {
        if let existSavedGame = PreferencesManager.existSavedGame()
        {
            if existSavedGame == true
            {
                scene?.responseToSavedGameExist()
            }
            else
            {
                scene?.responseToSavedGameNotExist()
            }
        }
        else
        {
            scene?.responseToSavedGameNotExist()
        }
    }
    
    func requestLoadSavedGame()
    {
        let data = PreferencesManager.loadGameData()
        
        self.scene?.responseToLoadGame(data)
    }
    
    func requestDeleteSavedGame()
    {
        PreferencesManager.setSavedGame(false)
        PreferencesManager.deleteSavedGameData()
        
        self.scene?.responseToSavedGameNotExist()
    }
    
    func requestSetAudioOnOff()
    {
        if let audioState = PreferencesManager.getAudioEnabled()
        {
            if audioState == true
            {
                PreferencesManager.setAudioEnabled(false)
            }
            else
            {
                PreferencesManager.setAudioEnabled(true)
            }
            
            playAudio(!audioState)
        }
    }
    
    func requestPlayerStatistics() -> PlayerStatistics?
    {
        //GET DATA TO CREATE PLAYER STATISTICS
        let elapsedGameTime = PreferencesManager.getPlayerElapsedGameTime()
        let lvl = PreferencesManager.getPlayerLevel() ?? PlayerData.START_LEVEL
        let exp = PreferencesManager.getPlayerExp() ?? PlayerData.MIN_EXP
        let gold = PreferencesManager.getPlayerGold() ?? PlayerData.START_GOLD
        let visitedRooms = PreferencesManager.getPlayerVisitedRoom() ?? GlobalConstants.INT_ZERO
        let treasureFound = PreferencesManager.getPlayerTreasuresFound() ?? GlobalConstants.INT_ZERO
        
        return PlayerStatistics(elapsedTime: elapsedGameTime,
                                numberOfVisitedRooms: visitedRooms,
                                gold: gold, experience: exp,
                                reachedLevel: lvl,
                                tresuresFound: treasureFound)
    }
    
    func requestRoomNumber() -> Int?
    {
        return PreferencesManager.getPlayerVisitedRoom() ?? GlobalConstants.INT_ZERO
    }
    
    func preloadMainTheme()
    {
        do
        {
            try audioManager().loadMainTheme()
        }
        catch (let err)
        {
            let error = err as! ApplicationInternalErrors
            
            print(error.localizedDescription)
        }
    }
    
    func preloadInGameTheme()
    {
        do
        {
            try audioManager().loadInGameTheme()
        }
        catch (let err)
        {
            let error = err as! ApplicationInternalErrors
            
            print(error.localizedDescription)
        }
    }
    
    func playMusic()
    {
        if let audioState = PreferencesManager.getAudioEnabled()
        {
            playAudio(audioState)
        }
    }
    
    func stopMusic()
    {
        do
        {
            try audioManager().stop()
        }
        catch (let err)
        {
            let error = err as! ApplicationInternalErrors
            
            print(error.localizedDescription)
        }
    }
    
    private func playAudio(_ value: Bool)
    {
        do
        {
            if value == true
            {
                try audioManager().play()
            }
            else
            {
                try audioManager().stop()
            }
        }
        catch (let err)
        {
            let error = err as! ApplicationInternalErrors
            
            print(error.localizedDescription)
        }
    }
}
