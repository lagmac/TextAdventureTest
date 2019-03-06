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
                                                       "text" : localizedObjects.door.localized,
                                                       "actions" : [],
                                                       "responses" : []]],
                                         "links" : [["id" : "$L1",
                                                     "text" : RoomData.DIRECTION_ID_$W,
                                                     "to" : "room_027",
                                                     "from" : "room_028"]]
    ]
    
    static let dataEN: [String : Any] = ["id" : "room_028",
                                         "name" : "Stanza 28",
                                         "description" : "Sei nella stanza 28. A $L1 c'è la stanza 27.",
                                         "objects" : [],
                                         "links" : [["id" : "$L1",
                                                     "text" : RoomData.DIRECTION_ID_$W,
                                                     "to" : "room_027",
                                                     "from" : "room_028"]]
    ]
}
