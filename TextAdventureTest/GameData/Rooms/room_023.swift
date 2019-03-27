//
//  room_023.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 06/03/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import Foundation

struct R23
{
    // MARK: ROOM 1
    static let dataIT: [String : Any] = ["id" : "room_023",
                                         "name" : "Stanza 23",
                                         "description" : "Sei nella stanza 23. A $L1 c'è la stanza 24. A $L2 c'è la stanza 13. Ad est c'è una $O1 chiusa.",
                                         "objects" : [["id" : "$O1",
                                                       "text" : "porta",
                                                       "actions" : ["$A1", "$A4"],
                                                       "responses" : ["$R18", "$R19"]]],
                                         "links" : [["id" : "$L1",
                                                     "text" : "$N",
                                                     "to" : "room_024",
                                                     "from" : "room_023"],
                                                    ["id" : "$L2",
                                                     "text" : "$S",
                                                     "to" : "room_013",
                                                     "from" : "room_023"]]
    ]
    
    static let dataEN: [String : Any] = ["id" : "room_023",
                                         "name" : "Stanza 23",
                                         "description" : "Sei nella stanza 23. A $L1 c'è la stanza 24. A $L2 c'è la stanza 13. Ad est c'è una $O1 chiusa.",
                                         "objects" : [["id" : "$O1",
                                                       "text" : "door",
                                                       "actions" : ["$A1", "$A4"],
                                                       "responses" : ["$R18", "$R19"]]],
                                         "links" : [["id" : "$L1",
                                                     "text" : "$N",
                                                     "to" : "room_024",
                                                     "from" : "room_023"],
                                                    ["id" : "$L2",
                                                     "text" : "$S",
                                                     "to" : "room_013",
                                                     "from" : "room_023"]]
    ]
}
