//
//  HomeViewRouter.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 12/12/2018.
//  Copyright © 2018 Gino Preti. All rights reserved.
//

import Foundation
import UIKit

class HomeViewRouter
{
    weak var scene: HomeViewDisplayLogic?
    
    private var storyboard: UIStoryboard?
    
    init()
    {
        storyboard = UIStoryboard(name: StoryBoardIdentifier.Main.rawValue, bundle: nil)
    }
    
    func navigateToMainScene(withData data: [String : Any?]?)
    {
        if let vc = getMainSceneViewController()
        {
            vc.loadedData = data
            scene?.responseNavigateToNewScene(vc)
        }
        else
        {
            scene?.manageFatalError()
        }
    }
    
    func navigateToCreatePlayerScene(withData data: PlayerCharacteristics?)
    {
        if let vc = getCreatePlayerViewController()
        {
            vc.playerCharacter = data
            scene?.responseNavigateToNewScene(vc)
        }
        else
        {
            scene?.manageFatalError()
        }
    }
    
    func navigateToStatisticScene(withData data: PlayerStatistics?)
    {
        if let vc = getStatisticViewController()
        {
            vc.playerStatistics = data
            scene?.responseNavigateToNewScene(vc)
        }
        else
        {
            scene?.manageFatalError()
        }
    }
    
    private func getMainSceneViewController() -> MainSceneViewController?
    {
        guard let sb = storyboard else {
            
            return nil
        }
        
        return sb.instantiateViewController(withIdentifier: SceneIdentifier.MainScene.rawValue) as? MainSceneViewController
    }
    
    private func getCreatePlayerViewController() -> CharacterCreationViewController?
    {
        guard let sb = storyboard else {
            
            return nil
        }
        
        return sb.instantiateViewController(withIdentifier: SceneIdentifier.CreatePlayerScene.rawValue) as? CharacterCreationViewController
    }
    
    private func getStatisticViewController() -> StatisticsViewController?
    {
        guard let sb = storyboard else {
            
            return nil
        }
        
        return sb.instantiateViewController(withIdentifier: SceneIdentifier.StatisticScene.rawValue) as? StatisticsViewController
    }
}
