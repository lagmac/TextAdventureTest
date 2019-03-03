//
//  room_004_studio_segreto.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 29/12/2018.
//  Copyright © 2018 Gino Preti. All rights reserved.
//

import Foundation

struct R4
{
    // MARK: ROOM 4 - STUDIO SEGRETO - DATA
    static let dataIT: [String : Any] = ["id" : "room_004",
                                           "name" : "Studio segreto",
                                           "description" : "Sei in una stanza buia. A $L1 c'è la dispensa.",
                                           "objects" : [],
                                           "links" : [["id" : "$L1",
                                                       "text" : RoomData.DIRECTION_ID_$E,
                                                       "to" : "room_003",
                                                       "from" : "room_004"]]
    ]
    
    static let dataEN: [String : Any] = ["id" : "room_004",
                                         "name" : "Secret study room",
                                         "description" : "You're in a dark room. To the $L1 there is the pantry.",
                                         "objects" : [],
                                         "links" : [["id" : "$L1",
                                                     "text" : RoomData.DIRECTION_ID_$E,
                                                     "to" : "room_003",
                                                     "from" : "room_004"]]
    ]
}
