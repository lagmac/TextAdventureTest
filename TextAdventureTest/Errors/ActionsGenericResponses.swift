//
//  ActionsGenericResponses.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 27/11/2018.
//  Copyright © 2018 Gino Preti. All rights reserved.
//

import Foundation


enum ActionsGenericResponses
{
    case objectIsInInventory
    case objectAddedToInventory
    case objectRemovedFromInventory
    case gameSaved
    
    var localizedDescription: String {
        
        switch self
        {
        case .objectIsInInventory:
            return Message.objectAlreadyInInventory.localized
        case .objectAddedToInventory:
            return Message.objectAddedToInventory.localized
        case .objectRemovedFromInventory:
            return Message.objectRemovedFromInventory.localized
        case .gameSaved:
            return Message.gameSaved.localized
        }
        
    }
}
