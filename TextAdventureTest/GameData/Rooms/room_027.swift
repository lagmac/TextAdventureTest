//
//  room_027.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 06/03/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import Foundation

struct R27
{
    // MARK: ROOM 1
    static let dataIT: [String : Any] = ["id" : "room_027",
                                         "name" : "Stanza 27",
                                         "description" : "Sei nella stanza 27. A $L1 c'è la stanza 28. A $L2 c'è la stanza 26.",
                                         "objects" : [],
                                         "links" : [["id" : "$L1",
                                                     "text" : "$E",
                                                     "to" : "room_028",
                                                     "from" : "room_027"],
                                                    ["id" : "$L2",
                                                     "text" : "$S",
                                                     "to" : "room_026",
                                                     "from" : "room_027"]]
    ]
    
    static let dataEN: [String : Any] = ["id" : "room_027",
                                         "name" : "Stanza 27",
                                         "description" : "Sei nella stanza 27. A $L1 c'è la stanza 28. A $L2 c'è la stanza 26.",
                                         "objects" : [],
                                         "links" : [["id" : "$L1",
                                                     "text" : "$E",
                                                     "to" : "room_028",
                                                     "from" : "room_027"],
                                                    ["id" : "$L2",
                                                     "text" : "$S",
                                                     "to" : "room_026",
                                                     "from" : "room_027"]]
    ]
}
