//
//  StatisticPresenter.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 30/01/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import Foundation
import UIKit

class StatisticPresenter: StatisticPresenterLogic
{
    weak var scene: StatisticViewDisplayLogic?
    
    init()
    {
        
    }
    
    func presentNewScene(_ newScene: UIViewController)
    {
        guard let parentScene = scene as? StatisticsViewController else {
            
            scene?.manageFatalError()
            return
        }
        
        parentScene.present(newScene, animated: true) {
            
            // TODO SOMETHINGS LATER
        }
    }
}
