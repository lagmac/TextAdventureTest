//
//  AudioManagerProtocolo.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 27/01/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import Foundation
import UIKit

protocol AudioManagerProtocol
{
    func audioManager() throws -> AudioManager
}

class AudioManagerDelegate: AudioManagerProtocol
{
    func audioManager() throws -> AudioManager
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        if let am = appDelegate.audioManager
        {
            return am
        }
        
        throw ApplicationInternalErrors.audioManagerUnavailable
    }
    
    func loadMainTheme()
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        if let am = appDelegate.audioManager
        {
            am.loadMainTheme()
        }
    }
    
    func loadInGameTheme()
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        if let am = appDelegate.audioManager
        {
            am.loadInGameTheme()
        }
    }
}
