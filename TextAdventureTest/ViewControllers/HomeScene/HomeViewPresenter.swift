//
//  HomeViewPresenter.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 12/12/2018.
//  Copyright © 2018 Gino Preti. All rights reserved.
//

import Foundation
import UIKit

class HomeViewPresenter: HomeViewPresenterLogic
{
    weak var scene: HomeViewDisplayLogic?
    weak var interactor: HomeSceneBusinessLogic?
    
    init()
    {
        
    }
    
    func presentNewScene(_ newScene: UIViewController)
    {
        guard let parentScene = scene as? HomeViewController else {
            
            scene?.manageFatalError()
            return
        }
        
        parentScene.present(newScene, animated: true) {
            
            // TODO SOMETHINGS LATER
        }
    }
    
    func showLoadingOptionsSelector()
    {
        let actionSheet = UIAlertController(title: LoadingOptionsSelectorLabel.title.localized,
                                            message: ActionsSelectorLabel.title.localized, preferredStyle: .actionSheet)
        
        setActionControllerLayout(actionSheet)
        
        let newGameAction = UIAlertAction(title: LoadingOptionsSelectorLabel.startNewGame.localized, style: .default) { (action) in
            
            self.interactor?.stopMusic()
            self.interactor?.preloadInGameTheme()
            self.interactor?.requestDeleteSavedGame()
            self.interactor?.resetElapsedGameTime()
        }
        
        newGameAction.setValue(FontStyles.actionSheetMessageFontColor, forKey: AlertAttibutesKeys.TITLE_TEXT_COLOR)
        
        let loadGameAction = UIAlertAction(title: LoadingOptionsSelectorLabel.loadSavedGame.localized, style: .default) { (action) in
            
            self.interactor?.stopMusic()
            self.interactor?.preloadInGameTheme()
            self.interactor?.requestLoadSavedGame()
        }
        
        loadGameAction.setValue(FontStyles.actionSheetMessageFontColor, forKey: AlertAttibutesKeys.TITLE_TEXT_COLOR)
        
        let closeAction = UIAlertAction(title: LoadingOptionsSelectorLabel.discard.localized, style: .default) { (action) in
            
        }
        
        closeAction.setValue(FontStyles.actionSheetMessageFontColor, forKey: AlertAttibutesKeys.TITLE_TEXT_COLOR)
        
        actionSheet.addAction(loadGameAction)
        actionSheet.addAction(newGameAction)
        actionSheet.addAction(closeAction)
        
        scene?.responsePresentOptionsSelector(actionSheet)
    }
    
    func showSettingsOptionsSelector()
    {
        let actionSheet = UIAlertController(title: SettingsOptionsSelectorLabel.title.localized,
                                            message: ActionsSelectorLabel.title.localized, preferredStyle: .actionSheet)
        
        setActionControllerLayout(actionSheet)
        
        let statisticAction = UIAlertAction(title: SettingsOptionsSelectorLabel.statistic.localized, style: .default) { (action) in
            
            self.scene?.responseToPresentStatisticScene()
        }
        
        statisticAction.setValue(FontStyles.actionSheetMessageFontColor, forKey: AlertAttibutesKeys.TITLE_TEXT_COLOR)
        
        let audioTitle = PreferencesManager.getAudioEnabled()! ? SettingsOptionsSelectorLabel.audioOff.localized : SettingsOptionsSelectorLabel.audioOn.localized
        
        let audioOnOffAction = UIAlertAction(title: audioTitle, style: .default) { (action) in
            
            self.interactor?.requestSetAudioOnOff()
        }
        
        audioOnOffAction.setValue(FontStyles.actionSheetMessageFontColor, forKey: AlertAttibutesKeys.TITLE_TEXT_COLOR)
        
        let closeAction = UIAlertAction(title: SettingsOptionsSelectorLabel.discard.localized, style: .default) { (action) in
            
        }
        
        closeAction.setValue(FontStyles.actionSheetMessageFontColor, forKey: AlertAttibutesKeys.TITLE_TEXT_COLOR)
        
        actionSheet.addAction(statisticAction)
        actionSheet.addAction(audioOnOffAction)
        actionSheet.addAction(closeAction)
        
        scene?.responsePresentOptionsSelector(actionSheet)
    }
    
    func showFatalErrorAlert()
    {
        let alertError = UIAlertController(title: AlertErrorMessage.title.localized, message: AlertErrorMessage.genericMessage.localized, preferredStyle: .alert)
        
        setActionControllerLayout(alertError)
        
        scene?.responsePresentFatalErrorAlert(alertError)
    }
    
    private func setActionControllerLayout(_ actionSheet: UIAlertController)
    {
        let backView = actionSheet.view.subviews.last?.subviews.last
        backView?.layer.cornerRadius = ActionSheetLayout.cornerRadius
        backView?.backgroundColor = ActionSheetLayout.backgroundColor
        
        let attributedTitle = NSMutableAttributedString(string: actionSheet.title!, attributes: ActionSheetLayout.titleAttributes)
        
        actionSheet.setValue(attributedTitle, forKey: AlertAttibutesKeys.ATTRIBUTED_TITLE)
        
        let attributedMessage = NSMutableAttributedString(string: actionSheet.message!, attributes: ActionSheetLayout.messageAttributes)
        
        actionSheet.setValue(attributedMessage, forKey: AlertAttibutesKeys.ATTRIBUTED_MESSAGE)
    }
}
