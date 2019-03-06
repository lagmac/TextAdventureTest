//
//  room_001_cantina.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 29/12/2018.
//  Copyright © 2018 Gino Preti. All rights reserved.
//

import Foundation

struct MOCK_ROOM
{
    static let dataIT: [String : Any] = ["id" : "mock_room",
                                           "name" : "Mock Room",
                                           "description" : "Ad $L1 c'è una $O1. Un'altra $O2 a $L2.\nSu la $O5 ad est c'è attaccato un $O4 con un $O3.",
                                           "alternative_descriptions" : ["$AD1" : "Ad $L1 c'è una $O1. Un'altra $O2 a $L2.\nSu la $O5 ad est c'è un $O3.",
                                                                         "$AD2" : "Ad $L1 c'è una $O1. Un'altra $O2 a $L2.\nA terra c'è un $O4.",
                                                                         "$AD_NULL" : "Ad $L1 c'è una $O1. Un'altra $O2 a $L2."],
                                           "pickerable_object_number" : 2,
                                           "objects" : [["id" : "$O1",
                                                         "text" : localizedObjects.door.localized,
                                                         "actions" : [RoomData.ACTION_ID_$A1, RoomData.ACTION_ID_$A5, RoomData.ACTION_ID_$A4],
                                                         "responses" : [RoomData.RESPONSE_ID_$R1, RoomData.RESPONSE_ID_$R2, RoomData.RESPONSE_ID_$R3]],
                                                        ["id" : "$O2",
                                                         "text" : localizedObjects.door.localized,
                                                         "actions" : [RoomData.ACTION_ID_$A1, RoomData.ACTION_ID_$A5, RoomData.ACTION_ID_$A4],
                                                         "responses" : [RoomData.RESPONSE_ID_$R7, RoomData.RESPONSE_ID_$R5, RoomData.RESPONSE_ID_$R6]],
                                                        ["id" : "$O3",
                                                         "text" : localizedObjects.nail.localized,
                                                         "alt_desc_id" : "$AD2",
                                                         "actions" : [RoomData.ACTION_ID_$A2, RoomData.ACTION_ID_$A4],
                                                         "responses" : [RoomData.RESPONSE_ID_$R8, RoomData.RESPONSE_ID_$R9],
                                                         "characteristics" : RoomData.CHARACTERISTIC_ID_$C1],
                                                        ["id" : "$O4",
                                                         "text" : localizedObjects.sheet.localized,
                                                         "alt_desc_id" : "$AD1",
                                                         "actions" : [RoomData.ACTION_ID_$A2, RoomData.ACTION_ID_$A4, RoomData.ACTION_ID_$A6],
                                                         "responses" : [RoomData.RESPONSE_ID_$R10, RoomData.RESPONSE_ID_$R11, RoomData.RESPONSE_ID_$R12],
                                                         "characteristics" : RoomData.CHARACTERISTIC_ID_$C2],
                                                        ["id" : "$O5",
                                                         "text" : localizedObjects.door.localized,
                                                         "actions" : [RoomData.ACTION_ID_$A1, RoomData.ACTION_ID_$A5, RoomData.ACTION_ID_$A4],
                                                         "responses" : [RoomData.RESPONSE_ID_$R7, RoomData.RESPONSE_ID_$R5, RoomData.RESPONSE_ID_$R6]]],
                                           "links" : [["id" : "$L1",
                                                       "text" : RoomData.DIRECTION_ID_$E,
                                                       "to" : "room_002",
                                                       "from" : "room_001"],
                                                      ["id" : "$L2",
                                                       "text" : RoomData.DIRECTION_ID_$N,
                                                       "to" : "room_003",
                                                       "from" : "room_001"]]
    ]
}
