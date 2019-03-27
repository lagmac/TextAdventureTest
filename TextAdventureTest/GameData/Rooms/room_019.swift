//
//  room_019.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 06/03/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import Foundation

struct R19
{
    // MARK: ROOM 1
    static let dataIT: [String : Any] = ["id" : "room_019",
                                         "name" : "Stanza 19",
                                         "description" : "Sei nella stanza 19. A $L1 c'è la stanza 18. A $L2 c'è la stanza 20.",
                                         "objects" : [],
                                         "links" : [["id" : "$L1",
                                                     "text" : "$N",
                                                     "to" : "room_018",
                                                     "from" : "room_019"],
                                                    ["id" : "$L2",
                                                     "text" : "$W",
                                                     "to" : "room_020",
                                                     "from" : "room_019"]]
    ]
    
    static let dataEN: [String : Any] = ["id" : "room_019",
                                         "name" : "Stanza 19",
                                         "description" : "Sei nella stanza 19. A $L1 c'è la stanza 18. A $L2 c'è la stanza 20.",
                                         "objects" : [],
                                         "links" : [["id" : "$L1",
                                                     "text" : "$N",
                                                     "to" : "room_018",
                                                     "from" : "room_019"],
                                                    ["id" : "$L2",
                                                     "text" : "$W",
                                                     "to" : "room_020",
                                                     "from" : "room_019"]]
    ]
}
