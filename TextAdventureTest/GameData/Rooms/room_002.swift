//
//  room_002.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 06/03/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import Foundation

struct R2
{
    // MARK: ROOM 1
    static let dataIT: [String : Any] = ["id" : "room_002",
                                         "name" : "Stanza 2",
                                         "description" : "Sei nella stanza 2. A $L1 c'è la stanza 1. A $L2 c'è la stanza 3",
                                         "objects" : [],
                                         "links" : [["id" : "$L1",
                                                     "text" : "$S",
                                                     "to" : "room_001",
                                                     "from" : "room_002"],
                                                    ["id" : "$L2",
                                                     "text" : "$E",
                                                     "to" : "room_003",
                                                     "from" : "room_002"]]
    ]
    
    static let dataEN: [String : Any] = ["id" : "room_002",
                                         "name" : "Stanza 2",
                                         "description" : "Sei nella stanza 2. A $L1 c'è la stanza 1. A $L2 c'è la stanza 3",
                                         "objects" : [],
                                         "links" : [["id" : "$L1",
                                                     "text" : "$S",
                                                     "to" : "room_001",
                                                     "from" : "room_002"],
                                                    ["id" : "$L2",
                                                     "text" : "$E",
                                                     "to" : "room_003",
                                                     "from" : "room_002"]]
    ]
}
