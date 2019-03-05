//
//  room_005_cripta.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 03/03/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import Foundation

struct R5
{
    // MARK: ROOM 5 - CRIPTA - DATA
    static let dataIT: [String : Any] = ["id" : "room_005",
                                         "name" : "Cripta",
                                         "description" : "La cripta è umida e con il pavimento di pietra. A $L1 c'è l'uscita verso lo studio.\nIn un angolo c'è una strana $O1.",
                                         "objects" : [["id" : "$O1",
                                                       "text" : localizedObjects.creature.localized,
                                                       "actions" : [RoomData.ACTION_ID_$A8],
                                                       "responses" : [RoomData.RESPONSE_ID_$R17],
                                                       "characteristics" : RoomData.CHARACTERISTIC_ID_$C4]],
                                         "links" : [["id" : "$L1",
                                                     "text" : RoomData.DIRECTION_ID_$E,
                                                     "to" : "room_004",
                                                     "from" : "room_005"]]
    ]
    
    static let dataEN: [String : Any] = ["id" : "room_005",
                                         "name" : "Cript",
                                         "description" : "The cript is damp with a stone floor. To the $L1 there is the exit to the study room.\nIn a corner there is a strange $O1.",
                                         "objects" : [["id" : "$O1",
                                                       "text" : localizedObjects.creature.localized,
                                                       "actions" : [RoomData.ACTION_ID_$A8],
                                                       "responses" : [RoomData.RESPONSE_ID_$R17],
                                                       "characteristics" : RoomData.CHARACTERISTIC_ID_$C4]],
                                         "links" : [["id" : "$L1",
                                                     "text" : RoomData.DIRECTION_ID_$E,
                                                     "to" : "room_004",
                                                     "from" : "room_005"]]
    ]
}
