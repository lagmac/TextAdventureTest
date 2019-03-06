//
//  room_001.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 06/03/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import Foundation

struct R1
{
    // MARK: ROOM 1
    static let dataIT: [String : Any] = ["id" : "room_001",
                                         "name" : "Stanza 1",
                                         "description" : "Sei nella stanza 1. A $L1 c'è la stanza 2. Ad ovest c'è una $O1 chiusa.",
                                         "objects" : [["id" : "$O1",
                                                       "text" : localizedObjects.door.localized,
                                                       "actions" : [],
                                                       "responses" : []]],
                                         "links" : [["id" : "$L1",
                                                     "text" : RoomData.DIRECTION_ID_$N,
                                                     "to" : "room_002",
                                                     "from" : "room_001"]]
    ]
    
    static let dataEN: [String : Any] = ["id" : "room_001",
                                         "name" : "Stanza 1",
                                         "description" : "Sei nella stanza 1. A $L1 c'è la stanza 2. Ad ovest c'è una $O1 chiusa.",
                                         "objects" : [["id" : "$O1",
                                                       "text" : localizedObjects.door.localized,
                                                       "actions" : [],
                                                       "responses" : []]],
                                         "links" : [["id" : "$L1",
                                                     "text" : RoomData.DIRECTION_ID_$N,
                                                     "to" : "room_002",
                                                     "from" : "room_001"]]
    ]
}


