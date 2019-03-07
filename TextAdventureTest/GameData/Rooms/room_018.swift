//
//  room_018.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 06/03/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import Foundation

struct R18
{
    // MARK: ROOM 1
    static let dataIT: [String : Any] = ["id" : "room_018",
                                         "name" : "Stanza 18",
                                         "description" : "Sei nella stanza 18. A $L1 c'è la stanza 17. A $L2 c'è la stanza 19.",
                                         "objects" : [],
                                         "links" : [["id" : "$L1",
                                                     "text" : "$E",
                                                     "to" : "room_017",
                                                     "from" : "room_018"],
                                                    ["id" : "$L2",
                                                     "text" : "$S",
                                                     "to" : "room_019",
                                                     "from" : "room_018"]]
    ]
    
    static let dataEN: [String : Any] = ["id" : "room_018",
                                         "name" : "Stanza 18",
                                         "description" : "Sei nella stanza 18. A $L1 c'è la stanza 17. A $L2 c'è la stanza 19.",
                                         "objects" : [],
                                         "links" : [["id" : "$L1",
                                                     "text" : "$E",
                                                     "to" : "room_017",
                                                     "from" : "room_018"],
                                                    ["id" : "$L2",
                                                     "text" : "$S",
                                                     "to" : "room_019",
                                                     "from" : "room_018"]]
    ]
}
