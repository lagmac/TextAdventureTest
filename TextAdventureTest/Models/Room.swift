//
//  Room.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 16/11/2018.
//  Copyright © 2018 Gino Preti. All rights reserved.
//

import Foundation
import UIKit

class Room: NSObject
{
    private var text: NSMutableAttributedString!
    
    private var roomId: String?
    private var roomName: String?
    
    private var roomData: [String :  Any]?
    private var roomObjects: [RoomObject]?
    private var destinations: [Direction]?
    private var _roomDescription: String?
    private var _alternativeDescriptions: [String : String]?
    private var _roomObjects: [[String : Any]]?
    private var _roomLinks: [[String : String]]?
    private var _pickerableObjectsNumbers: Int?

    init(withId id: String,
         name: String,
         data: [String : Any],
         objects: [RoomObject],
         destinations: [Direction],
         roomDescription: String,
         roomAlternativeDescriptions: [String : String]? = nil,
         roomObjects: [[String : Any]],
         roomLinks: [[String : String]],
         pickerableObjectsNumbers: Int? = nil,
         text: NSMutableAttributedString)
    {
        self.roomId = id
        self.roomName = name
        self.roomData = data
        self.roomObjects = objects
        self.destinations = destinations
        self._roomDescription = roomDescription
        self._alternativeDescriptions = roomAlternativeDescriptions
        self._roomObjects = roomObjects
        self._roomLinks = roomLinks
        self._pickerableObjectsNumbers = pickerableObjectsNumbers
        self.text = text
    }
    
    init(withData data: [String : Any])
    {
        roomData = data
    }
    
    func builder() throws
    {
        if roomData == nil { throw RoomBuilderErrors.noDataToParse }
        
        prepareData()
        
        if _roomObjects == nil { throw RoomBuilderErrors.unableToPrepareData }
        
        parseData()
        
        if text == nil { throw RoomBuilderErrors.parsingError }
    }
    
    func reset()
    {
        roomId = nil
        roomName = nil
        roomData = nil
        destinations = nil
        _alternativeDescriptions = nil
        _roomDescription = nil
        _roomObjects = nil
        _roomLinks = nil
    }
    
    func updateRoom(withSavingRoomData tr: SavingRoom)
    {
        prepareData()
        
        self.roomId = tr.roomId
        self.roomName = tr.roomName
        self.roomObjects = tr.roomObjects
        self.destinations = tr.destinations
        self._roomDescription = tr._roomDescription
        self._alternativeDescriptions = tr._alternativeDescriptions
        self._roomLinks = tr._roomLinks
        self._pickerableObjectsNumbers = tr._pickerableObjectsNumbers
        
        parseData()
    }
    
    func getRoomObject(forURL url: URL) -> RoomObject?
    {
        return filterRoomDataModels(withPredicate: url)
    }
    
    func getRoomLinks(forURL url: URL) -> Direction?
    {
        return filterDirectionObject(withPredicate: url)
    }
    
    func removeObject(_ roomObject: RoomObject)
    {
        guard roomObjects != nil else {

            return
        }

        // remove object from objects room list
        let cleanedRoomObjects = roomObjects!.filter { (ro) -> Bool in

            return ro != roomObject
        }
        
        // update room objects list
        if _pickerableObjectsNumbers != nil //let pon = _pickerableObjectsNumbers
        {
//            _pickerableObjectsNumbers = pon - 1
            _pickerableObjectsNumbers?.decrement(byValue: 1)
        }
        
        roomObjects = nil
        roomObjects = cleanedRoomObjects
    }
    
    func addObjectAgain(_ roomObject: RoomObject)
    {
        guard roomObjects != nil else {

            return
        }

        roomObjects?.append(roomObject)
    }
    
    func name() -> String?
    {
        return self.roomName
    }
    
    func id() -> String?
    {
        return self.roomId
    }
    
    func description() -> NSMutableAttributedString
    {
        return text
    }
    
    func getAllRoomObjects() -> [RoomObject]?
    {
        return roomObjects
    }
    
    func getAllDestinations() -> [Direction]?
    {
        return destinations
    }
    
    func getRoomDescription() -> String?
    {
        return _roomDescription
    }
    
    func getAllAlternativeDescriptions() -> [String : String]?
    {
        return _alternativeDescriptions
    }
    
    func getAllRoomLinks() -> [[String : String]]?
    {
        return _roomLinks
    }
    
    func getPicherableObjectNumbers() -> Int?
    {
        return _pickerableObjectsNumbers
    }
        
    func updateDescription(_ roomObject: RoomObject)
    {
        guard roomObject.alternativeDecriptionId != nil else {
            return
        }
        
        guard _alternativeDescriptions != nil else {
            return
        }
        
        if _pickerableObjectsNumbers != nil && _pickerableObjectsNumbers == GlobalConstants.INT_ZERO
        {
            _roomDescription = _alternativeDescriptions![RoomData.ALTERNATIVE_DESCRIPTION_$AD_NULL]
        }
        else
        {
            let altDescID = roomObject.alternativeDecriptionId!
            _roomDescription = _alternativeDescriptions![altDescID]
        }
        
        parseData()
    }
    
    private func prepareData()
    {
        self.roomId = roomData![RoomData.KEY_ID] as? String
        self.roomName = roomData![RoomData.KEY_NAME] as? String
        self._pickerableObjectsNumbers = roomData![RoomData.KEY_PICKERABLE_OBJECTS_NUMBERS] as? Int
        
        self._roomDescription = roomData![RoomData.KEY_DESCRIPTION] as? String
        self._alternativeDescriptions = roomData![RoomData.KEY_ALT_DESCRIPTION] as? [String : String]
        self._roomObjects = roomData![RoomData.KEY_OBJECTS] as? [[String : Any]]
        self._roomLinks = roomData![RoomData.KEY_LINKS] as? [[String : String]]
    }
    
    private func parseData()
    {
        let roomAttributedDescription = NSMutableAttributedString(string: _roomDescription!, attributes: RoomTextLayout.globalAttributes)
        
        self.roomObjects = []
        self.destinations = []
        
        parseRoomObjects(roomAttributedDescription)
        parseLinksObjects(roomAttributedDescription)
        
        text = roomAttributedDescription
    }
    
    private func parseRoomObjects(_ roomAttributedDescription: NSMutableAttributedString)
    {
        _roomObjects?.forEach({ (roomObject: [String : Any]) in
            
            let newRoomObject = RoomObject(withdata: roomObject, actions: RoomData.actions, responses: RoomData.responses, characteristics: RoomData.characteristics)
            self.roomObjects?.append(newRoomObject)
            
            for (key, value) in roomObject
            {
                if key == RoomData.KEY_ID
                {
                    if (_roomDescription?.contains(value as! String))!
                    {
                        let name = roomObject[RoomData.KEY_OBJECT_NAME] as? String
                        
                        let attributeObject = NSMutableAttributedString(string: name!)
                        let stringRange = NSMakeRange(GlobalConstants.INT_ZERO, attributeObject.length)
                        
                        attributeObject.addAttributes(RoomTextLayout.globalAttributes, range: stringRange)
                        attributeObject.addAttribute(NSMutableAttributedString.Key.link, value: value as! String, range: stringRange)
                        
                        guard let range = roomAttributedDescription.string.range(of: value as! String) else { return }
                        let nsRange = NSRange(range, in: roomAttributedDescription.string)
                        roomAttributedDescription.replaceCharacters(in: nsRange, with: attributeObject)
                    }
                }
            }
        })
    }
    
    private func parseLinksObjects(_ roomAttributedDescription: NSMutableAttributedString)
    {
        _roomLinks?.forEach({ (roomLink: [String : String]) in
            
            for (key, value) in roomLink
            {
                if key == RoomData.KEY_ID
                {
                    if ((_roomDescription?.contains(value))!)
                    {
                        if let direction = RoomData.directions.filter({ (directionDict) -> Bool in
                            
                            return directionDict[RoomData.KEY_ID] == roomLink[RoomData.KEY_LINK_SHORT_NAME]
                        }).first
                        {
                            let id = roomLink[RoomData.KEY_ID]
                            let name = direction[RoomData.KEY_LINK_NAME]
                            let from = roomLink[RoomData.KEY_LINK_FROM]
                            let to = roomLink[RoomData.KEY_LINK_TO]
                            let destination = Direction(withId: id!, name: name!, toDestination: to!, fromDestination: from!)

                            destinations?.append(destination)
                            
                            let attributeObject = NSMutableAttributedString(string: name!)
                            let stringRange = NSMakeRange(GlobalConstants.INT_ZERO, attributeObject.length)
                            
                            attributeObject.addAttributes(RoomTextLayout.globalAttributes, range: stringRange)
                            attributeObject.addAttribute(NSMutableAttributedString.Key.link, value: value, range: stringRange)
                            
                            guard let range = roomAttributedDescription.string.range(of: value) else { return }
                            let nsRange = NSRange(range, in: roomAttributedDescription.string)
                            roomAttributedDescription.replaceCharacters(in: nsRange, with: attributeObject)
                        }
                    }
                }
            }
        })
    }
    
    private func filterRoomDataModels(withPredicate url: URL) -> RoomObject?
    {
        return roomObjects?.filter({ (model) -> Bool in
            
            guard let mid = model.id else { return false }
            
            return mid == url.absoluteString
            
        }).first
        
    }
    
    private func filterDirectionObject(withPredicate url: URL) -> Direction?
    {
        return destinations?.filter({ (model) -> Bool in

            guard let mid = model.id else { return false }

            return mid == url.absoluteString

        }).first
    }
}

