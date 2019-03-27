//
//  room-028.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 06/03/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import Foundation

struct R28
{
    // MARK: ROOM 1
    static let dataIT: [String : Any] = ["id" : "room_028",
                                         "name" : "Stanza 28",
                                         "description" : "Sei nella stanza 28. A $L1 c'è la stanza 27. Ad est c'è una porta chiusa.",
                                         "objects" : [["id" : "$O1",
                                                       "text" : "porta",
                                                       "actions" : ["$A1", "$A4"],
                                                       "responses" : ["$R18", "$R19"]]],
                                         "links" : [["id" : "$L1",
                                                     "text" : "$W",
                                                     "to" : "room_027",
                                                     "from" : "room_028"]]
    ]
    
    static let dataEN: [String : Any] = ["id" : "room_028",
                                         "name" : "Stanza 28",
                                         "description" : "Sei nella stanza 28. A $L1 c'è la stanza 27.",
                                         "objects" : [["id" : "$O1",
                                                       "text" : "door",
                                                       "actions" : ["$A1", "$A4"],
                                                       "responses" : ["$R18", "$R19"]]],
                                         "links" : [["id" : "$L1",
                                                     "text" : "$W",
                                                     "to" : "room_027",
                                                     "from" : "room_028"]]
    ]
}
