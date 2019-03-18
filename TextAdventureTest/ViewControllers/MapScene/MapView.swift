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
    
    func draw()
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
                    
                    self.addRoom(ToContext: ctx, withOriginX: oX, andOriginY: oY)
                    self.addConnection(toContext: ctx, withOriginX: oX, andOriginY: oY)
                }
            }
        }
        
        self.image = img
        
        self.setNeedsDisplay()
    }
    
    private func addRoom(ToContext ctx: UIGraphicsRendererContext, withOriginX oX: CGFloat, andOriginY oY: CGFloat)
    {
        let room = CGRect(x: oX, y: oY, width: RoomData.RoomMapSize.width, height: RoomData.RoomMapSize.height)
        
        ctx.cgContext.setFillColor(UIColor.red.cgColor)
        ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
        ctx.cgContext.setLineWidth(2)
        
        ctx.cgContext.addRect(room)
        ctx.cgContext.drawPath(using: .fillStroke)
    }
    
    private func addConnection(toContext ctx: UIGraphicsRendererContext, withOriginX oX: CGFloat, andOriginY oY: CGFloat)
    {
        let connection = CGRect(x: oX + (RoomData.mapRoomWidth / 2), y: oY - RoomData.spaceBetweenRoom, width: 2.0, height: RoomData.spaceBetweenRoom)
        
        ctx.cgContext.setFillColor(UIColor.gray.cgColor)
        
        ctx.cgContext.addRect(connection)
        ctx.cgContext.drawPath(using: .fill)
    }
}

