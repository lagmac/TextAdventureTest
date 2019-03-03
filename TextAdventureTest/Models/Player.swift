//
//  Player.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 22/11/2018.
//  Copyright © 2018 Gino Preti. All rights reserved.
//

import Foundation

class Player: NSObject, Codable
{
    private var _exp: Int = PlayerData.MIN_EXP
    private var _hp: Int = PlayerData.START_HP
    private var _lvl: Int = PlayerData.START_LEVEL
    private var _gold: Int = PlayerData.START_GOLD
    private var _health: Float = PlayerData.START_HEALTH
    private var _strenght: Float = PlayerData.START_STRENGHT
    private var _tiredness: Float = PlayerData.START_TIREDNESS
    
    private var _inventory: [RoomObject] = []
    private var _visitedRooms: [String : SavingRoom] = [:]
    private var _treasures: [String] = []
    
    var exp: Int {
        
        get {
            return _exp
        }
    }
    
    var hp: Int {
        
        get {
            return _hp
        }
    }
    
    var level: Int {
        
        get {
            return _lvl
        }
    }
    
    var gold: Int {
        
        get {
            return _gold
        }
    }
    
    var health: Float {
        
        get {
            return _health
        }
    }
    
    var strenght: Float {
        
        get {
            return _strenght
        }
    }
    
    var tiredness: Float {
        
        get {
            return _tiredness
        }
    }
    
    var inventory: [RoomObject]? {
        
        get {
            return _inventory
        }
    }

    var visitedRooms: [String : SavingRoom]? {
        
        get {
            return _visitedRooms
        }
    }
    
    var treasures: [String]? {
        
        get {
            return _treasures
        }
    }
    
    override init()
    {
        
    }
    
    func setValue(forExp exp: Int, hp: Int, level: Int, gold: Int, health: Float, strenght: Float, tiredness: Float)
    {
        _exp = exp
        _hp = hp
        _lvl = level
        _gold = gold
        _health = health
        _strenght = strenght
        _tiredness = tiredness
    }
    
    func updateExp(withValue newExp: Int)
    {
        _exp += newExp
        
        if _exp > PlayerData.MAX_EXP { _exp = PlayerData.MAX_EXP }
        
        if _exp < PlayerData.MAX_EXP
        {
            updateLevel()
        }
        else
        {
            _lvl = PlayerData.MAX_LEVEL
        }
    }
    
    func updateHp(withValue newHp: Int)
    {
//        _hp += newHp
        _hp.increment(byValue: newHp)
        
        if _hp > PlayerData.MAX_HP { _hp = PlayerData.MAX_HP }
        
        if _hp < PlayerData.MIN_HP { _hp = PlayerData.MIN_HP }
    }
    
    private func updateLevel()
    {
        let calculatedLevel = TAA.CalculateLeve(fromExpValue: _exp)
        
        _lvl = calculatedLevel > _lvl ? calculatedLevel : _lvl
    }
    
    func updateGold(withValue newGold: Int)
    {
//        _gold += newGold
        _gold.increment(byValue: newGold)
        
        if _gold > PlayerData.MAX_GOLD { _hp = PlayerData.MAX_GOLD }
        
        if _gold < PlayerData.MIN_GOLD { _hp = PlayerData.MIN_GOLD }
    }
    
    func updateHealth(withValue newHealth: Float)
    {
//        _health += newHealth
        _health.increment(byValue: newHealth)
        
        if _health < PlayerData.MIN_HEALTH { _health = PlayerData.MIN_HEALTH }
        
        if _health > PlayerData.MAX_HEALTH { _health = PlayerData.MAX_HEALTH }
        
        if checkForGameOver() == false
        {
            updateHp(withValue: (PlayerData.HP_POINTS_FOR_HEALTH.toNegative()))
//            _health += PlayerData.HEALTH_BONUS
            _health.increment(byValue: PlayerData.HEALTH_BONUS)
        }
        else
        {
            print("GAME OVER !!!")
        }
    }
    
    func updateStrenght(withValue newValue: Float)
    {
//        _strenght += newValue
        _strenght.increment(byValue: newValue)
        
        if _strenght < PlayerData.MIN_STRENGHT { _strenght = PlayerData.MIN_STRENGHT }
        
        if _strenght > PlayerData.MAX_STRENGHT { _strenght = PlayerData.MAX_STRENGHT }
    }
    
    func updateTiredness(withValue newValue: Float)
    {
//        _tiredness += newValue
        _tiredness.increment(byValue: newValue)
        
        if _tiredness < PlayerData.MIN_TIREDNESS { _tiredness = PlayerData.MIN_TIREDNESS }
        
        if _tiredness > PlayerData.MAX_TIREDNESS { _tiredness = PlayerData.MAX_TIREDNESS }
    }
    
    func addToInventory(_ object: RoomObject)
    {
        _inventory.append(object)
    }
    
    func isInventoryFull() -> Bool
    {
        return _inventory.count >= PlayerData.INVENTORY_MAX_VALUE
    }
    
    func removeFromInventory(_ object: RoomObject)
    {
        let cleanedInventoryObjects = _inventory.filter { (ro) -> Bool in
            
            return ro != object
        }
        
        _inventory.removeAll()
        _inventory = cleanedInventoryObjects
    }
    
    func objectIsInInventory(forURL url: URL) -> Bool
    {
        let a = _inventory.filter { (roomObject) -> Bool in
            
            return roomObject.id! == url.absoluteString
        }.first
        
        return a != nil
    }
    
    func addVisitedRoom(_ room: SavingRoom)
    {
        _visitedRooms[room.roomId] = room
    }
    
    func isVisitedRoom(forId roomId: String) -> SavingRoom?
    {
        return _visitedRooms[roomId]
    }
    
    private func checkForGameOver() -> Bool
    {
        if _health == PlayerData.MIN_HEALTH && _hp < PlayerData.HP_POINTS_FOR_HEALTH
        {
            return true
        }
        
        return false
    }
}

