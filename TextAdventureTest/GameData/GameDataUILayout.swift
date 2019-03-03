//
//  GameDataUILayout.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 29/11/2018.
//  Copyright © 2018 Gino Preti. All rights reserved.
//

import Foundation
import UIKit

struct AlertAttibutesKeys
{
    static let TITLE_TEXT_COLOR: String = "titleTextColor"
    static let ATTRIBUTED_TITLE: String = "attributedTitle"
    static let ATTRIBUTED_MESSAGE: String = "attributedTitle"
}

struct FontStyles
{
    static let generalFont: UIFont = UIFont(name: "American Typewriter", size: 17)!
    static let generalFontBold: UIFont = UIFont(name: "American Typewriter-Bold", size: 17)!
    static let generaleFontColor: UIColor = UIColor.black
    
    static let actionSheetTitleFont: UIFont = UIFont(name: "American Typewriter", size: 22)!
    static let actionSheetTitleFontColor: UIColor = UIColor(red: 220.0/255.0, green: 160.0/255.0, blue: 61.0/255.0, alpha: 1.0)
    
    static let actionSheetMessageFont: UIFont = UIFont(name: "American Typewriter", size: 17)!
    static let actionSheetMessageFontColor: UIColor = UIColor.black
    
    static let inventoryPickerfont: UIFont = UIFont(name: "American Typewriter", size: 22)!
    static let inventoryPickerFontColor: UIColor = UIColor(red: 220.0/255.0, green: 160.0/255.0, blue: 61.0/255.0, alpha: 1.0)
}

struct HUDLabel
{
    static let exp: String = LabelTitle.experience.localized
    static let hp: String = LabelTitle.hp.localized
    static let level: String = LabelTitle.level.localized
    static let gold: String = LabelTitle.gold.localized
    
    static func inventory(withItems itemsCount: Int) -> String
    {
        return LabelTitle.inventory.localized +  " < \(itemsCount) >"
    }
}

struct GameDataUILayout
{
    static let cornerRadius: CGFloat = 8.0
    static let inactiveAlphaValue: CGFloat = 0.7
    static let activeALphaValue: CGFloat = 1.0
    static let characterCreationTextFieldsPadding: CGFloat = 10.0
    
    static let male_avatar_image: UIImage? = UIImage(named: "male_avatar_placeholder")
    static let female_avatar_image: UIImage? = UIImage(named: "female_avatar_placeholder")
    
    static let backgroundMusicTheme: String = "bkg_music_theme.mp3"
    static let inGameMusicTheme: String = "in_game_music_theme.mp3"
}

struct RoomTextLayout
{
    static var globalAttributes: [NSMutableAttributedString.Key : NSObject] {
        
        get {
            
            let paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = CGFloat(2)
            
            let globalAttributes: [NSMutableAttributedString.Key : NSObject] = [NSAttributedString.Key.font: FontStyles.generalFont,
                                                                                NSAttributedString.Key.foregroundColor: FontStyles.generaleFontColor,
                                                                                NSAttributedString.Key.paragraphStyle: paragraphStyle]
            
            return globalAttributes
            
        }
    }
}

struct ActionSheetLayout
{
    static let backgroundColor: UIColor = UIColor.yellow
    static let cornerRadius: CGFloat = 10.0
    
    static var titleAttributes: [NSMutableAttributedString.Key : NSObject] {
        
        get {

            let titleAttributes: [NSMutableAttributedString.Key : NSObject] = [NSAttributedString.Key.font: FontStyles.actionSheetTitleFont,
                                                                                NSAttributedString.Key.foregroundColor: FontStyles.actionSheetTitleFontColor]
            
            return titleAttributes
            
        }
    }
    
    static var messageAttributes: [NSMutableAttributedString.Key : NSObject] {
        
        get {
            
            let messageAttributes: [NSMutableAttributedString.Key : NSObject] = [NSAttributedString.Key.font: FontStyles.actionSheetMessageFont,
                                                                               NSAttributedString.Key.foregroundColor: FontStyles.actionSheetMessageFontColor]
            
            return messageAttributes
            
        }
    }
    
    static var actionTitleAttributes: [NSMutableAttributedString.Key : NSObject] {
        
        get {
            
            let messageAttributes: [NSMutableAttributedString.Key : NSObject] = [NSAttributedString.Key.font: FontStyles.generalFontBold,
                                                                                 NSAttributedString.Key.foregroundColor: FontStyles.actionSheetMessageFontColor]
            
            return messageAttributes
            
        }
    }
}

struct ItemsPickerLayout
{
    static var attributes: [NSMutableAttributedString.Key : NSObject] {
        
        get {
            
            let attributes: [NSMutableAttributedString.Key : NSObject] = [NSAttributedString.Key.font: FontStyles.inventoryPickerfont,
                                                                          NSAttributedString.Key.foregroundColor: FontStyles.inventoryPickerFontColor]
            
            return attributes
        }
    }
}
