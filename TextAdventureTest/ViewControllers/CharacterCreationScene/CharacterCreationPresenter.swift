//
//  CharacterCreationPresenter.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 13/12/2018.
//  Copyright © 2018 Gino Preti. All rights reserved.
//

import Foundation
import UIKit

class CharacterCreationPresenter: CharacterCreationPresenterLogic
{
    weak var scene: CharacterCreationDisplayLogic?
    
    init()
    {
        
    }
    
    func presentNewScene(_ newScene: UIViewController)
    {
        guard let parentScene = scene as? CharacterCreationViewController else {
            
            scene?.manageFatalError()
            return
        }
        
        parentScene.present(newScene, animated: true) {
            
            // TODO SOMETHINGS LATER
        }
    }
    
    func showFatalErrorAlert()
    {
        let alertError = UIAlertController(title: AlertErrorMessage.title.localized, message: AlertErrorMessage.genericMessage.localized, preferredStyle: .alert)
        
        setActionControllerLayout(alertError)
        
        scene?.responsePresentFatalErrorAlert(alertError)
    }
    
    private func setActionControllerLayout(_ alertError: UIAlertController)
    {
        let backView = alertError.view.subviews.last?.subviews.last
        backView?.layer.cornerRadius = ActionSheetLayout.cornerRadius
        backView?.backgroundColor = ActionSheetLayout.backgroundColor
        
        let attributedTitle = NSMutableAttributedString(string: alertError.title!, attributes: ActionSheetLayout.titleAttributes)
        
        alertError.setValue(attributedTitle, forKey: AlertAttibutesKeys.ATTRIBUTED_TITLE)
        
        let attributedMessage = NSMutableAttributedString(string: alertError.message!, attributes: ActionSheetLayout.messageAttributes)
        
        alertError.setValue(attributedMessage, forKey: AlertAttibutesKeys.ATTRIBUTED_MESSAGE)
    }
}
