//
//  RoomData.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 21/11/2018.
//  Copyright © 2018 Gino Preti. All rights reserved.
//

import Foundation

enum localizedObjects: Int
{
    case door = 1
    case sheet = 2
    case nail = 3
    case bottle = 4
    case creature = 5
    
    var localized: String
    {
        switch self
        {
        case .door:
            return NSLocalizedString("OBJECT_DOOR", comment: "")
        case .sheet:
            return NSLocalizedString("OBJECT_SHEET", comment: "")
        case .nail:
            return NSLocalizedString("OBJECT_NAIL", comment: "")
        case .bottle:
            return NSLocalizedString("OBJECT_BOTTLE", comment: "")
        case .creature:
            return NSLocalizedString("OBJECT_CREATURE", comment: "")
        }
    }
}

enum localizedResponses: Int
{
    case r1 = 1
    case r2 = 2
    case r3 = 3
    case r4 = 4
    case r5 = 5
    case r6 = 6
    case r7 = 7
    case r8 = 8
    case r9 = 9
    case r10 = 10
    case r11 = 11
    case r12 = 12
    case r13 = 13
    case r14 = 14
    case r15 = 15
    case r16 = 16
    
    var localized: String
    {
        switch self
        {
        case .r1:
            return NSLocalizedString("RESPONSE_OPENING_DOOR", comment: "")
        case .r2:
            return NSLocalizedString("RESPONSE_CLOSING_DOOR", comment: "")
        case .r3:
            return NSLocalizedString("RESPONSE_WOODEN_WALNUT_DOOR", comment: "")
        case .r4:
            return NSLocalizedString("RESPONSE_DOOR_ALREADY_OPEN", comment: "")
        case .r5:
            return NSLocalizedString("RESPONSE_DOOR_ALREADY_CLOSED", comment: "")
        case .r6:
            return NSLocalizedString("RESPONSE_SHEET_ON_DOOR", comment: "")
        case .r7:
            return NSLocalizedString("RESPONSE_DOOR_KEY_LOCKED", comment: "")
        case .r8:
            return NSLocalizedString("RESPONSE_NAIL_TAKE", comment: "")
        case .r9:
            return NSLocalizedString("RESPONSE_NAIL_RUSTY", comment: "")
        case .r10:
            return NSLocalizedString("RESPONSE_SHEET_TAKE", comment: "")
        case .r11:
            return NSLocalizedString("RESPONSE_SHEET_WORDS", comment: "")
        case .r12:
            return NSLocalizedString("RESPONSE_SHEET_STRANGE_CHARS", comment: "")
        case .r13:
            return NSLocalizedString("RESPONSE_BOTTLE_TAKE", comment: "")
        case .r14:
            return NSLocalizedString("RESPONSE_WATER_IN_BOTTLE", comment: "")
        case .r15:
            return NSLocalizedString("RESPONSE_OBJECT_USED", comment: "")
        case .r16:
            return NSLocalizedString("RESPONSE_OBJECT_REMOVED_FROM_INVENTORY", comment: "")
        }
    }
}

struct RoomData
{
    static let totalRoomsNumber: Int = 50
    static let totalTreasuresNumber: Int = 20
    
    // MARK: DICTIONARY KEYS
    static let KEY_ID = "id"
    static let KEY_NAME = "name"
    static let KEY_DESCRIPTION = "description"
    static let KEY_ALT_DESCRIPTION = "alternative_descriptions"
    static let KEY_PICKERABLE_OBJECTS_NUMBERS = "pickerable_object_number"
    
    static let KEY_OBJECTS = "objects"
    static let KEY_OBJECTS_ACTIONS = "actions"
    static let KEY_OBJECTS_ACTIONS_RESPONSES = "responses"
    static let KEY_OBJECT_NAME = "text"
    static let KEY_OBJECT_ALT_DESC_ID = "alt_desc_id"
    static let KEY_OBJECT_CHARACTERISTIC = "characteristics"
    
    static let KEY_ACTIONS_NAME = "value"
    static let KEY_ACTIONS_RESPONSE = "value"
    
    static let KEY_CHARACTERISTICS_VALUE = "value"
    static let KEY_CHARACTERISTICS_HP = "hp"
    static let KEY_CHARACTERISTICS_EXP = "exp"
    static let KEY_CHARACTERISTICS_GOLD = "gold"
    
    static let KEY_LINKS = "links"
    static let KEY_LINK_SHORT_NAME = "text"
    static let KEY_LINK_NAME = "value"
    static let KEY_LINK_TO = "to"
    static let KEY_LINK_FROM = "from"
    
    // MARK: ACTIONS
    static let ACTION_ID_$A1 = "$A1"
    static let ACTION_ID_$A2 = "$A2"
    static let ACTION_ID_$A3 = "$A3"
    static let ACTION_ID_$A4 = "$A4"
    static let ACTION_ID_$A5 = "$A5"
    static let ACTION_ID_$A6 = "$A6"
    static let ACTION_ID_$A7 = "$A7"
    static let ACTION_ID_$A8 = "$A8"
    
    static let actions: [[String : String]] = [["id" : RoomData.ACTION_ID_$A1, "value" : localizedActions.open.localized],
                                               ["id" : RoomData.ACTION_ID_$A2, "value" : localizedActions.get.localized],
                                               ["id" : RoomData.ACTION_ID_$A3, "value" : localizedActions.drop.localized],
                                               ["id" : RoomData.ACTION_ID_$A4, "value" : localizedActions.examines.localized],
                                               ["id" : RoomData.ACTION_ID_$A5, "value" : localizedActions.close.localized],
                                               ["id" : RoomData.ACTION_ID_$A6, "value" : localizedActions.read.localized],
                                               ["id" : RoomData.ACTION_ID_$A7, "value" : localizedActions.use.localized],
                                               ["id" : RoomData.ACTION_ID_$A8, "value" : localizedActions.attack.localized]]
    
    // MARK: RESPONSES
    static let RESPONSE_ID_$R1 = "$R1"
    static let RESPONSE_ID_$R2 = "$R2"
    static let RESPONSE_ID_$R3 = "$R3"
    static let RESPONSE_ID_$R4 = "$R4"
    static let RESPONSE_ID_$R5 = "$R5"
    static let RESPONSE_ID_$R6 = "$R6"
    static let RESPONSE_ID_$R7 = "$R7"
    static let RESPONSE_ID_$R8 = "$R8"
    static let RESPONSE_ID_$R9 = "$R9"
    static let RESPONSE_ID_$R10 = "$R10"
    static let RESPONSE_ID_$R11 = "$R11"
    static let RESPONSE_ID_$R12 = "$R12"
    static let RESPONSE_ID_$R13 = "$R13"
    static let RESPONSE_ID_$R14 = "$R14"
    static let RESPONSE_ID_$R15 = "$R15"
    static let RESPONSE_ID_$R16 = "$R16"
    
    static let responses: [[String : String]] = [["id" : RoomData.RESPONSE_ID_$R1, "value" : localizedResponses.r1.localized],
                                                 ["id" : RoomData.RESPONSE_ID_$R2, "value" : localizedResponses.r2.localized],
                                                 ["id" : RoomData.RESPONSE_ID_$R3, "value" : localizedResponses.r3.localized],
                                                 ["id" : RoomData.RESPONSE_ID_$R4, "value" : localizedResponses.r4.localized],
                                                 ["id" : RoomData.RESPONSE_ID_$R5, "value" : localizedResponses.r5.localized],
                                                 ["id" : RoomData.RESPONSE_ID_$R6, "value" : localizedResponses.r6.localized],
                                                 ["id" : RoomData.RESPONSE_ID_$R7, "value" : localizedResponses.r7.localized],
                                                 ["id" : RoomData.RESPONSE_ID_$R8, "value" : localizedResponses.r8.localized],
                                                 ["id" : RoomData.RESPONSE_ID_$R9, "value" : localizedResponses.r9.localized],
                                                 ["id" : RoomData.RESPONSE_ID_$R10, "value" : localizedResponses.r10.localized],
                                                 ["id" : RoomData.RESPONSE_ID_$R11, "value" : localizedResponses.r11.localized],
                                                 ["id" : RoomData.RESPONSE_ID_$R12, "value" : localizedResponses.r12.localized],
                                                 ["id" : RoomData.RESPONSE_ID_$R13, "value" : localizedResponses.r13.localized],
                                                 ["id" : RoomData.RESPONSE_ID_$R14, "value" : localizedResponses.r14.localized],
                                                 ["id" : RoomData.RESPONSE_ID_$R15, "value" : localizedResponses.r15.localized],
                                                 ["id" : RoomData.RESPONSE_ID_$R16, "value" : localizedResponses.r16.localized]]
    
    // MARK: CHARACTERISTICS
    static let CHARACTERISTIC_ID_$C1 = "$C1"
    static let CHARACTERISTIC_ID_$C2 = "$C2"
    static let CHARACTERISTIC_ID_$C3 = "$C3"
    static let CHARACTERISTIC_ID_$C4 = "$C4"
    
    static let characteristics: [[String : Any]] = [["id" : RoomData.CHARACTERISTIC_ID_$C1, "value" : ["exp" : 10, "hp" : 2, "gold" : 5]],
                                                    ["id" : RoomData.CHARACTERISTIC_ID_$C2, "value" : ["exp" : 2, "hp" : 0, "gold" : 3]],
                                                    ["id" : RoomData.CHARACTERISTIC_ID_$C3, "value" : ["exp" : 2, "hp" : 3, "gold" : 0]],
                                                    ["id" : RoomData.CHARACTERISTIC_ID_$C4, "value" : ["exp" : 8, "hp" : 5, "gold" : 12]]]
    
    // MARK: DIRECTIONS
    static let DIRECTION_ID_$N = "$N"
    static let DIRECTION_ID_$E = "$E"
    static let DIRECTION_ID_$S = "$S"
    static let DIRECTION_ID_$W = "$W"
    
    static let directions: [[String : String]] = [["id" : RoomData.DIRECTION_ID_$N, "value" : localizedDirections.north.localized],
                                                  ["id" : RoomData.DIRECTION_ID_$E, "value" : localizedDirections.east.localized],
                                                  ["id" : RoomData.DIRECTION_ID_$S, "value" : localizedDirections.south.localized],
                                                  ["id" : RoomData.DIRECTION_ID_$W, "value" : localizedDirections.west.localized]]
    
    
    // MARK: ALTERNATIVE DESCRIPTION ID
    static let ALTERNATIVE_DESCRIPTION_$AD_NULL = "$AD_NULL"
    static let ALTERNATIVE_DESCRIPTION_$AD1 = "$AD1"
    static let ALTERNATIVE_DESCRIPTION_$AD2 = "$AD2"
    static let ALTERNATIVE_DESCRIPTION_$AD3 = "$AD3"
    
    static let startingRoom: String = "room_001"
    
    static func getRoomData(byGivenName name: String) -> [String : Any]?
    {
        switch name
        {
        case "room_001_it":
            return R1.dataIT
        case "room_001_en":
            return R1.dataEN
        case "room_002_it":
            return R2.dataIT
        case "room_002_en":
            return R2.dataEN
        case "room_003_it":
            return R3.dataIT
        case "room_003_en":
            return R3.dataEN
        case "room_004_it":
            return R4.dataIT
        case "room_004_en":
            return R4.dataEN
        case "room_005_it":
            return R5.dataIT
        case "room_005_en":
            return R5.dataEN
        default:
            return nil
        }
    }
}

