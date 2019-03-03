//
//  ViewController.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 14/11/2018.
//  Copyright © 2018 Gino Preti. All rights reserved.
//

import UIKit

class MainSceneViewController: UIViewController, UITextViewDelegate, MainSceneDisplayLogic, UIPickerViewDelegate, UIPickerViewDataSource
{
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var actionResponseTextView: UITextView!
    @IBOutlet weak var roomName: UILabel!
    
    @IBOutlet weak var expLabel: UILabel!
    @IBOutlet weak var hpLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var goldLabel: UILabel!
    
    @IBOutlet weak var inventoryButton: UIButton!
    @IBOutlet weak var backToHomeButton: UIButton!
    @IBOutlet weak var saveGameButton: UIButton!
    
    @IBOutlet weak var inventoryItemsPicker: UIPickerView!
    
    @IBOutlet weak var healthBar: UIProgressView!
    @IBOutlet weak var strenghtBar: UIProgressView!
    @IBOutlet weak var tirednessBar: UIProgressView!
        
    private var interactor: MainSceneBusinessLogic?
    private var presenter: MainScenePresentLogic?
    private var router: MainSceneRouter?
    
    var loadedData: [String : Any?]?
    
    // MARK: INIT
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let interactor = MainSceneInteractor()
        interactor.scene = self
        self.interactor = interactor
        
        let presenter = MainScenePresenter()
        presenter.scene = self
        presenter.interactor = self.interactor
        self.presenter = presenter
        
        let router = MainSceneRouter()
        router.scene = self
        self.router = router
        
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        interactor?.requestSavingStartTime()
        interactor?.requestStartTirednessCalculator()
    }
    
    private func setup()
    {
        setInventoryItemPickerState(withNewState: false)
        
        textView.layer.cornerRadius = GameDataUILayout.cornerRadius
        textView.clipsToBounds = true
        actionResponseTextView.layer.cornerRadius = GameDataUILayout.cornerRadius
        actionResponseTextView.clipsToBounds = true
        roomName.layer.cornerRadius = GameDataUILayout.cornerRadius
        roomName.clipsToBounds = true
        
        textView.text = ""
        textView.delegate = self
        actionResponseTextView.text = ""
        roomName.text = ""
        
        inventoryButton.layer.cornerRadius = GameDataUILayout.cornerRadius
        inventoryButton.clipsToBounds = true

        updateHUD(withExp: PlayerData.MIN_EXP,
                  hp: PlayerData.START_HP,
                  level: PlayerData.START_LEVEL,
                  gold: PlayerData.START_GOLD,
                  health: PlayerData.START_HEALTH,
                  strenght: PlayerData.START_STRENGHT,
                  tiredness: PlayerData.START_TIREDNESS)
                
        if loadedData != nil
        {
            if let lastRoom = loadedData?[PreferenceKeys.lastRoom] as? String
            {
                interactor?.requestCreatePlayer(fromData: true)
                interactor?.requestBuildingRoom(withName: lastRoom, isSavedGame: true)
            }
        }
        else
        {
            interactor?.requestCreatePlayer(fromData: false)
            interactor?.requestBuildingRoom(withName: RoomData.startingRoom, isSavedGame: false)
        }
        
        interactor?.playMusic()
    }
    
    // MARK: INTERNAL FUNCTIONS
    @IBAction func inventoryButtonTapped(_ sender: UIButton)
    {
        inventoryItemsPicker.reloadAllComponents()
        
        setInventoryItemPickerState(withNewState: inventoryItemsPicker.isHidden)
    }
    
    @IBAction func backToHomeButtonPressed(_ sender: UIButton)
    {
        presenter?.showBackToHomeAlert()
    }
    
    @IBAction func saveGameButtonPressed(_ sender: UIButton)
    {
        interactor?.requestSavingGame(andBackToHome: false)
    }
    
    private func refreshItemsPicker()
    {
        if inventoryItemsPicker.isHidden == false
        {
            inventoryItemsPicker.reloadAllComponents()
        }
    }
    
    private func setInventoryButtonState(withNewState state: Bool, andItemsCount itemsCount: Int)
    {
        inventoryButton.setTitle(HUDLabel.inventory(withItems: itemsCount), for: .normal)
        
        inventoryButton.isEnabled = state
        inventoryButton.isUserInteractionEnabled = state
        inventoryButton.alpha = state ? GameDataUILayout.activeALphaValue : GameDataUILayout.inactiveAlphaValue
    }
    
    private func setInventoryItemPickerState(withNewState state: Bool)
    {
        inventoryItemsPicker.isUserInteractionEnabled = state
        inventoryItemsPicker.isHidden = !state
    }
    
    private func updateHUD(withExp exp: Int, hp: Int, level: Int, gold: Int, health: Float, strenght: Float, tiredness: Float)
    {
        expLabel.text = Utilities.HudFormattedString(withText: HUDLabel.exp, argument: exp)
        hpLabel.text = Utilities.HudFormattedString(withText: HUDLabel.hp, argument: hp)
        levelLabel.text = Utilities.HudFormattedString(withText: HUDLabel.level, argument: level)
        goldLabel.text = Utilities.HudFormattedString(withText: HUDLabel.gold, argument: gold)
        
        healthBar.progress = health
        strenghtBar.progress = strenght
        tirednessBar.progress = tiredness
    }
    
    // MARK: DISPALY LOGIC
    func responsePlayerCreatedOrUpdated(withValuesOf exp: Int,
                                        hp: Int,
                                        lvl: Int,
                                        gold: Int,
                                        health: Float,
                                        strenght: Float,
                                        tiredness: Float,
                                        inventoryActive: Bool,
                                        itemsCount: Int) {
        
        setInventoryButtonState(withNewState: inventoryActive, andItemsCount: itemsCount)
        
        updateHUD(withExp: exp, hp: hp, level: lvl, gold: gold, health: health, strenght: strenght, tiredness: tiredness)
    }

    func responseBuindingRoomRequest(withRoomName roomName: String, roomDescription: NSMutableAttributedString)
    {
        self.roomName.text = roomName
        textView.attributedText =  roomDescription
        textView.linkTextAttributes = [NSAttributedString.Key.foregroundColor : FontStyles.generaleFontColor]
    }
    
    func responseRoomObjectRequest(_ roomObject: RoomObject)
    {
        presenter?.showActionsSelector(forObject: roomObject)
    }
    
    func responseToAddItemToPlayerInventory(_ response: String, itemsCount: Int)
    {
        self.actionResponseTextView.text = response
        refreshItemsPicker()
        setInventoryButtonState(withNewState: true, andItemsCount: itemsCount)
    }
    
    func responseToRemoveItemFromPlayerInventory(_ response: String, inventoryState: Bool, itemsCount: Int)
    {
        self.actionResponseTextView.text = response
        setInventoryButtonState(withNewState: inventoryState, andItemsCount: itemsCount)
    }
    
    func responseToRequestObjectFromInventory(_ item: RoomObject?)
    {
        if let _item = item
        {
            setInventoryItemPickerState(withNewState: false)
            presenter?.showActionsSelector(forObject: _item)
        }
    }
    
    func responseToInventoryIsFull(_ response: PlayerActionsErros)
    {
        actionResponseTextView.text = response.localizedDescription
    }
    
    func responseToHitEnemy(withOutcome message: String)
    {
        actionResponseTextView.text = message
    }
    
    func manageBuilginsRoomRequestError(_ err: RoomBuilderErrors)
    {
        actionResponseTextView.text = err.localizedDescription
    }
    
    func manageRoomObjectRequestError(_ err: PlayerActionsErros)
    {
        actionResponseTextView.text = err.localizedDescription
    }
    
    func responseActionResponseRequest(_ response: String)
    {
        self.actionResponseTextView.text = response
    }
    
    func manageActionResponseError(_ err: PlayerActionsErros)
    {
        self.actionResponseTextView.text = err.localizedDescription
    }
    
    func responseToRoomDescriptionChanged(withNewDescription description: NSMutableAttributedString)
    {
        textView.attributedText = description
    }
    
    func responsePresentingActionSelector(_ actionSelector: UIAlertController)
    {
        present(actionSelector, animated: true, completion: nil)
    }
    
    func responseToRequestSavingGame(andBackToHome backToHome: Bool)
    {
        if backToHome
        {
            router?.navigateToHomeScene(nil)
        }
        else
        {
            let previousText = self.actionResponseTextView.text
            
            self.actionResponseTextView.text = ActionsGenericResponses.gameSaved.localizedDescription
            
            _ = Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { (Timer) in
                
                self.actionResponseTextView.text = previousText
            })
        }
    }
    
    func responseBackToHome(withSaving save: Bool)
    {
        save == true ? interactor?.requestSavingGame(andBackToHome: save) : router?.navigateToHomeScene(nil)
    }
    
    func responseNavigateToHomeScene(_ scene: UIViewController)
    {
        interactor?.requestSavingElapsedGameTime()
        presenter?.presentNewScene(scene)
    }
    
    func manageFatalError(_ message: String?)
    {
        presenter?.showFatalErrorAlert(withMessage: message)
    }
    
    func responsePresentFatalErrorAlert(_ alertError: UIAlertController)
    {
        present(alertError, animated: true, completion: nil)
    }
    
    // MARK: TEXT FIELD DELEGATE
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool
    {
        return (interactor?.requestObject(withId: URL, in: characterRange))!
    }
    
    // MARK: INVENTORY ITEMS PICKER DELEGATE
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        interactor?.requestItemFromInventory(atIndex: row)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return interactor?.requestItemsInventoryCount() ?? Int().zero
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView
    {
        let label = presenter?.requestLabelForInventoryItemPicker(forRow: row)
        
        return label!
    }
}

