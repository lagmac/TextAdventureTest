//
//  HomeViewDisplayLogic.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 12/12/2018.
//  Copyright © 2018 Gino Preti. All rights reserved.
//

import Foundation
import UIKit

protocol HomeViewDisplayLogic: class
{
    func responseNavigateToNewScene(_ scene: UIViewController)
    func responsePresentFatalErrorAlert(_ alertError: UIAlertController)
    func responseToSavedGameNotExist()
    func responseToSavedGameExist()
    func responseToPresentStatisticScene()
    func responseToLoadGame(_ data: [String: Any?])
    func responseCharacterNotExist()
    func responseCharacterExist(_ pc: PlayerCharacteristics)
    func responsePresentOptionsSelector(_ actionSelector: UIAlertController)
    func manageFatalError()
}
