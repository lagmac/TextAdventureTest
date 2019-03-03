//
//  RoomBuilderErrors.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 21/11/2018.
//  Copyright © 2018 Gino Preti. All rights reserved.
//

import Foundation

enum RoomBuilderErrors: Error
{
    case noDataToParse
    case unableToPrepareData
    case parsingError
    
    var localizedDescription: String {
        
        switch self
        {
        case .noDataToParse:
            return ParseError.noDataToParse.localized
        case .unableToPrepareData:
            return ParseError.unableToPrepareData.localized
        case .parsingError:
            return ParseError.parsingError.localized
        }
        
    }
}
