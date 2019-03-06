//
//  room_015.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 06/03/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import Foundation

struct R15
{
    // MARK: ROOM 1
    static let dataIT: [String : Any] = ["id" : "room_015",
                                         "name" : "Stanza 15",
                                         "description" : "Sei nella stanza 15. A $L1 c'è la stanza 12. A $L2 c'è la stanza 14. A $L3 c'è la stanza 22.",
                                         "objects" : [],
                                         "links" : [["id" : "$L1",
                                                     "text" : RoomData.DIRECTION_ID_$N,
                                                     "to" : "room_012",
                                                     "from" : "room_015"],
                                                    ["id" : "$L2",
                                                     "text" : RoomData.DIRECTION_ID_$W,
                                                     "to" : "room_014",
                                                     "from" : "room_015"],
                                                    ["id" : "$L3",
                                                     "text" : RoomData.DIRECTION_ID_$S,
                                                     "to" : "room_022",
                                                     "from" : "room_015"]]
    ]
    
    static let dataEN: [String : Any] = ["id" : "room_015",
                                         "name" : "Stanza 15",
                                         "description" : "Sei nella stanza 15. A $L1 c'è la stanza 12. A $L2 c'è la stanza 14. A $L3 c'è la stanza 22.",
                                         "objects" : [],
                                         "links" : [["id" : "$L1",
                                                     "text" : RoomData.DIRECTION_ID_$N,
                                                     "to" : "room_012",
                                                     "from" : "room_015"],
                                                    ["id" : "$L2",
                                                     "text" : RoomData.DIRECTION_ID_$W,
                                                     "to" : "room_014",
                                                     "from" : "room_015"],
                                                    ["id" : "$L3",
                                                     "text" : RoomData.DIRECTION_ID_$S,
                                                     "to" : "room_022",
                                                     "from" : "room_015"]]
    ]
}
