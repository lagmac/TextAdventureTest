//
//  CharacterCreationPresenterLogic.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 13/12/2018.
//  Copyright © 2018 Gino Preti. All rights reserved.
//

import Foundation
import UIKit

protocol CharacterCreationPresenterLogic
{
    func presentNewScene(_ newScene: UIViewController)
    func showFatalErrorAlert()
}
