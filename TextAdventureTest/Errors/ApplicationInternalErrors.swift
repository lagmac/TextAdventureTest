//
//  ApplicationInternalErrors.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 26/01/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import Foundation

enum ApplicationInternalErrors: Error
{
    case noAudioFileLoaded
    case audioManagerUnavailable
    
    var localizedDescription: String {
        
        switch self
        {
        case .noAudioFileLoaded:
            return ApplicationError.noAudioFileLoaded.localized
        case .audioManagerUnavailable:
            return ApplicationError.audioManagerUnavailable.localized
        }
        
    }
}
