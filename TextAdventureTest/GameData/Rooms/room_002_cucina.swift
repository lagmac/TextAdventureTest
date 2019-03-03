//
//  room_002_cucina.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 29/12/2018.
//  Copyright © 2018 Gino Preti. All rights reserved.
//

import Foundation

struct R2
{
    // MARK: ROOM 2 - CUCINA - DATA
    static let dataIT: [String : Any] = ["id" : "room_002",
                                           "name" : "Cucina",
                                           "description" : "Sei nella cucina. Ad $L1 c'è la cantina.\nSul tavolo c'è una $O6 che sembra essere piena con un liquido.",
                                           "alternative_descriptions" : ["$AD_NULL" : "Sei nella cucina. Ad $L1 c'è la cantina.\nVedi un tavolo di legno."],
                                           "pickerable_object_number" : 1,
                                           "objects" : [["id" : "$O6",
                                                         "text" : localizedObjects.bottle.localized,
                                                         "alt_desc_id" : "$AD_NULL",
                                                         "actions" : [RoomData.ACTION_ID_$A2, RoomData.ACTION_ID_$A4],
                                                         "responses" : [RoomData.RESPONSE_ID_$R13, RoomData.RESPONSE_ID_$R14],
                                                         "characteristics" : RoomData.CHARACTERISTIC_ID_$C3]],
                                           "links" : [["id" : "$L1",
                                                       "text" : RoomData.DIRECTION_ID_$W,
                                                       "to" : "room_001",
                                                       "from" : "room_002"]]
    ]
    
    static let dataEN: [String : Any] = ["id" : "room_002",
                                         "name" : "Kitchen",
                                         "description" : "You're in the kitchen. To the $L1 there is the cellar.\nThere is a $O6 on the table with a liquid inside.",
                                         "alternative_descriptions" : ["$AD_NULL" : "You're in the kitchen. To the $L1 there is the cellar.\nYou see a wooden table."],
                                         "pickerable_object_number" : 1,
                                         "objects" : [["id" : "$O6",
                                                       "text" : localizedObjects.bottle.localized,
                                                       "alt_desc_id" : "$AD_NULL",
                                                       "actions" : [RoomData.ACTION_ID_$A2, RoomData.ACTION_ID_$A4],
                                                       "responses" : [RoomData.RESPONSE_ID_$R13, RoomData.RESPONSE_ID_$R14],
                                                       "characteristics" : RoomData.CHARACTERISTIC_ID_$C3]],
                                         "links" : [["id" : "$L1",
                                                     "text" : RoomData.DIRECTION_ID_$W,
                                                     "to" : "room_001",
                                                     "from" : "room_002"]]
    ]
}
