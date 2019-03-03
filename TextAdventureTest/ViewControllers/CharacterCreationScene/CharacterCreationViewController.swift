//
//  CharacterCreationViewController.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 13/12/2018.
//  Copyright © 2018 Gino Preti. All rights reserved.
//

import UIKit

class CharacterCreationViewController: UIViewController, CharacterCreationDisplayLogic, UITextFieldDelegate {

    @IBOutlet weak var discardButton: UIButton!
    @IBOutlet weak var confirmButton: UIButton!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var raceTextField: UITextField!
    @IBOutlet weak var genderSelector: UISegmentedControl!
    
    private var router: CharacterCreationRouter?
    private var interactor: CharacterCreationBusinessLogic?
    private var presenter: CharacterCreationPresenter?
    
    private let isMale: Int = GlobalConstants.INT_ZERO
    private let isFemale: Int = 1
    
    var playerCharacter: PlayerCharacteristics?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.setupUI()
        
        let router = CharacterCreationRouter()
        router.scene = self
        self.router = router
        
        let interactor = CharacterCreationInteractor()
        interactor.scene = self
        self.interactor = interactor
        
        let presenter = CharacterCreationPresenter()
        presenter.scene = self
        self.presenter = presenter
    }
    
    private func setupUI()
    {
        nameTextField.setLeftPaddingPoints(GameDataUILayout.characterCreationTextFieldsPadding)
        ageTextField.setLeftPaddingPoints(GameDataUILayout.characterCreationTextFieldsPadding)
        raceTextField.setLeftPaddingPoints(GameDataUILayout.characterCreationTextFieldsPadding)
        
        nameTextField.delegate = self
        ageTextField.delegate = self
        raceTextField.delegate = self
        
        confirmButton.layer.cornerRadius = GameDataUILayout.cornerRadius
        confirmButton.clipsToBounds = true
        
        setButtonActive(false, button: confirmButton)
        
        discardButton.layer.cornerRadius = GameDataUILayout.cornerRadius
        discardButton.clipsToBounds = true
        
        setButtonActive(true, button: discardButton)
        
        let genderSelectorFontAttribute = [NSAttributedString.Key.font : FontStyles.generalFont]
        genderSelector.setTitleTextAttributes(genderSelectorFontAttribute, for: .normal)
        genderSelector.setTitleTextAttributes(genderSelectorFontAttribute, for: .selected)
        genderSelector.selectedSegmentIndex = isMale
        
        if let pc = playerCharacter
        {
            setButtonActive(true, button: confirmButton)
            
            nameTextField.text = pc.name!
            ageTextField.text = pc.age!
            raceTextField.text = pc.race
            
            switch pc.gender!
            {
            case .male:
                genderSelector.selectedSegmentIndex = isMale
            case .female:
                genderSelector.selectedSegmentIndex = isFemale
            }
        }
    }
    
    private func setButtonActive(_ active: Bool, button: UIButton)
    {
        button.isEnabled = active
        button.isUserInteractionEnabled = active
        button.alpha = active ? GameDataUILayout.activeALphaValue : GameDataUILayout.inactiveAlphaValue
    }
    
    @IBAction func discardButtonPressed(_ sender: UIButton)
    {
        router?.navigateToHomeScene(nil)
    }
    
    @IBAction func confirmButtonPressed(_ sender: UIButton)
    {
        let gender = genderSelector.selectedSegmentIndex == isMale ? PlayerGender.male : PlayerGender.female
        
        interactor?.createPlayerCharateristics(withName: nameTextField.text, age: ageTextField.text, race: raceTextField.text, gender: gender)
        
        router?.navigateToHomeScene(interactor?.pc)
    }
    
    func responseNavigateToHomeScene(_ scene: UIViewController)
    {
        presenter?.presentNewScene(scene)
    }
    
    func responseCanCreateCharacter()
    {
        setButtonActive(true, button: confirmButton)
    }
    
    func manageFatalError()
    {
        presenter?.showFatalErrorAlert()
    }
    
    func responsePresentFatalErrorAlert(_ alertError: UIAlertController)
    {
        present(alertError, animated: true, completion: nil)
    }
    
    //MARK: UITextField Delegate
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        interactor?.checkCharacterInputValidity(nameTextField.text, age: ageTextField.text, race: raceTextField.text)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool
    {
        setButtonActive(false, button: confirmButton)
        
        return true
    }
}
