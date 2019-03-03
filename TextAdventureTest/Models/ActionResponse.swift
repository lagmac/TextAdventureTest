//
//  ActionResponse.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 21/11/2018.
//  Copyright © 2018 Gino Preti. All rights reserved.
//

import Foundation

struct ActionResponse: Equatable, Codable
{
    static func == (lhs: ActionResponse, rhs: ActionResponse) -> Bool {
        
        return lhs.id! == rhs.id! && lhs.result! == rhs.result!
    }
    
    var id: String?
    var result: String?
    
    init(withData data: [String: String])
    {
        self.id = data[RoomData.KEY_ID]
        self.result = data[RoomData.KEY_ACTIONS_RESPONSE]
    }
}
