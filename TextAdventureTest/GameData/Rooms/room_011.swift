//
//  room_011.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 06/03/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import Foundation

struct R11
{
    // MARK: ROOM 1
    static let dataIT: [String : Any] = ["id" : "room_011",
                                         "name" : "Stanza 11",
                                         "description" : "Sei nella stanza 11. A $L1 c'è la stanza 10. A $L2 c'è la stanza 16. A $L3 c'è la stanza 12.",
                                         "objects" : [],
                                         "links" : [["id" : "$L1",
                                                     "text" : RoomData.DIRECTION_ID_$E,
                                                     "to" : "room_010",
                                                     "from" : "room_011"],
                                                    ["id" : "$L2",
                                                     "text" : RoomData.DIRECTION_ID_$S,
                                                     "to" : "room_016",
                                                     "from" : "room_011"],
                                                    ["id" : "$L3",
                                                     "text" : RoomData.DIRECTION_ID_$W,
                                                     "to" : "room_012",
                                                     "from" : "room_011"]]
    ]
    
    static let dataEN: [String : Any] = ["id" : "room_011",
                                         "name" : "Stanza 11",
                                         "description" : "Sei nella stanza 11. A $L1 c'è la stanza 10. A $L2 c'è la stanza 16. A $L3 c'è la stanza 12.",
                                         "objects" : [],
                                         "links" : [["id" : "$L1",
                                                     "text" : RoomData.DIRECTION_ID_$E,
                                                     "to" : "room_010",
                                                     "from" : "room_011"],
                                                    ["id" : "$L2",
                                                     "text" : RoomData.DIRECTION_ID_$S,
                                                     "to" : "room_016",
                                                     "from" : "room_011"],
                                                    ["id" : "$L3",
                                                     "text" : RoomData.DIRECTION_ID_$W,
                                                     "to" : "room_012",
                                                     "from" : "room_011"]]
    ]
}
