//
//  XiibLocalizable.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 27/01/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import Foundation
import UIKit

protocol Localizable
{
    var appVersionAndBuild: String { get }
}
extension String: Localizable
{
    var appVersionAndBuild: String
    {
        let versionNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") ?? "1.0"
        
        let buildNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") ?? "1.0"
        
        let versionAndBuildNumber = "Ver. \(versionNumber) (\(buildNumber))"
        
        return versionAndBuildNumber
    }
}

protocol XIBLocalizable
{
    var xibLocKey: String? { get set }
}

extension UILabel: XIBLocalizable
{
    @IBInspectable var xibLocKey: String?
        {
        get { return nil }
        
        set(key)
        {
            text = key?.appVersionAndBuild
        }
    }
}
