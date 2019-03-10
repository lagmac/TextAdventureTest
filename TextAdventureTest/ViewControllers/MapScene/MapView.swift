//
//  MapView.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 09/03/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import UIKit

class MapView: UIView
{
    let roomSize: CGSize = CGSize(width: 44.0, height: 44.0)
    
    override func draw(_ rect: CGRect)
    {
        let color:UIColor = UIColor.yellow
        
        let originX = (self.frame.width / 2) - roomSize.width / 2
        let originY = (self.frame.height / 2) - roomSize.height / 2
        
        let drect = CGRect(x: originX, y: originY, width: roomSize.width, height: roomSize.height)
        let bpath:UIBezierPath = UIBezierPath(rect: drect)
        
        color.set()
        bpath.stroke()
    }
}
