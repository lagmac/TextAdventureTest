//
//  TAA.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 23/02/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import Foundation
import GameplayKit

public class TAA
{
    class func CalculateLeve(fromExpValue expValue: Int) -> Int
    {
        let c1 = PlayerData.EXP_POINTS_TO_NEXT_LEVEL / 2
        let c2 = c1 * c1
        let c3 = PlayerData.EXP_POINTS_TO_NEXT_LEVEL * 2
        
        let v1 = sqrt(c2 + c3 * Double(expValue))
        let v2 = floor(PlayerData.EXP_POINTS_TO_NEXT_LEVEL / 2 + v1)
        
        let v3 = Int(v2 / PlayerData.EXP_POINTS_TO_NEXT_LEVEL)
        
        return v3
    }
    
    class func CalculateTirednessIncrement(_ healthValue: Float, steps: Int, itemsCount: Int) -> Float
    {
        guard healthValue > PlayerData.MIN_HEALTH else {
            
            return PlayerData.MAX_TIREDNESS
        }
        
        let modifier: Float = Float(steps + itemsCount) / healthValue
        
        let normalizedModifier: Float = (PlayerData.MAX_TIREDNESS * modifier) / 100
        
        return min(normalizedModifier, PlayerData.MAX_TIREDNESS)
    }
    
    class func CalculateTirednessDecrement(_ hpValue: Int, healthValue: Float, strenghtValue: Float) -> Float
    {
        let i1: Float = Float(hpValue) / 100.0
        let i2 = i1 * healthValue
        let i3 = i2 + (strenghtValue / 10.0)
        let i4 = i3 / 10.0
        
        return max(i4, 0.05).toNegative()
    }
    
    class func CalculateStrenghtIncrement(_ hpValue: Int, expValue: Int, lvl: Int) -> Float
    {
        var newValue: Float = GlobalConstants.FLOAT_ZERO
        
        if hpValue > GlobalConstants.INT_ZERO && expValue > GlobalConstants.INT_ZERO
        {
            let op1 = Float(expValue / lvl)
            
            let op2 = Float(hpValue).truncatingRemainder(dividingBy: op1) / 100
            
            newValue = op2 == GlobalConstants.FLOAT_ZERO ? 0.01 : op2
        }
        
        return newValue
    }
    
    class func CalculateStrenghtDecrement(_ healthValue: Float, tirednessValue: Float, strenghtValue: Float, hitStrenght: Int) -> Float
    {
        var newStrenght: Float = GlobalConstants.FLOAT_ZERO
        var m1: Float = 0.0
        var m2: Float = 0.0
        
        let rg1 = (0.1..<0.2)
        let rg2 = (0.2..<0.4)
        let rg3 = (0.4..<0.6)
        let rg4 = (0.6..<0.8)
        let rg5 = (0.8...1.0)
        
        // ****** HEALTH VALUE MODIFICATOR ******
        
        if rg1.contains(Double(healthValue))
        {
            m1 = (PlayerData.MAX_HEALTH - healthValue) / 2
        }
        
        if rg2.contains(Double(healthValue))
        {
            m1 = (PlayerData.MAX_HEALTH - healthValue) / 3
        }
        
        if rg3.contains(Double(healthValue))
        {
            m1 = (PlayerData.MAX_HEALTH - healthValue) / 4
        }
        
        if rg4.contains(Double(healthValue))
        {
            m1 = (PlayerData.MAX_HEALTH - healthValue) / 5
        }
        
        if rg5.contains(Double(healthValue))
        {
            m1 = (PlayerData.MAX_HEALTH - healthValue) / 6
        }
        
        // ****** TIREDNESS VALUE MODIFICATOR ******
        
        if rg1.contains(Double(tirednessValue))
        {
            m2 = (PlayerData.MAX_TIREDNESS - tirednessValue) / 6
        }
        
        if rg2.contains(Double(tirednessValue))
        {
            m2 = (PlayerData.MAX_TIREDNESS - tirednessValue) / 5
        }
        
        if rg3.contains(Double(tirednessValue))
        {
            m2 = (PlayerData.MAX_TIREDNESS - tirednessValue) / 4
        }
        
        if rg4.contains(Double(tirednessValue))
        {
            m2 = (PlayerData.MAX_TIREDNESS - tirednessValue) / 3
        }
        
        if rg5.contains(Double(tirednessValue))
        {
            m2 = (PlayerData.MAX_TIREDNESS - tirednessValue) / 2
        }
        
        // ***** NEW STRENGHT DECREMENT VALUE CALCULATION *****
        
        let m3 = 1.0 + m1 + m2
        let v3 = (Float(hitStrenght) * m3) / 10

        if v3 > strenghtValue
        {
            newStrenght = strenghtValue - v3
        }
        
        return newStrenght
    }
    
    class func CalculateHitChance(fromPlayerTiredness playerTiredness: Float) -> Bool
    {
        let hit = PlayerData.MAX_TIREDNESS - playerTiredness
        let eva = playerTiredness
        
        let hitChance = round(hit * (PlayerData.MAX_TIREDNESS - eva) * 100)
        
        return RollDice(hitChance)
    }
    
    class func CaluclateEvadeChance(fromPlayerHealth playerHealth: Float) -> Bool
    {
        let hit = playerHealth
        let eva = PlayerData.MAX_HEALTH - playerHealth

        let evadeChance = round(hit * (PlayerData.MAX_HEALTH - eva) * 100)

        return  RollDice(evadeChance)
    }
    
    private class func RollDice(_ value:Float) -> Bool
    {
        var rolls: Int = 0
        
        let gkr = GKRandomDistribution.d20()
        
        for _ in 0..<Int(value)
        {
            let roll = gkr.nextInt()
            
            if roll == GlobalConstants.D6_DICE_MAX
            {
                rolls.increment(byValue: 1)
            }
        }
        
        return rolls > 0
    }
}
