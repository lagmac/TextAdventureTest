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
                    self.addRoomName(withId: roomName, withOriginX: oX, andOriginY: oY)
                    
                    if roomCoord.toNorth != nil && roomCoord.toNorth! == true
                    {
                        self.addConnection(toContext: ctx, withOriginX: oX, andOriginY: oY, connection: RoomData.DIRECTION_ID_$N)
                    }
                    
                    if roomCoord.toEast != nil && roomCoord.toEast! == true
                    {
                        self.addConnection(toContext: ctx, withOriginX: oX, andOriginY: oY, connection: RoomData.DIRECTION_ID_$E)
                    }
                    
                    if roomCoord.toSouth != nil && roomCoord.toSouth! == true
                    {
                        self.addConnection(toContext: ctx, withOriginX: oX, andOriginY: oY, connection: RoomData.DIRECTION_ID_$S)
                    }
                    
                    if roomCoord.toWest != nil && roomCoord.toWest! == true
                    {
                        self.addConnection(toContext: ctx, withOriginX: oX, andOriginY: oY, connection: RoomData.DIRECTION_ID_$W)
                    }
                }
            }
        }
        
        self.image = img
        
        self.setNeedsDisplay()
    }
    
    private func addRoom(ToContext ctx: UIGraphicsRendererContext, withOriginX oX: CGFloat, andOriginY oY: CGFloat)
    {
        let room = CGRect(x: oX, y: oY, width: RoomData.RoomMapSize.width, height: RoomData.RoomMapSize.height)
        
        ctx.cgContext.setFillColor(UIColor.darkGray.cgColor)
        ctx.cgContext.setStrokeColor(UIColor.white.cgColor)
        ctx.cgContext.setLineWidth(2)
        
        ctx.cgContext.addRect(room)
        ctx.cgContext.drawPath(using: .fillStroke)
    }
    
    private func addConnection(toContext ctx: UIGraphicsRendererContext,
                               withOriginX oX: CGFloat,
                               andOriginY oY: CGFloat,
                               connection: String)
    {
        var connect: CGRect?
        
        switch connection
        {
        case RoomData.DIRECTION_ID_$N:
            connect = CGRect(x: oX + (RoomData.mapRoomWidth / 2), y: oY - RoomData.spaceBetweenRoom, width: 2.0, height: RoomData.spaceBetweenRoom)
        case RoomData.DIRECTION_ID_$E:
            connect = CGRect(x: oX + RoomData.mapRoomWidth, y: oY + (RoomData.mapRoomWidth / 2), width: RoomData.spaceBetweenRoom, height: 2.0)
        case RoomData.DIRECTION_ID_$S:
            connect = CGRect(x: oX + (RoomData.mapRoomWidth / 2), y: oY + RoomData.mapRoomHeight, width: 2.0, height: RoomData.spaceBetweenRoom)
        case RoomData.DIRECTION_ID_$W:
            connect = CGRect(x: oX - RoomData.spaceBetweenRoom, y: oY + (RoomData.mapRoomWidth / 2), width: RoomData.spaceBetweenRoom, height: 2.0)
        default:
            break
        }
        
        guard connect != nil else {
            return
        }
        
        ctx.cgContext.setFillColor(UIColor.gray.cgColor)
        
        ctx.cgContext.addRect(connect!)
        ctx.cgContext.drawPath(using: .fill)
    }
    
    private func addRoomName(withId roomId: String, withOriginX oX: CGFloat, andOriginY oY: CGFloat)
    {
        var string: String?
        
        let language = PreferencesManager.getLanguage()
        
        if let rd = RoomData.getRoomData(byGivenName: "\(roomId)_\(language!)")
        {
            let name = rd[RoomData.KEY_NAME] as! String
            
            string = name
        }
        else
        {
            string = "NO NAME !!!"
        }
      
        string!.draw(with: CGRect(x: oX, y: oY + MapRoomLayout.roomNameOffset, width: RoomData.mapRoomWidth, height: RoomData.mapRoomHeight - MapRoomLayout.roomNameOffset),
                     options: .usesLineFragmentOrigin,
                     attributes: MapRoomLayout.attributes,
                     context: nil)
    }
}

