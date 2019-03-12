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
    var startOriginX: CGFloat!
    var startOriginY: CGFloat!
    
    var roomNameList: [String]?
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        startOriginX = (self.frame.width / 2) - RoomData.RoomMapSize.width / 2
        startOriginY = (self.frame.height / 2) - RoomData.RoomMapSize.height / 2
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
                if let roomCoord = RoomData.MapRoomsCoordinateList[roomName]
                {
                    let oX = startOriginX + roomCoord.coordX!
                    let oY = startOriginY + roomCoord.coordY!
                    
                    let rectangle = CGRect(x: oX, y: oY, width: RoomData.RoomMapSize.width, height: RoomData.RoomMapSize.height)
                    
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

