//
//  room_004.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 06/03/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import Foundation

struct R4
{
    // MARK: ROOM 1
    static let dataIT: [String : Any] = ["id" : "room_004",
                                         "name" : "Stanza 4",
                                         "description" : "Sei nella stanza 4. A $L1 c'è la stanza 5. A $L2 c'è la stanza 3. Ad ovest c'è una $O1 chiusa.",
                                         "objects" : [["id" : "$O1",
                                                       "text" : localizedObjects.door.localized,
                                                       "actions" : [],
                                                       "responses" : []]],
                                         "links" : [["id" : "$L1",
                                                     "text" : RoomData.DIRECTION_ID_$E,
                                                     "to" : "room_005",
                                                     "from" : "room_004"],
                                                    ["id" : "$L2",
                                                     "text" : RoomData.DIRECTION_ID_$S,
                                                     "to" : "room_003",
                                                     "from" : "room_004"]]
    ]
    
    static let dataEN: [String : Any] = ["id" : "room_004",
                                         "name" : "Stanza 4",
                                         "description" : "Sei nella stanza 4. A $L1 c'è la stanza 5. A $L2 c'è la stanza 3. Ad ovest c'è una $O1 chiusa.",
                                         "objects" : [["id" : "$O1",
                                                       "text" : localizedObjects.door.localized,
                                                       "actions" : [],
                                                       "responses" : []]],
                                         "links" : [["id" : "$L1",
                                                     "text" : RoomData.DIRECTION_ID_$E,
                                                     "to" : "room_005",
                                                     "from" : "room_004"],
                                                    ["id" : "$L2",
                                                     "text" : RoomData.DIRECTION_ID_$S,
                                                     "to" : "room_003",
                                                     "from" : "room_004"]]
    ]
}
