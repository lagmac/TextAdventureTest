//
//  TempRoom.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 28/02/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import Foundation
import UIKit

class SavingRoom: NSObject, Codable
{
    var roomId: String!
    var roomName: String!
    
    var roomObjects: [RoomObject]?
    var destinations: [Direction]?
    var _roomDescription: String?
    var _alternativeDescriptions: [String : String]?
    var _roomLinks: [[String : String]]?
    var _pickerableObjectsNumbers: Int?
    
    init(withId id: String,
         name: String,
         roomObjects: [RoomObject]?,
         destinations: [Direction]?,
         _roomDescription: String?,
         _alternativeDescriptions: [String : String]?,
         _roomLinks: [[String : String]]?,
         _pickerableObjectsNumbers: Int?)
    {
        self.roomId = id
        self.roomName = name
        self.roomObjects = roomObjects
        self.destinations = destinations
        self._roomDescription = _roomDescription
        self._alternativeDescriptions = _alternativeDescriptions
        self._roomLinks = _roomLinks
        self._pickerableObjectsNumbers = _pickerableObjectsNumbers
    }
}
