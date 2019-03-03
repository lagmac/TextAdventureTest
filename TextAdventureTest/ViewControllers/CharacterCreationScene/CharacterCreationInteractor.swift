//
//  CharacterCreationInteractor.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 14/12/2018.
//  Copyright © 2018 Gino Preti. All rights reserved.
//

import Foundation


class CharacterCreationInteractor: CharacterCreationBusinessLogic
{
    weak var scene: CharacterCreationDisplayLogic?
    
    var pc: PlayerCharacteristics?
    
    init()
    {
        
    }
    
    func checkCharacterInputValidity(_ name: String?, age: String?, race: String?)
    {
        guard let _name = name else { return }
        guard let _age = age else { return }
        guard let _race = race else { return }
        
        if _name.isEmpty == false && _age.isEmpty == false && _race.isEmpty == false
        {
            scene?.responseCanCreateCharacter()
        }
    }
    
    func createPlayerCharateristics(withName name: String?, age: String?, race: String?, gender: PlayerGender?)
    {
        guard let _name = name else { return }
        guard let _age = age else { return }
        guard let _race = race else { return }
        guard let _gender = gender else { return }
        
        pc = PlayerCharacteristics(name: _name, age: _age, race: _race, gender: _gender)
        
        PreferencesManager.ArchivePlayerCharacter(pc)
    }
}
