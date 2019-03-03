//
//  HomeViewPresenterLogic.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 12/12/2018.
//  Copyright © 2018 Gino Preti. All rights reserved.
//

import Foundation
import UIKit

protocol HomeViewPresenterLogic: class
{
    func presentNewScene(_ newScene: UIViewController)
    func showLoadingOptionsSelector()
    func showSettingsOptionsSelector()
    func showFatalErrorAlert()
}
