//
//  MapViewDisplayLogic.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 07/03/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import Foundation
import UIKit

protocol MapViewDisplayLogic: class
{
    func responseNavigateToNewScene(_ scene: UIViewController)
    func manageFatalError()
}
