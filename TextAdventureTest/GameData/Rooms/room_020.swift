//
//  room_020.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 06/03/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import Foundation

struct R20
{
    // MARK: ROOM 1
    static let dataIT: [String : Any] = ["id" : "room_020",
                                         "name" : "Stanza 20",
                                         "description" : "Sei nella stanza 20. A $L1 c'è la stanza 21. A $L2 c'è la stanza 19.",
                                         "objects" : [],
                                         "links" : [["id" : "$L1",
                                                     "text" : "$W",
                                                     "to" : "room_021",
                                                     "from" : "room_020"],
                                                    ["id" : "$L2",
                                                     "text" : "$E",
                                                     "to" : "room_019",
                                                     "from" : "room_020"]]
    ]
    
    static let dataEN: [String : Any] = ["id" : "room_020",
                                         "name" : "Stanza 20",
                                         "description" : "Sei nella stanza 20. A $L1 c'è la stanza 21. A $L2 c'è la stanza 19.",
                                         "objects" : [],
                                         "links" : [["id" : "$L1",
                                                     "text" : "$W",
                                                     "to" : "room_021",
                                                     "from" : "room_020"],
                                                    ["id" : "$L2",
                                                     "text" : "$E",
                                                     "to" : "room_019",
                                                     "from" : "room_020"]]
    ]
}
