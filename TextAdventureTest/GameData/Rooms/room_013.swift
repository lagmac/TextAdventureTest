//
//  room_013.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 06/03/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import Foundation

struct R13
{
    // MARK: ROOM 1
    static let dataIT: [String : Any] = ["id" : "room_013",
                                         "name" : "Stanza 13",
                                         "description" : "Sei nella stanza 13. A $L1 c'è la stanza 23. A $L2 c'è la stanza 14.",
                                         "objects" : [],
                                         "links" : [["id" : "$L1",
                                                     "text" : RoomData.DIRECTION_ID_$N,
                                                     "to" : "room_023",
                                                     "from" : "room_013"],
                                                    ["id" : "$L2",
                                                     "text" : RoomData.DIRECTION_ID_$S,
                                                     "to" : "room_014",
                                                     "from" : "room_013"]]
    ]
    
    static let dataEN: [String : Any] = ["id" : "room_013",
                                         "name" : "Stanza 13",
                                         "description" : "Sei nella stanza 13. A $L1 c'è la stanza 23. A $L2 c'è la stanza 14.",
                                         "objects" : [],
                                         "links" : [["id" : "$L1",
                                                     "text" : RoomData.DIRECTION_ID_$N,
                                                     "to" : "room_023",
                                                     "from" : "room_013"],
                                                    ["id" : "$L2",
                                                     "text" : RoomData.DIRECTION_ID_$S,
                                                     "to" : "room_014",
                                                     "from" : "room_013"]]
    ]
}
