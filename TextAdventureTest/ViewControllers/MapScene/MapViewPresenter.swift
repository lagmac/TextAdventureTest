//
//  MapViewPresenter.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 07/03/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import Foundation
import UIKit

class MapViewPresenter: MapViewPresenterLogic
{
    weak var scene: MapViewDisplayLogic?
    
    init()
    {
        
    }
    
    func presentNewScene(_ newScene: UIViewController)
    {
        guard let parentScene = scene as? MapViewController else {
            
            scene?.manageFatalError()
            return
        }
        
        parentScene.present(newScene, animated: true) {
            
            // TODO SOMETHINGS LATER
        }
    }
}
