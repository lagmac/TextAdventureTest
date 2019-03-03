//
//  RoomObject.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 21/11/2018.
//  Copyright © 2018 Gino Preti. All rights reserved.
//

import Foundation

class RoomObject: NSObject, Codable
{
    static func == (lhs: RoomObject, rhs: RoomObject) -> Bool {
        
        return lhs.id! == rhs.id! && lhs.name! == rhs.name! && lhs.actions! == rhs.actions!
    }
    
    var id: String?
    var name: String?
    var actions: [ObjectAction]?
    var alternativeDecriptionId: String?
    var previousActionId: String?
    var stringRange: NSRange?
    private var _characteristics: ObjectCharacteristic?
    
    var characteristic: ObjectCharacteristic? {
        
        get {
            return _characteristics
        }
    }
    
    init(withdata data: [String : Any], actions: [[String : String]]?, responses: [[String : String]]?, characteristics: [[String : Any]]?)
    {
        super.init()
        
        self.id = data[RoomData.KEY_ID] as? String
        self.name = data[RoomData.KEY_OBJECT_NAME] as? String
        self.alternativeDecriptionId = data[RoomData.KEY_OBJECT_ALT_DESC_ID] as? String
        
        if let objAct = data[RoomData.KEY_OBJECTS_ACTIONS] as? [String], let _actions = actions, let _responses = responses
        {
            let objResp = data[RoomData.KEY_OBJECTS_ACTIONS_RESPONSES] as? [String]
            
            parseActions(objAct, objResp: objResp , actionsMap: _actions, responseMap: _responses)
        }
        
        if let charId = data[RoomData.KEY_OBJECT_CHARACTERISTIC] as? String, let _characteristics = characteristics
        {
            parseCharacteristics(withId: charId, characteristicsMap: _characteristics)
        }
    }
    
    func addInventoryActions()
    {
        let inventoryActions = [RoomData.ACTION_ID_$A3, RoomData.ACTION_ID_$A7]
        let inventoryActionsResponses = [RoomData.RESPONSE_ID_$R16, RoomData.RESPONSE_ID_$R15]
        
        parseActions(inventoryActions, objResp: inventoryActionsResponses, actionsMap: RoomData.actions, responseMap: RoomData.responses)
    }
    
    func changeActionStatus(fromLastActionId actionId: String)
    {
        // check if action is suitable to change its state
        guard actionId != RoomData.ACTION_ID_$A3 else { return }
        guard actionId != RoomData.ACTION_ID_$A4 else { return }
        guard actionId != RoomData.ACTION_ID_$A6 else { return }
        guard actionId != RoomData.ACTION_ID_$A7 else { return }
        
        // if do not exist a previous action set the previous action to the current action
        if previousActionId == nil
        {
            previousActionId = actionId
        }
        
        // Set used to true for the current action
        for action in actions!
        {
            if action.id! == actionId
            {
                action.used! = true
            }
        }
        
        // Set used to false for the previous action if necessary
        if actionId != previousActionId!
        {
            for action in actions!
            {
                if action.id! == previousActionId!
                {
                    action.used! = false
                }
            }
        }
        
        previousActionId = actionId
    }
    
    private func parseCharacteristics(withId charId: String, characteristicsMap: [[String : Any]])
    {
        guard let ccc = characteristicsMap.filter({ (charDict) -> Bool in
            
            return charDict[RoomData.KEY_ID] as! String == charId
        }).first else { return }
        
        self._characteristics = ObjectCharacteristic(withData: (ccc[RoomData.KEY_CHARACTERISTICS_VALUE] as? [String : Int])!)
    }
    
    private func parseActions(_ objAct: [String], objResp: [String]?, actionsMap: [[String : String]], responseMap: [[String : String]])
    {
        if actions == nil
        {
            self.actions = []
        }
        
        for index in GlobalConstants.INT_ZERO..<objAct.count
        {
            let actionId = objAct[index]
            var bbb: [String : String]?
            
            let aaa = actionsMap.filter({ (actDic) -> Bool in
                return actDic[RoomData.KEY_ID]! == actionId
            }).first
            
            if objResp?.count != GlobalConstants.INT_ZERO
            {
                let responseId = objResp?[index]
                
                bbb = responseMap.filter({ (respDic) -> Bool in
                    return respDic[RoomData.KEY_ID]! == responseId!
                }).first
            }
            
            let newAct = ObjectAction(withData: aaa!, andResponse: bbb)
            
            self.actions?.append(newAct)
        }
    }
}
