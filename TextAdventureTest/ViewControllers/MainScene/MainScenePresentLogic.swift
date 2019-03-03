//
//  MainScenePresentLogic.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 22/11/2018.
//  Copyright © 2018 Gino Preti. All rights reserved.
//

import Foundation
import UIKit

protocol MainScenePresentLogic
{
    func showActionsSelector(forObject roomObject: RoomObject)
    func showBackToHomeAlert()
    func requestLabelForInventoryItemPicker(forRow row: Int) -> UILabel
    func presentNewScene(_ newScene: UIViewController)
    func showFatalErrorAlert(withMessage message: String?)
}
