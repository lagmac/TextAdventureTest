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

    override func draw(_ rect: CGRect)
    {
        let color:UIColor = UIColor.yellow
        
        let drect = CGRect(x: 0.0, y: 0.0, width: 45.0, height: 45.0)
        let bpath:UIBezierPath = UIBezierPath(rect: drect)
        
        color.set()
        bpath.stroke()
    }
 

}
