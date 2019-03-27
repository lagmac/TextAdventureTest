//
//  room_003.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 06/03/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import Foundation

struct R3
{
    // MARK: ROOM 1
    static let dataIT: [String : Any] = ["id" : "room_003",
                                         "name" : "Stanza 3",
                                         "description" : "Sei nella stanza 3. A $L1 c'è la stanza 4. A $L2 c'è la stanza 2. A $L3 c'è la stanza 9.",
                                         "objects" : [],
                                         "links" : [["id" : "$L1",
                                                     "text" : "$N",
                                                     "to" : "room_004",
                                                     "from" : "room_003"],
                                                    ["id" : "$L2",
                                                     "text" : "$W",
                                                     "to" : "room_002",
                                                     "from" : "room_003"],
                                                    ["id" : "$L3",
                                                     "text" : "$S",
                                                     "to" : "room_009",
                                                     "from" : "room_003"]]
    ]
    
    static let dataEN: [String : Any] = ["id" : "room_003",
                                         "name" : "Stanza 3",
                                         "description" : "Sei nella stanza 3. A $L1 c'è la stanza 4. A $L2 c'è la stanza 2. A $L3 c'è la stanza 9.",
                                         "objects" : [],
                                         "links" : [["id" : "$L1",
                                                     "text" : "$N",
                                                     "to" : "room_004",
                                                     "from" : "room_003"],
                                                    ["id" : "$L2",
                                                     "text" : "$W",
                                                     "to" : "room_002",
                                                     "from" : "room_003"],
                                                    ["id" : "$L3",
                                                     "text" : "$S",
                                                     "to" : "room_009",
                                                     "from" : "room_003"]]
    ]
}
