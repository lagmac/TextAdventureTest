//
//  CharacterCreationRouter.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 13/12/2018.
//  Copyright © 2018 Gino Preti. All rights reserved.
//

import Foundation
import UIKit

class CharacterCreationRouter
{
    weak var scene: CharacterCreationDisplayLogic?
    
    private var storyboard: UIStoryboard?
    
    init()
    {
        storyboard = UIStoryboard(name: StoryBoardIdentifier.Main.rawValue, bundle: nil)
    }
    
    func navigateToHomeScene(_ pc: PlayerCharacteristics?)
    {
        guard let sb = storyboard else {
            
            scene?.manageFatalError()
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
            scene?.manageFatalError()
        }
    }
}
