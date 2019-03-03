//
//  CharacterCreationDisplayLogic.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 13/12/2018.
//  Copyright © 2018 Gino Preti. All rights reserved.
//

import Foundation
import UIKit

protocol CharacterCreationDisplayLogic: class
{
    func responseNavigateToHomeScene(_ scene: UIViewController)
    func responseCanCreateCharacter()
    func manageFatalError()
    func responsePresentFatalErrorAlert(_ alertError: UIAlertController)
}
