//
//  room_012.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 06/03/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import Foundation

struct R12
{
    // MARK: ROOM 1
    static let dataIT: [String : Any] = ["id" : "room_012",
                                         "name" : "Stanza 12",
                                         "description" : "Sei nella stanza 12. A $L1 c'è la stanza 24. A $L2 c'è la stanza 11. A $L3 c'è la stanza 15.",
                                         "objects" : [],
                                         "links" : [["id" : "$L1",
                                                     "text" : "$N",
                                                     "to" : "room_024",
                                                     "from" : "room_012"],
                                                    ["id" : "$L2",
                                                     "text" : "$E",
                                                     "to" : "room_011",
                                                     "from" : "room_012"],
                                                    ["id" : "$L3",
                                                     "text" : "$S",
                                                     "to" : "room_015",
                                                     "from" : "room_012"]]
    ]
    
    static let dataEN: [String : Any] = ["id" : "room_012",
                                         "name" : "Stanza 12",
                                         "description" : "Sei nella stanza 12. A $L1 c'è la stanza 24. A $L2 c'è la stanza 11. A $L3 c'è la stanza 15.",
                                         "objects" : [],
                                         "links" : [["id" : "$L1",
                                                     "text" : "$N",
                                                     "to" : "room_024",
                                                     "from" : "room_012"],
                                                    ["id" : "$L2",
                                                     "text" : "$E",
                                                     "to" : "room_011",
                                                     "from" : "room_012"],
                                                    ["id" : "$L3",
                                                     "text" : "$S",
                                                     "to" : "room_015",
                                                     "from" : "room_012"]]
    ]
}
