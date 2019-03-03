//
//  Localizations.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 15/01/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import Foundation

enum ParseError: Int
{
    case noDataToParse = 1
    case unableToPrepareData = 2
    case parsingError = 3
    
    var localized: String
    {
        switch self {
        case .noDataToParse:
            return NSLocalizedString("NO_DATA_TO_PARSE", comment: "")
        case .unableToPrepareData:
            return NSLocalizedString("UNABLE_PREPARE_DATA", comment: "")
        case .parsingError:
            return NSLocalizedString("PARSE_GENERIC_ERROR", comment: "")
        }
    }
}

enum LabelTitle: Int
{
    case inventory = 1
    case gold = 2
    case experience = 3
    case hp = 4
    case level = 5
    case gameTitle = 6
    
    var localized: String
    {
        switch self
        {
        case .inventory:
            return NSLocalizedString("TITLE_INVENTORY", comment: "")
        case .gold:
            return NSLocalizedString("TITLE_GOLD", comment: "")
        case .experience:
            return NSLocalizedString("TITLE_EXP", comment: "")
        case .hp:
            return NSLocalizedString("TITLE_HP", comment: "")
        case .level:
            return NSLocalizedString("TITLE_LEVEL", comment: "")
        case .gameTitle:
            return NSLocalizedString("TITLE_GAME_TITLE", comment: "")
        }
    }
}

enum LabelText: Int
{
    case of = 1
    case notAvailable = 2
    case defaultStatisticTime = 3
    
    var localized: String
    {
        switch self
        {
        case .of:
            return NSLocalizedString("OF_LABEL", comment: "")
        case .notAvailable:
            return NSLocalizedString("NOT_AVAILABLE", comment: "")
        case .defaultStatisticTime:
            return NSLocalizedString("DEFAULT_STATISTIC_TIME", comment: "")
        }
    }
}

enum Message: Int
{
    case invalidAction = 1
    case inventoryFull = 2
    case objectAlreadyInInventory = 3
    case objectAddedToInventory = 4
    case objectRemovedFromInventory = 5
    case objectUsed = 6
    case gameSaved = 7
    case quitGame = 8
    
    var localized: String
    {
        switch self
        {
        case .invalidAction:
            return NSLocalizedString("INVALID_ACTION", comment: "")
        case .inventoryFull:
            return NSLocalizedString("INVENTORY_FULL", comment: "")
        case .objectAlreadyInInventory:
            return NSLocalizedString("OBJECT_ALEADY_IN_INVENTORY", comment: "")
        case .objectAddedToInventory:
            return NSLocalizedString("OBJECT_ADDED_TO_INVENTOYR", comment: "")
        case .objectRemovedFromInventory:
            return NSLocalizedString("OBJECT_REMOVED_FROM_INVENTORY", comment: "")
        case .objectUsed:
            return NSLocalizedString("OBJECT_USED", comment: "")
        case .gameSaved:
            return NSLocalizedString("GAME_SAVED", comment: "")
        case .quitGame:
            return NSLocalizedString("QUITS_GAME", comment: "")
        }
    }
}

enum ActionsSelectorLabel: Int
{
    case title = 1
    case discardAction = 2
    case quites = 3
    case quitesAndSave = 4
    
    var localized: String
    {
        switch self
        {
        case .title:
            return NSLocalizedString("ACTION_SELECTOR_TITLE", comment: "")
        case .discardAction:
            return NSLocalizedString("ACTION_SELECTOR_INVALID_ACTION", comment: "")
        case .quites:
            return NSLocalizedString("ACTION_SELECTOR_QUITS_ACTION", comment: "")
        case .quitesAndSave:
            return NSLocalizedString("ACTION_SELECTOR_QUITS_AND_SAVE_ACTION", comment: "")
        }
    }
}

enum AlertErrorMessage: Int
{
    case title = 1
    case genericMessage = 2
    
    var localized: String
    {
        switch self
        {
        case .title:
            return NSLocalizedString("ALERT_ERROR_TITLE", comment: "")
        case .genericMessage:
            return NSLocalizedString("ALERT_ERROR_GENERIC_MESSAGE", comment: "")
        }
    }
}

enum LoadingOptionsSelectorLabel: Int
{
    case title = 1
    case startNewGame = 2
    case loadSavedGame = 3
    case discard = 4
    
    var localized: String
    {
        switch self
        {
        case .title:
            return NSLocalizedString("LOADING_OPTIONS_SELECTOR_TITLE", comment: "")
        case .startNewGame:
            return NSLocalizedString("LOADING_OPTIONS_SELECTOR_START_NEW_GAME", comment: "")
        case .loadSavedGame:
            return NSLocalizedString("LOADING_OPTIONS_SELECTOR_LOAD_SAVED_GAME", comment: "")
        case .discard:
            return NSLocalizedString("LOADING_OPTIONS_SELECTOR_DISCARD", comment: "")
        }
    }

}

enum SettingsOptionsSelectorLabel: Int
{
    case title = 1
    case audioOn = 2
    case audioOff = 3
    case statistic = 4
    case discard = 5
    
    var localized: String
    {
        switch self
        {
        case .title:
            return NSLocalizedString("SETTINGS_OPTIONS_TITLE", comment: "")
        case .audioOn:
            return NSLocalizedString("SETTINGS_OPTIONS_AUDIO_ON", comment: "")
        case .audioOff:
            return NSLocalizedString("SETTINGS_OPTIONS_AUDIO_OFF", comment: "")
        case .statistic:
            return NSLocalizedString("SETTINGS_OPTIONS_STATISTIC", comment: "")
        case .discard:
            return NSLocalizedString("SETTINGS_OPTIONS_SELECTOR_DISCARD", comment: "")
        }
    }
    
}

enum PlayerGender: Int, Codable
{
    case male = 1
    case female = 2
    
    var localized: String {
        
        switch self
        {
        case .male:
            return NSLocalizedString("GENDER_MALE", comment: "")
        case .female:
            return NSLocalizedString("GENDER_FEMALE", comment: "")
        }
        
    }
}

enum localizedActions: Int
{
    case open = 1
    case get = 2
    case drop = 3
    case examines = 4
    case close = 5
    case read = 6
    case use = 7
    case attack = 8
    
    var localized: String
    {
        switch self
        {
        case .open:
            return NSLocalizedString("ACTION_OPEN", comment: "")
        case .get:
            return NSLocalizedString("ACTION_GET", comment: "")
        case .drop:
            return NSLocalizedString("ACTION_DROP", comment: "")
        case .examines:
            return NSLocalizedString("ACTION_EXAMINES", comment: "")
        case .close:
            return NSLocalizedString("ACTION_CLOSE", comment: "")
        case .read:
            return NSLocalizedString("ACTION_READ", comment: "")
        case .use:
            return NSLocalizedString("ACTION_USE", comment: "")
        case .attack:
            return NSLocalizedString("ACTION_ATTACK", comment: "")
        }
    }
}

enum localizedDirections: Int
{
    case north = 1
    case east = 2
    case south = 3
    case west = 4
    
    var localized: String
    {
        switch self
        {
        case .north:
            return NSLocalizedString("NORTH_DIRECTION", comment: "")
        case .east:
            return NSLocalizedString("EAST_DIRECTION", comment: "")
        case .south:
            return NSLocalizedString("SOUTH_DIRECTION", comment: "")
        case .west:
            return NSLocalizedString("WEST_DIRECTION", comment: "")
        }
    }
}
