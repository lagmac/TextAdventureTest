//
//  room_006.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 06/03/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import Foundation

struct R6
{
    // MARK: ROOM 1
    static let dataIT: [String : Any] = ["id" : "room_006",
                                         "name" : "Stanza 6",
                                         "description" : "Sei nella stanza 6. A $L1 c'è la stanza 7. A $L2 c'è la stanza 5.",
                                         "objects" : [],
                                         "links" : [["id" : "$L1",
                                                     "text" : "$S",
                                                     "to" : "room_007",
                                                     "from" : "room_006"],
                                                    ["id" : "$L2",
                                                     "text" : "$N",
                                                     "to" : "room_005",
                                                     "from" : "room_006"]]
    ]
    
    static let dataEN: [String : Any] = ["id" : "room_006",
                                         "name" : "Stanza 6",
                                         "description" : "Sei nella stanza 6. A $L1 c'è la stanza 7. A $L2 c'è la stanza 5.",
                                         "objects" : [],
                                         "links" : [["id" : "$L1",
                                                     "text" : "$S",
                                                     "to" : "room_007",
                                                     "from" : "room_006"],
                                                    ["id" : "$L2",
                                                     "text" : "$N",
                                                     "to" : "room_005",
                                                     "from" : "room_006"]]
    ]
}
