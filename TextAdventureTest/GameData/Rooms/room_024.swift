//
//  room_024.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 06/03/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import Foundation

struct R24
{
    // MARK: ROOM 1
    static let dataIT: [String : Any] = ["id" : "room_024",
                                         "name" : "Stanza 24",
                                         "description" : "Sei nella stanza 24. A $L1 c'è la stanza 12. Ad est c'è una $O1 chiusa ed anche ad ovest c'è una $O2 chiusa.",
                                         "objects" : [["id" : "$O1",
                                                       "text" : localizedObjects.door.localized,
                                                       "actions" : [],
                                                       "responses" : []],
                                                      ["id" : "$O2",
                                                       "text" : localizedObjects.door.localized,
                                                       "actions" : [],
                                                       "responses" : []]],
                                         "links" : [["id" : "$L1",
                                                     "text" : RoomData.DIRECTION_ID_$S,
                                                     "to" : "room_012",
                                                     "from" : "room_024"]]
    ]
    
    static let dataEN: [String : Any] = ["id" : "room_024",
                                         "name" : "Stanza 24",
                                         "description" : "Sei nella stanza 24. A $L1 c'è la stanza 12. Ad est c'è una $O1 chiusa ed anche ad ovest c'è una $O2 chiusa.",
                                         "objects" : [["id" : "$O1",
                                                       "text" : localizedObjects.door.localized,
                                                       "actions" : [],
                                                       "responses" : []],
                                                      ["id" : "$O2",
                                                       "text" : localizedObjects.door.localized,
                                                       "actions" : [],
                                                       "responses" : []]],
                                         "links" : [["id" : "$L1",
                                                     "text" : RoomData.DIRECTION_ID_$S,
                                                     "to" : "room_012",
                                                     "from" : "room_024"]]
    ]
}
