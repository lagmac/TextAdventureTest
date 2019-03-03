//
//  MainSceneRouter.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 25/01/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import Foundation
import UIKit

class MainSceneRouter
{
    weak var scene: MainSceneDisplayLogic?
    
    private var storyboard: UIStoryboard?
    
    init()
    {
        storyboard = UIStoryboard(name: StoryBoardIdentifier.Main.rawValue, bundle: nil)
    }
    
    func navigateToHomeScene(_ pc: PlayerCharacteristics?)
    {
        guard let sb = storyboard else {
            
            scene?.manageFatalError(nil)
            return
        }
        
        if let vc = sb.instantiateViewController(withIdentifier: SceneIdentifier.HomeScene.rawValue) as? HomeViewController
        {
            if let _pc = pc
            {
                vc.playerCharacteristics = _pc
            }
            
            scene?.responseNavigateToHomeScene(vc)
        }
        else
        {
            scene?.manageFatalError(nil)
        }
    }
}
