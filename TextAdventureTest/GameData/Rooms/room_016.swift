//
//  room_016.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 06/03/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import Foundation

struct R16
{
    // MARK: ROOM 1
    static let dataIT: [String : Any] = ["id" : "room_016",
                                         "name" : "Stanza 16",
                                         "description" : "Sei nella stanza 16. A $L1 c'è la stanza 11. A $L2 c'è la stanza 17.",
                                         "objects" : [],
                                         "links" : [["id" : "$L1",
                                                     "text" : "$N",
                                                     "to" : "room_011",
                                                     "from" : "room_016"],
                                                    ["id" : "$L2",
                                                     "text" : "$E",
                                                     "to" : "room_017",
                                                     "from" : "room_016"]]
    ]
    
    static let dataEN: [String : Any] = ["id" : "room_016",
                                         "name" : "Stanza 16",
                                         "description" : "Sei nella stanza 16. A $L1 c'è la stanza 11. A $L2 c'è la stanza 17.",
                                         "objects" : [],
                                         "links" : [["id" : "$L1",
                                                     "text" : "$N",
                                                     "to" : "room_011",
                                                     "from" : "room_016"],
                                                    ["id" : "$L2",
                                                     "text" : "$E",
                                                     "to" : "room_017",
                                                     "from" : "room_016"]]
    ]
}
