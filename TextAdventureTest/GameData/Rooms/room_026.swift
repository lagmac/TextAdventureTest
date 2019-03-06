//
//  room_026.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 06/03/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import Foundation

struct R26
{
    // MARK: ROOM 1
    static let dataIT: [String : Any] = ["id" : "room_026",
                                         "name" : "Stanza 26",
                                         "description" : "Sei nella stanza 26. A $L1 c'è la stanza 27. A $L2 c'è la stanza 25.",
                                         "objects" : [],
                                         "links" : [["id" : "$L1",
                                                     "text" : RoomData.DIRECTION_ID_$N,
                                                     "to" : "room_027",
                                                     "from" : "room_026"],
                                                    ["id" : "$L2",
                                                     "text" : RoomData.DIRECTION_ID_$W,
                                                     "to" : "room_025",
                                                     "from" : "room_026"]]
    ]
    
    static let dataEN: [String : Any] = ["id" : "room_026",
                                         "name" : "Stanza 26",
                                         "description" : "Sei nella stanza 26. A $L1 c'è la stanza 27. A $L2 c'è la stanza 25.",
                                         "objects" : [],
                                         "links" : [["id" : "$L1",
                                                     "text" : RoomData.DIRECTION_ID_$N,
                                                     "to" : "room_027",
                                                     "from" : "room_026"],
                                                    ["id" : "$L2",
                                                     "text" : RoomData.DIRECTION_ID_$W,
                                                     "to" : "room_025",
                                                     "from" : "room_026"]]
    ]
}
