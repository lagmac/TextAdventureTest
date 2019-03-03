//
//  PreferencesManager.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 22/01/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import Foundation

struct PreferenceKeys
{
    static let language = "language"
    static let savedGame = "savedGame"
    static let isAudioEnabled = "iaAudioEnabled"
    
    static let playerData = "playerData"
    static let playerCharacter = "playerCharacter"
    
    static let lastRoom = "lastRoom"
    static let playerLevel = "playerLevel"
    static let playerExp = "playerExp"
    static let playerGold = "playerGold"
    static let playerStartGameTime = "playerStartGameTime"
    static let playerElapsedGameTime = "playerElapsedGameTime"
    static let playerVisitedRooms = "playerVisitedRooms"
    static let playerTreasuresFound = "playerTreasuresFound"
}

class PreferencesManager: NSObject
{
    class func getPlayerLevel() -> Int?
    {
        return UserDefaults.standard.integer(forKey: PreferenceKeys.playerLevel)
    }

    class func getPlayerExp() -> Int?
    {
        return UserDefaults.standard.integer(forKey: PreferenceKeys.playerExp)
    }

    class func getPlayerGold() -> Int?
    {
        return UserDefaults.standard.integer(forKey: PreferenceKeys.playerGold)
    }
    
    class func getPlayerStartGameTime() -> Double?
    {
        return UserDefaults.standard.double(forKey: PreferenceKeys.playerStartGameTime)
    }
    
    class func getPlayerElapsedGameTime() -> Double?
    {
        return UserDefaults.standard.double(forKey: PreferenceKeys.playerElapsedGameTime)
    }
    
    class func getPlayerVisitedRoom() -> Int?
    {
        return UserDefaults.standard.integer(forKey: PreferenceKeys.playerVisitedRooms)
    }

    class func getPlayerTreasuresFound() -> Int?
    {
        return UserDefaults.standard.integer(forKey: PreferenceKeys.playerTreasuresFound)
    }
    
    class func setPlayerStartGameTime(_ value: Double)
    {
        UserDefaults.standard.set(value, forKey: PreferenceKeys.playerStartGameTime)
        UserDefaults.standard.synchronize()
    }
    
    class func setPlayerElapsedGameTime(_ value: Double)
    {
        UserDefaults.standard.set(value, forKey: PreferenceKeys.playerElapsedGameTime)
        UserDefaults.standard.synchronize()
    }
    
    class func setPlayerElapsedGameTimeToZero()
    {
        UserDefaults.standard.set(GlobalConstants.DOUBLE_ZERO, forKey: PreferenceKeys.playerElapsedGameTime)
        UserDefaults.standard.synchronize()
    }
    
    class func getAudioEnabled() -> Bool?
    {
        return UserDefaults.standard.bool(forKey: PreferenceKeys.isAudioEnabled)
    }
    
    class func setAudioEnabled(_ value: Bool)
    {
        UserDefaults.standard.set(value, forKey: PreferenceKeys.isAudioEnabled)
        UserDefaults.standard.synchronize()
    }
    
    class func getLanguage() -> String?
    {
        return UserDefaults.standard.string(forKey: PreferenceKeys.language)
    }
    
    class func setLanguage(_ value: String)
    {
        UserDefaults.standard.set(value, forKey: PreferenceKeys.language)
        UserDefaults.standard.synchronize()
    }
    
    class func existSavedGame() -> Bool?
    {
        return UserDefaults.standard.bool(forKey: PreferenceKeys.savedGame)
    }
    
    class func setSavedGame(_ value: Bool)
    {
        UserDefaults.standard.set(value, forKey: PreferenceKeys.savedGame)
        UserDefaults.standard.synchronize()
    }
    
    class func ArchivePlayerData<T: Encodable>(_ data: T)
    {
        UserDefaults.standard.set(encodable: data, forKey: PreferenceKeys.playerData)
        UserDefaults.standard.synchronize()
    }
    
    class func UnarchivePlayerData() -> Player?
    {
        return UserDefaults.standard.value(Player.self, forKey: PreferenceKeys.playerData)
    }
    
    class func ArchivePlayerCharacter<T: Encodable>(_ data: T)
    {
        UserDefaults.standard.set(encodable: data, forKey: PreferenceKeys.playerCharacter)
        UserDefaults.standard.synchronize()
    }
    
    class func UnarchivePlayerCharacter() -> PlayerCharacteristics?
    {
        return UserDefaults.standard.value(PlayerCharacteristics.self, forKey: PreferenceKeys.playerCharacter)
    }
    
    class func saveGameData(_ data: [String : Any])
    {
        UserDefaults.standard.set(data[PreferenceKeys.lastRoom], forKey: PreferenceKeys.lastRoom)
        UserDefaults.standard.set(data[PreferenceKeys.playerLevel], forKey: PreferenceKeys.playerLevel)
        UserDefaults.standard.set(data[PreferenceKeys.playerExp], forKey: PreferenceKeys.playerExp)
        UserDefaults.standard.set(data[PreferenceKeys.playerGold], forKey: PreferenceKeys.playerGold)
        UserDefaults.standard.set(data[PreferenceKeys.playerVisitedRooms], forKey: PreferenceKeys.playerVisitedRooms)
        UserDefaults.standard.set(data[PreferenceKeys.playerTreasuresFound], forKey: PreferenceKeys.playerTreasuresFound)
        UserDefaults.standard.synchronize()
    }
    
    class func loadGameData() -> [String : Any?]
    {
        let lastRoom = UserDefaults.standard.value(forKey: PreferenceKeys.lastRoom)
        let data = [PreferenceKeys.lastRoom : lastRoom ?? RoomData.startingRoom]
        
        return data
    }
    
    class func deleteSavedGameData()
    {
        UserDefaults.standard.set("", forKey: PreferenceKeys.lastRoom)
        UserDefaults.standard.set(nil, forKey: PreferenceKeys.playerData)
        UserDefaults.standard.set(GlobalConstants.INT_ZERO, forKey: PreferenceKeys.playerLevel)
        UserDefaults.standard.set(GlobalConstants.INT_ZERO, forKey: PreferenceKeys.playerExp)
        UserDefaults.standard.set(GlobalConstants.INT_ZERO, forKey: PreferenceKeys.playerGold)
        UserDefaults.standard.set(GlobalConstants.DOUBLE_ZERO, forKey: PreferenceKeys.playerStartGameTime)
        UserDefaults.standard.set(GlobalConstants.DOUBLE_ZERO, forKey: PreferenceKeys.playerElapsedGameTime)
        UserDefaults.standard.set(GlobalConstants.INT_ZERO, forKey: PreferenceKeys.playerVisitedRooms)
        UserDefaults.standard.set(GlobalConstants.INT_ZERO, forKey: PreferenceKeys.playerTreasuresFound)
        UserDefaults.standard.synchronize()
    }
}

extension UserDefaults {
    
    func set<T: Encodable>(encodable: T, forKey key: String)
    {
        if let data = try? JSONEncoder().encode(encodable)
        {
            set(data, forKey: key)
        }
    }
    
    func value<T: Decodable>(_ type: T.Type, forKey key: String) -> T?
    {
        if let data = object(forKey: key) as? Data, let value = try? JSONDecoder().decode(type, from: data)
        {
            return value
        }
        
        return nil
    }
}
