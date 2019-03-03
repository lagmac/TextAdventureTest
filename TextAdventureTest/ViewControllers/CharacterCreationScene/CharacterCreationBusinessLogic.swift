//
//  CharacterCreationBusinessLogic.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 14/12/2018.
//  Copyright © 2018 Gino Preti. All rights reserved.
//

import Foundation


protocol CharacterCreationBusinessLogic: class
{
    var pc: PlayerCharacteristics? {get set}
    
    func checkCharacterInputValidity(_ name: String?, age: String?, race: String?)
    func createPlayerCharateristics(withName name: String?, age: String?, race: String?, gender: PlayerGender?)
}
