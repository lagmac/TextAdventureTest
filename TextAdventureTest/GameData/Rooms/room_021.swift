//
//  room_021.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 06/03/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import Foundation

struct R21
{
    // MARK: ROOM 1
    static let dataIT: [String : Any] = ["id" : "room_021",
                                         "name" : "Stanza 21",
                                         "description" : "Sei nella stanza 21. A $L1 c'è la stanza 22. A $L2 c'è la stanza 20.",
                                         "objects" : [],
                                         "links" : [["id" : "$L1",
                                                     "text" : "$W",
                                                     "to" : "room_022",
                                                     "from" : "room_021"],
                                                    ["id" : "$L2",
                                                     "text" : "$E",
                                                     "to" : "room_020",
                                                     "from" : "room_021"]]
    ]
    
    static let dataEN: [String : Any] = ["id" : "room_021",
                                         "name" : "Stanza 21",
                                         "description" : "Sei nella stanza 21. A $L1 c'è la stanza 22. A $L2 c'è la stanza 20.",
                                         "objects" : [],
                                         "links" : [["id" : "$L1",
                                                     "text" : "$W",
                                                     "to" : "room_022",
                                                     "from" : "room_021"],
                                                    ["id" : "$L2",
                                                     "text" : "$E",
                                                     "to" : "room_020",
                                                     "from" : "room_021"]]
    ]
}
