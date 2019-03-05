//
//  MainScenePresenter.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 22/11/2018.
//  Copyright © 2018 Gino Preti. All rights reserved.
//

import Foundation
import UIKit

class MainScenePresenter: MainScenePresentLogic
{
    weak var scene: MainSceneDisplayLogic?
    weak var interactor: MainSceneBusinessLogic?
    
    init()
    {
        
    }
    
    func presentNewScene(_ newScene: UIViewController)
    {
        guard let parentScene = scene as? MainSceneViewController else {
            
            scene?.manageFatalError(nil)
            return
        }
        
        parentScene.present(newScene, animated: true) {
            
            // TODO SOMETHINGS LATER
        }
    }
    
    func requestLabelForInventoryItemPicker(forRow row: Int) -> UILabel
    {
        let label = UILabel()
        label.layer.cornerRadius = GameDataUILayout.cornerRadius
        label.clipsToBounds = true
        
        if let items = interactor?.requestItemsInInventory()
        {
            label.font = FontStyles.inventoryPickerfont
            label.textColor = FontStyles.inventoryPickerFontColor
            label.textAlignment = .left
            label.backgroundColor = UIColor.darkGray
            label.text = items[row].name!
        }
        
        return label
    }
    
    func showBackToHomeAlert()
    {
        let alert = UIAlertController(title: LabelTitle.gameTitle.localized, message: Message.quitGame.localized, preferredStyle: .alert)
        
        setActionControllerLayout(alert)
        
        let quitesOnlyAction = UIAlertAction(title: ActionsSelectorLabel.quites.localized, style: .default) { (action) in
            
            self.interactor?.requestStopTirednessCalculator()
            self.scene?.responseBackToHome(withSaving: false)
        }
        
        let quitesAndSaveAction = UIAlertAction(title: ActionsSelectorLabel.quitesAndSave.localized, style: .default) { (action) in
            
            self.interactor?.requestStopTirednessCalculator()
            self.scene?.responseBackToHome(withSaving: true)
        }
        
        let discardAction = UIAlertAction(title: ActionsSelectorLabel.discardAction.localized, style: .default) { (action) in
            
        }
        
        quitesOnlyAction.setValue(FontStyles.actionSheetMessageFontColor, forKey: AlertAttibutesKeys.TITLE_TEXT_COLOR)
        quitesAndSaveAction.setValue(FontStyles.actionSheetMessageFontColor, forKey: AlertAttibutesKeys.TITLE_TEXT_COLOR)
        discardAction.setValue(FontStyles.actionSheetMessageFontColor, forKey: AlertAttibutesKeys.TITLE_TEXT_COLOR)
        
        alert.addAction(quitesOnlyAction)
        alert.addAction(quitesAndSaveAction)
        alert.addAction(discardAction)
        
        scene?.responsePresentingActionSelector(alert)
    }
    
    func showActionsSelector(forObject roomObject: RoomObject)
    {
        let actionSheet = UIAlertController(title: roomObject.name!.uppercased(), message: ActionsSelectorLabel.title.localized, preferredStyle: .actionSheet)
        
        setActionControllerLayout(actionSheet)

        for objectAction in roomObject.actions!
        {            
            let action = UIAlertAction(title: objectAction.name!, style: .default) { (action) in
                
                self.interactor?.requestResponse(forAction: objectAction)
            }
            
            action.setValue(FontStyles.actionSheetMessageFontColor, forKey: AlertAttibutesKeys.TITLE_TEXT_COLOR)
            
            action.isEnabled = objectAction.used! ? false : true
            
            actionSheet.addAction(action)
        }
        
        let closeAction = UIAlertAction(title: ActionsSelectorLabel.discardAction.localized, style: .default) { (action) in
            
            actionSheet.dismiss(animated: true, completion: {
                self.interactor?.resetSelectedObject()
            })
        }
        
        closeAction.setValue(FontStyles.actionSheetMessageFontColor, forKey: AlertAttibutesKeys.TITLE_TEXT_COLOR)

        actionSheet.addAction(closeAction)
        
        scene?.responsePresentingActionSelector(actionSheet)
    }
    
    func showFatalErrorAlert(withMessage message: String?)
    {
        var _msg: String = AlertErrorMessage.genericMessage.localized
        
        if let msg = message
        {
            _msg = msg
        }
        
        let alertError = UIAlertController(title: AlertErrorMessage.title.localized, message: _msg, preferredStyle: .alert)
        
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
