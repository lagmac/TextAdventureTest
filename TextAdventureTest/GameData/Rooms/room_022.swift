//
//  room_022.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 06/03/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import Foundation

struct R22
{
    // MARK: ROOM 1
    static let dataIT: [String : Any] = ["id" : "room_022",
                                         "name" : "Stanza 22",
                                         "description" : "Sei nella stanza 22. A $L1 c'è la stanza 21. A $L2 c'è la stanza 15.",
                                         "objects" : [],
                                         "links" : [["id" : "$L1",
                                                     "text" : "$E",
                                                     "to" : "room_021",
                                                     "from" : "room_022"],
                                                    ["id" : "$L2",
                                                     "text" : "$N",
                                                     "to" : "room_015",
                                                     "from" : "room_022"]]
    ]
    
    static let dataEN: [String : Any] = ["id" : "room_022",
                                         "name" : "Stanza 22",
                                         "description" : "Sei nella stanza 22. A $L1 c'è la stanza 21. A $L2 c'è la stanza 15.",
                                         "objects" : [],
                                         "links" : [["id" : "$L1",
                                                     "text" : "$E",
                                                     "to" : "room_021",
                                                     "from" : "room_022"],
                                                    ["id" : "$L2",
                                                     "text" : "$N",
                                                     "to" : "room_015",
                                                     "from" : "room_022"]]
    ]
}
