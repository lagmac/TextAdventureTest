//
//  MapView.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 09/03/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import UIKit

class MapView: UIImageView
{
    let roomSize: CGSize = CGSize(width: 90.0, height: 90.0)
    
    var startOriginX: CGFloat!
    var startOriginY: CGFloat!
    
    var roomNameList: [String]?
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        startOriginX = (self.frame.width / 2) - roomSize.width / 2
        startOriginY = (self.frame.height / 2) - roomSize.height / 2
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func draw(_ rect: CGRect)
    {

    }
    
    func drawRoom()
    {
        guard roomNameList != nil else {
            
            return
        }
        
        let renderer = UIGraphicsImageRenderer(size: self.frame.size)
        
        let img = renderer.image { ctx in
            
            for roomName in roomNameList!
            {
                if let roomCoord = MapCoordinateList.list[roomName]
                {
                    let oX = startOriginX + roomCoord.coordX!
                    let oY = startOriginY + roomCoord.coordY!
                    
                    let rectangle = CGRect(x: oX, y: oY, width: roomSize.width, height: roomSize.height)
                    
                    ctx.cgContext.setFillColor(UIColor.red.cgColor)
                    ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
                    ctx.cgContext.setLineWidth(2)
                    
                    ctx.cgContext.addRect(rectangle)
                    ctx.cgContext.drawPath(using: .fillStroke)
                }
            }
        }
        
        self.image = img
        
        self.setNeedsDisplay()
    }
}

struct MapRoomCoordinate
{
    var coordX: CGFloat?
    var coordY: CGFloat?
}

struct MapCoordinateList
{
    static let list: [String : MapRoomCoordinate] = ["room_001" : MapRoomCoordinate(coordX: 0.0,coordY: 0.0),
                                                     "room_002" : MapRoomCoordinate(coordX: 0.0,coordY: -110.0),
                                                     "room_003" : MapRoomCoordinate(coordX: 110.0,coordY: -110.0),
                                                     "room_004" : MapRoomCoordinate(coordX: 110.0,coordY: -220.0),
                                                     "room_005" : MapRoomCoordinate(coordX: 220.0,coordY: -220.0)]
}
