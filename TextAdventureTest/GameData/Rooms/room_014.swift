//
//  room_014.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 06/03/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import Foundation

struct R14
{
    // MARK: ROOM 1
    static let dataIT: [String : Any] = ["id" : "room_014",
                                         "name" : "Stanza 14",
                                         "description" : "Sei nella stanza 14. A $L1 c'è la stanza 15. A $L2 c'è la stanza 13.",
                                         "objects" : [],
                                         "links" : [["id" : "$L1",
                                                     "text" : RoomData.DIRECTION_ID_$E,
                                                     "to" : "room_015",
                                                     "from" : "room_014"],
                                                    ["id" : "$L2",
                                                     "text" : RoomData.DIRECTION_ID_$N,
                                                     "to" : "room_013",
                                                     "from" : "room_014"]]
    ]
    
    static let dataEN: [String : Any] = ["id" : "room_014",
                                         "name" : "Stanza 14",
                                         "description" : "Sei nella stanza 14. A $L1 c'è la stanza 15. A $L2 c'è la stanza 13.",
                                         "objects" : [],
                                         "links" : [["id" : "$L1",
                                                     "text" : RoomData.DIRECTION_ID_$E,
                                                     "to" : "room_015",
                                                     "from" : "room_014"],
                                                    ["id" : "$L2",
                                                     "text" : RoomData.DIRECTION_ID_$N,
                                                     "to" : "room_013",
                                                     "from" : "room_014"]]
    ]
}
