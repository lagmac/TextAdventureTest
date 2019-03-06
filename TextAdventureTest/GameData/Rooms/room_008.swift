//
//  room_008.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 06/03/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import Foundation

struct R8
{
    // MARK: ROOM 1
    static let dataIT: [String : Any] = ["id" : "room_008",
                                         "name" : "Stanza 8",
                                         "description" : "Sei nella stanza 8. A $L1 c'è la stanza 10. A $L2 c'è la stanza 7.",
                                         "objects" : [],
                                         "links" : [["id" : "$L1",
                                                     "text" : RoomData.DIRECTION_ID_$W,
                                                     "to" : "room_010",
                                                     "from" : "room_008"],
                                                    ["id" : "$L2",
                                                     "text" : RoomData.DIRECTION_ID_$N,
                                                     "to" : "room_007",
                                                     "from" : "room_008"]]
    ]
    
    static let dataEN: [String : Any] = ["id" : "room_008",
                                         "name" : "Stanza 8",
                                         "description" : "Sei nella stanza 8. A $L1 c'è la stanza 10. A $L2 c'è la stanza 7.",
                                         "objects" : [],
                                         "links" : [["id" : "$L1",
                                                     "text" : RoomData.DIRECTION_ID_$W,
                                                     "to" : "room_010",
                                                     "from" : "room_008"],
                                                    ["id" : "$L2",
                                                     "text" : RoomData.DIRECTION_ID_$N,
                                                     "to" : "room_007",
                                                     "from" : "room_008"]]
    ]
}
