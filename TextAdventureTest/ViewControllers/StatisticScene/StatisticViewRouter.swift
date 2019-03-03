//
//  StatisticViewRouter.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 30/01/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import Foundation
import UIKit

class StatisticViewRouter
{
    weak var scene: StatisticViewDisplayLogic?
    
    private var storyboard: UIStoryboard?
    
    init()
    {
        storyboard = UIStoryboard(name: StoryBoardIdentifier.Main.rawValue, bundle: nil)
    }
    
    func navigateToHomeScene(withData data: [String : Any?]?)
    {
        if let vc = getHomeSceneViewController()
        {
            scene?.responseNavigateToNewScene(vc)
        }
        else
        {
            scene?.manageFatalError()
        }
    }
    
    private func getHomeSceneViewController() -> HomeViewController?
    {
        guard let sb = storyboard else {
            
            return nil
        }
        
        return sb.instantiateViewController(withIdentifier: SceneIdentifier.HomeScene.rawValue) as? HomeViewController
    }
}
