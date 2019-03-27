//
//  Utilities.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 23/11/2018.
//  Copyright © 2018 Gino Preti. All rights reserved.
//

import Foundation
import UIKit

public class Utilities
{
    class func HudFormattedString(withText text: String, argument: Int) -> String
    {
        return "\(text) \(argument)"
    }
    
    class func GameTimeFormattedString(fromTimeInterval gameTime: TimeInterval) -> String
    {
        guard gameTime >= GlobalConstants.DOUBLE_ZERO else {
            
            return LabelText.defaultStatisticTime.localized
        }
        
        let roundedGameTime = gameTime.rounded(.toNearestOrAwayFromZero)
        let hours = Int((roundedGameTime / GlobalConstants.SEC_PER_HOUR).rounded(.toNearestOrAwayFromZero))
        let minutes = Int(((roundedGameTime - Double(hours * Int(GlobalConstants.SEC_PER_HOUR))) / GlobalConstants.SEC_PER_MINUTES).rounded(.toNearestOrAwayFromZero))
        let gameTimeAsString: String = "\(hours)h \(minutes)min"
        
        return gameTimeAsString
    }
}

extension Int
{
    func toNegative() -> Int
    {
        return self * -1
    }
    
    mutating func increment(byValue value: Int)
    {
        self += value
    }
    
    mutating func decrement(byValue value: Int)
    {
        self -= value
    }
    
    var zero: Int {
        get {
            return GlobalConstants.INT_ZERO
        }
    }
}

extension Float
{
    func toNegative() -> Float
    {
        return self * -1.0
    }
    
    mutating func increment(byValue value: Float)
    {
        self += value
    }
    
    mutating func decrement(byValue value: Float)
    {
        self -= value
    }
}

extension CGFloat
{
    func toNegative() -> CGFloat
    {
        return self * -1.0
    }
}

