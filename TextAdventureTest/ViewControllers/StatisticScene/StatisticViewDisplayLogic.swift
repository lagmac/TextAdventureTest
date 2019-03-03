//
//  StatisticViewDisplayLogic.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 30/01/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import Foundation
import UIKit

protocol StatisticViewDisplayLogic: class
{
    func responseNavigateToNewScene(_ scene: UIViewController)
    func responseParsePlayerStatistics(_ pc: [String : String])
    func manageFatalError()
}
