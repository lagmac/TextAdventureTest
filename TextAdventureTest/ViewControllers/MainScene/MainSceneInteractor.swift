//
//  MainSceneInteractor.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 22/11/2018.
//  Copyright © 2018 Gino Preti. All rights reserved.
//

import Foundation

class MainSceneInteractor: AudioManagerDelegate, MainSceneBusinessLogic {
    
    weak var scene: MainSceneDisplayLogic?
    
    private var room: Room!
    private var player: Player?
    private var selectedObject: RoomObject?
    private var steps: Int = GlobalConstants.INT_ZERO
    private var timeLastStep: TimeInterval = GlobalConstants.DOUBLE_ZERO
    private var tirednessIncreaseTimer: Timer?
    private var tirednessDecreaseTimer: Timer?
    
    override init()
    {
        
    }
    
    func requestStartTirednessCalculator()
    {
        scheduleTirednessTimer(true)
    }
    
    func requestStopTirednessCalculator()
    {
        scheduleTirednessTimer(false)
    }
    
    func requestSavingStartTime()
    {
        let startingTime = Date.timeIntervalSinceReferenceDate
        
        PreferencesManager.setPlayerStartGameTime(startingTime)
    }
    
    func requestSavingElapsedGameTime()
    {
        let currentTimeInterval = Date.timeIntervalSinceReferenceDate
        let startingGameTimeInterval = PreferencesManager.getPlayerStartGameTime()
        let lastElapsedGameTime = PreferencesManager.getPlayerElapsedGameTime()
        
        let deltaTime = currentTimeInterval - startingGameTimeInterval!
        let newElapsedGameTime = lastElapsedGameTime! + deltaTime
        
        PreferencesManager.setPlayerElapsedGameTime(newElapsedGameTime)
    }
    
    func requestSavingGame(andBackToHome backToHome: Bool)
    {
        let data: [String : Any] = [PreferenceKeys.lastRoom : room.id()!,
                                    PreferenceKeys.playerLevel : player!.level,
                                    PreferenceKeys.playerExp : player!.exp,
                                    PreferenceKeys.playerGold: player!.gold,
                                    PreferenceKeys.playerVisitedRooms : player!.visitedRooms?.count ?? GlobalConstants.INT_ZERO,
                                    PreferenceKeys.playerTreasuresFound : player!.treasures?.count ?? GlobalConstants.INT_ZERO]
        
        PreferencesManager.ArchivePlayerData(player!)
        PreferencesManager.saveGameData(data)
        PreferencesManager.setSavedGame(true)
        
        scene?.responseToRequestSavingGame(andBackToHome: backToHome)
    }
    
    func requestCreatePlayer(fromData loadData: Bool)
    {
        if loadData
        {
            if let pl = PreferencesManager.UnarchivePlayerData()
            {
                player = pl
            }
            else
            {
                player = Player()
            }
        }
        else
        {
            player = Player()
        }
        
        playerUpdated()
    }
    
    func requestBuildingRoom(withName name: String, isSavedGame: Bool)
    {
        guard let language = PreferencesManager.getLanguage() else
        {
            scene?.manageBuilginsRoomRequestError(RoomBuilderErrors.noDataToParse)
            return
        }
        
        if isSavedGame == false
        {
            self.createNewRoom(withName: name, forLanguage: language, andBuild: true)
        }
        else if isSavedGame == true
        {
            let roomData = player!.visitedRooms![name]
            
            self.createNewRoom(withName: name, forLanguage: language, andBuild: false)
            room.updateRoom(withSavingRoomData: roomData!)
            
            scene?.responseBuindingRoomRequest(withRoomName: room.name()!, roomDescription: room.description())
        }
        
        addVisitedRoom()
    }
    
    func requestObject(withId id: URL, in characterRange: NSRange) -> Bool
    {
        if let roomObject = room.getRoomObject(forURL: id)
        {
            roomObject.stringRange = characterRange
            self.selectedObject = roomObject

            scene?.responseRoomObjectRequest(selectedObject!)
        }
        else if let linkObject = room.getRoomLinks(forURL: id)
        {
            if let visitedRoom = player?.isVisitedRoom(forId: linkObject.toRoom!)
            {
                room.reset()
                room = nil
                
                self.createNewRoom(withName: visitedRoom.roomId, forLanguage: PreferencesManager.getLanguage()!, andBuild: false)
                room.updateRoom(withSavingRoomData: visitedRoom)
                
                scene?.responseBuindingRoomRequest(withRoomName: room.name()!, roomDescription: room.description())
            }
            else
            {
                requestBuildingRoom(withName: linkObject.toRoom!, isSavedGame: false)
            }
            
            steps.increment(byValue: 1)
            timeLastStep = Date.timeIntervalSinceReferenceDate
        }
        else
        {
            if (player?.objectIsInInventory(forURL: id))!
            {
                self.scene?.responseActionResponseRequest(ActionsGenericResponses.objectIsInInventory.localizedDescription)
            }
            else
            {
                self.scene?.manageRoomObjectRequestError(PlayerActionsErros.invalidActions)
            }
        }

        return false
    }
    
    func requestResponse(forAction action: ObjectAction)
    {
        if let resp = action.response
        {
            scene?.responseActionResponseRequest(resp.result!)

            selectedObject?.changeActionStatus(fromLastActionId: action.id!)
            
            switch action.id!
            {
            case RoomData.ACTION_ID_$A2:
                if let roc = selectedObject!.characteristic
                {
                    self.updatePlayerCharacteristics(withValue: roc)
                }
                addObjectToPlayerInventory()
                room.updateDescription(selectedObject!)
                addVisitedRoom()
                resetSelectedObject()
                scene?.responseToRoomDescriptionChanged(withNewDescription: room.description())
                break
            case RoomData.ACTION_ID_$A3:
                removeObjectFromPlayerInventory()
                break
            case RoomData.ACTION_ID_$A8:
                scene?.responseToStartAttack(withOutcome: NSLocalizedString("RESPONSE_START_COMBAT", comment: ""))
                break
            default:
                break
            }
        }
        else
        {
            scene?.manageActionResponseError(PlayerActionsErros.invalidActions)
        }
    }
    
    func requestItemFromInventory(atIndex index: Int)
    {
        if let item = player?.inventory?[index]
        {
            selectedObject = item
            scene?.responseToRequestObjectFromInventory(item)
        }
    }
    
    func requestItemsInInventory() -> [RoomObject]?
    {
        return player?.inventory
    }
    
    func requestItemsInventoryCount() -> Int?
    {
        return player?.inventory?.count
    }
    
    func resetSelectedObject()
    {
        selectedObject = nil
    }
    
    private func addObjectToPlayerInventory()
    {
        if selectedObject != nil
        {
            if player?.isInventoryFull() == false
            {
                selectedObject!.addInventoryActions()
                
                player?.addToInventory(selectedObject!)
                
                dispatchAfert {
                    let inventoryItemsCount = (self.player?.inventory?.count)!
                    
                    self.scene?.responseToAddItemToPlayerInventory(ActionsGenericResponses.objectAddedToInventory.localizedDescription, itemsCount: inventoryItemsCount)
                }
                
                room?.removeObject(selectedObject!)
                //resetSelectedObject()
            }
            else
            {
                self.scene?.responseToInventoryIsFull(PlayerActionsErros.inventoryFull)
            }
        }
    }
    
    private func removeObjectFromPlayerInventory()
    {
        if selectedObject != nil
        {
            player?.removeFromInventory(selectedObject!)
            
            //room.addObjectAgain(selectedObject!)
            
            dispatchAfert {
                let inventoryItemsCount = (self.player?.inventory?.count)!
                
                self.scene?.responseToRemoveItemFromPlayerInventory(ActionsGenericResponses.objectRemovedFromInventory.localizedDescription,
                                                                    inventoryState: inventoryItemsCount > 0 ? true : false, itemsCount: inventoryItemsCount)
            }

            resetSelectedObject()
        }
    }
    
    private func updatePlayerCharacteristics(withValue newValue: ObjectCharacteristic)
    {
        guard player != nil else { return }
        
        player?.updateHp(withValue: newValue.hp!)
        player?.updateExp(withValue: newValue.exp!)
        player?.updateGold(withValue: newValue.gold!)
        
        let newStrenghtValue = TAA.CalculateStrenghtIncrement(player!.hp, expValue: player!.exp, lvl: player!.level)
        player?.updateStrenght(withValue: newStrenghtValue)
        
        playerUpdated()
    }
    
    private func dispatchAfert(withBlock codeBlock: @escaping() -> Void)
    {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime(uptimeNanoseconds: 1000)) {
            
            codeBlock()
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
            
            scene?.manageFatalError(error.localizedDescription)
        }
    }
    
    func requestStartAttack()
    {
        var playerTurn: Bool = true
        var numberOfTurns: Int = GlobalConstants.INT_ZERO
        var playerHits: Int = GlobalConstants.INT_ZERO
        var enemyHits: Int = GlobalConstants.INT_ZERO
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (t) in
            
            if playerTurn
            {
                let result = self.playerAttack()
                playerHits.increment(byValue: result)
                playerTurn = false
            }
            else
            {
                let result = self.enemyAttack()
                enemyHits.increment(byValue: result)
                playerTurn = true
            }
            
            numberOfTurns.increment(byValue: 1)
            
            if self.isCombatFinished(numberOfTurns)
            {
                t.invalidate()
                
                if playerHits > enemyHits
                {
                    let response = NSLocalizedString("RESPONSE_FINISHED_COMBACT_WIN", comment: "") + "(\(playerHits) vs \(enemyHits))"
                    self.scene?.responseToEndAttackWithVictory(withOutcome: response, points: enemyHits)
                }
                else
                {
                    let response = NSLocalizedString("RESPONSE_FINISHED_COMBACT_WIN", comment: "") + "(\(enemyHits) vs \(playerHits))"
                    self.scene?.responseToEndAttackWithDefeat(withOutcome: response, points: enemyHits)
                }
            }
        }
    }
    
    func requestPerformCombatEnd(withVictory isVictory: Bool, points: Int)
    {
        if isVictory
        {
            if let roc = selectedObject!.characteristic
            {
                self.updatePlayerCharacteristics(withValue: roc)
            }
            
            let tirednessIncreaseValue = Float(points) * PlayerData.TIREDNESS_PER_POINTS_DAMAGES
            player?.updateTiredness(withValue: tirednessIncreaseValue)
        }
        else
        {
            let healthDecreaseValue = Float(points) * PlayerData.HEALTH_PER_POINTS_DAMAGES
            player?.updateHealth(withValue: healthDecreaseValue.toNegative())
        }
        
        resetSelectedObject()
        
        self.playerUpdated()
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
            
            scene?.manageFatalError(error.localizedDescription)
        }
    }
    
    private func scheduleTirednessTimer(_ value: Bool)
    {
        guard value else {
            
            steps = GlobalConstants.INT_ZERO
            timeLastStep = GlobalConstants.DOUBLE_ZERO
            
            tirednessIncreaseTimer?.invalidate()
            tirednessIncreaseTimer = nil
            
            tirednessDecreaseTimer?.invalidate()
            tirednessDecreaseTimer = nil
            
            return
        }
        
        tirednessIncreaseTimer = Timer.scheduledTimer(withTimeInterval: GlobalConstants.TIREDNESS_UPDATE_INTERVAL, repeats: true) { (t) in
            
            if self.steps > GlobalConstants.INT_ZERO
            {
                let v1 = TAA.CalculateTirednessIncrement(self.player!.health,
                                                               steps: self.steps,
                                                               itemsCount: self.player!.inventory?.count ?? GlobalConstants.INT_ZERO)
                
                self.player?.updateTiredness(withValue: v1)
                
                self.playerUpdated()
                
                self.steps = GlobalConstants.INT_ZERO
            }
        }
        
        tirednessDecreaseTimer = Timer.scheduledTimer(withTimeInterval: GlobalConstants.TIREDNESS_RECHARGE_INTERVAL, repeats: true, block: { (t) in
            
            if self.timeLastStep != GlobalConstants.DOUBLE_ZERO
            {
                let currentTimeStep = Date.timeIntervalSinceReferenceDate
                
                let deltaTime = currentTimeStep - self.timeLastStep
                
                if deltaTime >= GlobalConstants.TIREDNESS_RECHARGE_INTERVAL
                {
                    self.timeLastStep = currentTimeStep
                    let v1 = TAA.CalculateTirednessDecrement(self.player!.hp, healthValue: self.player!.health, strenghtValue: self.player!.strenght)
                    self.player?.updateTiredness(withValue: v1)
                    self.playerUpdated()
                }
            }
        })
    }
    
    private func playerUpdated()
    {
        let inventoryIsActive = (self.player?.inventory?.count)! > PlayerData.INVENTORY_EMPTY_VALUE ? true : false
        let inventoryItemsCount = inventoryIsActive ? (self.player?.inventory?.count)! : PlayerData.INVENTORY_EMPTY_VALUE
        
        self.scene?.responsePlayerCreatedOrUpdated(withValuesOf: (self.player?.exp)!,
                                                   hp: (self.player?.hp)!,
                                                   lvl: (self.player?.level)!,
                                                   gold: (self.player?.gold)!,
                                                   health: (self.player?.health)!,
                                                   strenght: (self.player?.strenght)!,
                                                   tiredness: (self.player?.tiredness)!,
                                                   inventoryActive: inventoryIsActive,
                                                   itemsCount: inventoryItemsCount)
    }
    
    private func createNewRoom(withName name: String, forLanguage language: String, andBuild build: Bool)
    {
        let fileName = name + "_" + language
        
        guard let data = RoomData.getRoomData(byGivenName: fileName) else
        {
            scene?.manageBuilginsRoomRequestError(RoomBuilderErrors.noDataToParse)
            return
        }
        
        if room != nil
        {
            room.reset()
            room = nil
        }
        
        room = Room(withData: data)
        
        if build
        {
            do
            {
                try room.builder()
                scene?.responseBuindingRoomRequest(withRoomName: room.name()!, roomDescription: room.description())
            }
            catch (let err)
            {
                let error = err as! RoomBuilderErrors
                scene?.manageBuilginsRoomRequestError(error)
            }
        }
    }
    
    private func addVisitedRoom()
    {
        let tr = SavingRoom(withId: room.id()!,
                            name: room.name()!,
                            roomObjects: room.getAllRoomObjects(),
                            destinations: room.getAllDestinations(),
                            _roomDescription: room.getRoomDescription(),
                            _alternativeDescriptions: room.getAllAlternativeDescriptions(),
                            _roomLinks: room.getAllRoomLinks(),
                            _pickerableObjectsNumbers: room.getPicherableObjectNumbers())
        
        player?.addVisitedRoom(tr)
    }
    
    private func playerAttack() -> Int
    {
        let hit = TAA.CalculateHitChance(fromPlayerTiredness: (self.player?.tiredness)!)
        
        if hit
        {
            self.scene?.responseToOnAttack(withOutcome: NSLocalizedString("RESPONSE_HIT_ENEMY", comment: ""))
            return 1
        }
        else
        {
            self.scene?.responseToOnAttack(withOutcome: NSLocalizedString("RESPONSE_MISSED_ENEMY", comment: ""))
            return 0
        }
    }
    
    private func enemyAttack() -> Int
    {
        let evade = TAA.CaluclateEvadeChance(fromPlayerHealth: (self.player?.health)!)
        
        if evade
        {
            self.scene?.responseToOnAttack(withOutcome: NSLocalizedString("RESPONSE_MISSED_PLAYER", comment: ""))
            return 0
        }
        else
        {
            self.scene?.responseToOnAttack(withOutcome: NSLocalizedString("RESPONSE_HIT_PLAYER", comment: ""))
            return 1
        }
    }
    
    private func isCombatFinished(_ numberOfTurns: Int) -> Bool
    {
        if numberOfTurns == GlobalConstants.BATTLE_SYSTEM_MAX_TURNS_NUMBERS
        {
            return true
        }
        
        return false
    }
}

