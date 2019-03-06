//
//  room_007.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 06/03/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import Foundation

struct R7
{
    // MARK: ROOM 1
    static let dataIT: [String : Any] = ["id" : "room_007",
                                         "name" : "Stanza 7",
                                         "description" : "Sei nella stanza 7. A $L1 c'è la stanza 8. A $L2 c'è la stanza 6.",
                                         "objects" : [],
                                         "links" : [["id" : "$L1",
                                                     "text" : RoomData.DIRECTION_ID_$S,
                                                     "to" : "room_008",
                                                     "from" : "room_007"],
                                                    ["id" : "$L2",
                                                     "text" : RoomData.DIRECTION_ID_$N,
                                                     "to" : "room_006",
                                                     "from" : "room_007"]]
    ]
    
    static let dataEN: [String : Any] = ["id" : "room_007",
                                         "name" : "Stanza 7",
                                         "description" : "Sei nella stanza 7. A $L1 c'è la stanza 8. A $L2 c'è la stanza 6.",
                                         "objects" : [],
                                         "links" : [["id" : "$L1",
                                                     "text" : RoomData.DIRECTION_ID_$S,
                                                     "to" : "room_008",
                                                     "from" : "room_007"],
                                                    ["id" : "$L2",
                                                     "text" : RoomData.DIRECTION_ID_$N,
                                                     "to" : "room_006",
                                                     "from" : "room_007"]]
    ]
}
