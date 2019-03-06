//
//  MainSceneDisplayLogic.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 22/11/2018.
//  Copyright © 2018 Gino Preti. All rights reserved.
//

import Foundation
import UIKit

protocol MainSceneDisplayLogic: class
{
    func responseBackToHome(withSaving save: Bool)
    func responseToRequestSavingGame(andBackToHome backToHome: Bool)
    func responseNavigateToHomeScene(_ scene: UIViewController)
    func responsePresentFatalErrorAlert(_ alertError: UIAlertController)
    func responseBuindingRoomRequest(withRoomName roomName: String, roomDescription: NSMutableAttributedString)
    func manageBuilginsRoomRequestError(_ err: RoomBuilderErrors)
    func responseRoomObjectRequest(_ roomObject: RoomObject)
    func manageRoomObjectRequestError(_ err: PlayerActionsErros)
    func responseActionResponseRequest(_ response: String)
    func manageActionResponseError(_ err: PlayerActionsErros)
    func manageFatalError(_ message: String?)
    func responsePresentingActionSelector(_ actionSelector: UIAlertController)
    func responseToAddItemToPlayerInventory(_ response: String, itemsCount: Int)
    func responseToInventoryIsFull(_ response: PlayerActionsErros)
    func responseToRequestObjectFromInventory(_ item: RoomObject?)
    func responseToStartAttack(withOutcome message: String)
    func responseToOnAttack(withOutcome message: String)
    func responseToEndAttackWithVictory(withOutcome message: String, points: Int)
    func responseToEndAttackWithDefeat(withOutcome message: String, points: Int)
    func responseToRemoveItemFromPlayerInventory(_ response: String, inventoryState: Bool, itemsCount: Int)
    func responseToRoomDescriptionChanged(withNewDescription description: NSMutableAttributedString)
    func responsePlayerCreatedOrUpdated(withValuesOf exp: Int,
                                        hp: Int,
                                        lvl: Int,
                                        gold: Int,
                                        health: Float,
                                        strenght: Float,
                                        tiredness: Float,
                                        inventoryActive: Bool,
                                        itemsCount: Int)
}
