//
//  PlayerActionsErrors.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 23/11/2018.
//  Copyright © 2018 Gino Preti. All rights reserved.
//

import Foundation

enum PlayerActionsErros: Error
{
    case invalidActions
    case inventoryFull
    
    var localizedDescription: String {
        
        switch self
        {
        case .invalidActions:
            return Message.invalidAction.localized
        case .inventoryFull:
            return Message.inventoryFull.localized
        }
        
    }
}
