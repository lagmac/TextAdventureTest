//
//  room_005.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 06/03/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import Foundation

struct R5
{
    // MARK: ROOM 1
    static let dataIT: [String : Any] = ["id" : "room_005",
                                         "name" : "Stanza 5",
                                         "description" : "Sei nella stanza 5. A $L1 c'è la stanza 6. A $L2 c'è la stanza 4.",
                                         "objects" : [],
                                         "links" : [["id" : "$L1",
                                                     "text" : RoomData.DIRECTION_ID_$S,
                                                     "to" : "room_006",
                                                     "from" : "room_005"],
                                                    ["id" : "$L2",
                                                     "text" : RoomData.DIRECTION_ID_$W,
                                                     "to" : "room_004",
                                                     "from" : "room_005"]]
    ]
    
    static let dataEN: [String : Any] = ["id" : "room_005",
                                         "name" : "Stanza 5",
                                         "description" : "Sei nella stanza 5. A $L1 c'è la stanza 6. A $L2 c'è la stanza 4.",
                                         "objects" : [],
                                         "links" : [["id" : "$L1",
                                                     "text" : RoomData.DIRECTION_ID_$S,
                                                     "to" : "room_006",
                                                     "from" : "room_005"],
                                                    ["id" : "$L2",
                                                     "text" : RoomData.DIRECTION_ID_$W,
                                                     "to" : "room_004",
                                                     "from" : "room_005"]]
    ]
}
