//
//  room_025.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 06/03/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import Foundation

struct R25
{
    // MARK: ROOM 1
    static let dataIT: [String : Any] = ["id" : "room_025",
                                         "name" : "Stanza 25",
                                         "description" : "Sei nella stanza 25. A $L1 c'è la stanza 26. A $L2 c'è la stanza 23.",
                                         "objects" : [],
                                         "links" : [["id" : "$L1",
                                                     "text" : RoomData.DIRECTION_ID_$E,
                                                     "to" : "room_026",
                                                     "from" : "room_025"],
                                                    ["id" : "$L2",
                                                     "text" : RoomData.DIRECTION_ID_$S,
                                                     "to" : "room_023",
                                                     "from" : "room_025"]]
    ]
    
    static let dataEN: [String : Any] = ["id" : "room_025",
                                         "name" : "Stanza 25",
                                         "description" : "Sei nella stanza 25. A $L1 c'è la stanza 26. A $L2 c'è la stanza 23.",
                                         "objects" : [],
                                         "links" : [["id" : "$L1",
                                                     "text" : RoomData.DIRECTION_ID_$E,
                                                     "to" : "room_026",
                                                     "from" : "room_025"],
                                                    ["id" : "$L2",
                                                     "text" : RoomData.DIRECTION_ID_$S,
                                                     "to" : "room_023",
                                                     "from" : "room_025"]]
    ]
}
