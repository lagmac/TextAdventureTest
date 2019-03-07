//
//  room_010.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 06/03/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import Foundation

struct R10
{
    // MARK: ROOM 1
    static let dataIT: [String : Any] = ["id" : "room_010",
                                         "name" : "Stanza 10",
                                         "description" : "Sei nella stanza 10. A $L1 c'è la stanza 9. A $L2 c'è la stanza 11. A $L3 c'è la stanza 8.",
                                         "objects" : [],
                                         "links" : [["id" : "$L1",
                                                     "text" : "$N",
                                                     "to" : "room_009",
                                                     "from" : "room_010"],
                                                    ["id" : "$L2",
                                                     "text" : "$W",
                                                     "to" : "room_011",
                                                     "from" : "room_010"],
                                                    ["id" : "$L3",
                                                     "text" : "$E",
                                                     "to" : "room_008",
                                                     "from" : "room_010"]]
    ]
    
    static let dataEN: [String : Any] = ["id" : "room_010",
                                         "name" : "Stanza 10",
                                         "description" : "Sei nella stanza 10. A $L1 c'è la stanza 9. A $L2 c'è la stanza 11. A $L3 c'è la stanza 8.",
                                         "objects" : [],
                                         "links" : [["id" : "$L1",
                                                     "text" : "$N",
                                                     "to" : "room_009",
                                                     "from" : "room_010"],
                                                    ["id" : "$L2",
                                                     "text" : "$W",
                                                     "to" : "room_011",
                                                     "from" : "room_010"],
                                                    ["id" : "$L3",
                                                     "text" : "$E",
                                                     "to" : "room_008",
                                                     "from" : "room_010"]]
    ]
}
