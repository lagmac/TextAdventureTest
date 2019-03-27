//
//  room_017.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 06/03/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import Foundation

struct R17
{
    // MARK: ROOM 1
    static let dataIT: [String : Any] = ["id" : "room_017",
                                         "name" : "Stanza 17",
                                         "description" : "Sei nella stanza 17. A $L1 c'è la stanza 16. A $L2 c'è la stanza 18.",
                                         "objects" : [],
                                         "links" : [["id" : "$L1",
                                                     "text" : "$W",
                                                     "to" : "room_016",
                                                     "from" : "room_017"],
                                                    ["id" : "$L2",
                                                     "text" : "$E",
                                                     "to" : "room_018",
                                                     "from" : "room_017"]]
    ]
    
    static let dataEN: [String : Any] = ["id" : "room_017",
                                         "name" : "Stanza 17",
                                         "description" : "Sei nella stanza 17. A $L1 c'è la stanza 16. A $L2 c'è la stanza 18.",
                                         "objects" : [],
                                         "links" : [["id" : "$L1",
                                                     "text" : "$W",
                                                     "to" : "room_016",
                                                     "from" : "room_017"],
                                                    ["id" : "$L2",
                                                     "text" : "$E",
                                                     "to" : "room_018",
                                                     "from" : "room_017"]]
    ]
}
