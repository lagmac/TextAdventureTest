//
//  ObjectAction.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 21/11/2018.
//  Copyright © 2018 Gino Preti. All rights reserved.
//

import Foundation

class ObjectAction: NSObject, Codable
{
    static func == (lhs: ObjectAction, rhs: ObjectAction) -> Bool {
        
        return lhs.id! == rhs.id! && lhs.name! == rhs.name! && lhs.response! == rhs.response! && lhs.used! == rhs.used!
    }
    
    var id: String?
    var name: String?
    var response: ActionResponse?
    var used: Bool?
    
    init(withData data: [String : String], andResponse response: [String : String]?)
    {
        self.id = data[RoomData.KEY_ID]
        self.name = data[RoomData.KEY_ACTIONS_NAME]
        self.used = false
        
        if let _response = response
        {
            self.response = ActionResponse(withData: _response)
        }
    }
    
    init(withId aid: String, responseId rId: String)
    {
        
    }
}
