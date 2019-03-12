//
//  HomeViewController.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 12/12/2018.
//  Copyright © 2018 Gino Preti. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, HomeViewDisplayLogic
{
    @IBOutlet weak var createPlayerButton: UIButton!
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var playerAvatar: UIImageView!
    @IBOutlet weak var settingsButton: UIButton!
    
    private var router: HomeViewRouter?
    private var interactor: HomeSceneBusinessLogic?
    private var presenter: HomeViewPresenterLogic?
    
    var playerCharacteristics: PlayerCharacteristics?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        let interactor = HomeSceneInteractor()
        interactor.scene = self
        self.interactor = interactor
        
        let router = HomeViewRouter()
        router.scene = self
        self.router = router
        
        let presenter = HomeViewPresenter()
        presenter.scene = self
        presenter.interactor = self.interactor
        self.presenter = presenter
        
        createPlayerButton.layer.cornerRadius = GameDataUILayout.cornerRadius
        createPlayerButton.clipsToBounds = true
        
        startGameButton.layer.cornerRadius = GameDataUILayout.cornerRadius
        startGameButton.clipsToBounds = true
        
        playerAvatar.layer.cornerRadius = GameDataUILayout.cornerRadius
        playerAvatar.clipsToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        setAvatarImage()
        
        setButtonActive(true, button: startGameButton)
        
        interactor?.playMusic()
    }
    
    private func setAvatarImage()
    {
        guard let gender = playerCharacteristics?.gender else {
            return
        }
        
        let avatarImage = gender == PlayerGender.male ? GameDataUILayout.male_avatar_image : GameDataUILayout.female_avatar_image
        
        playerAvatar.image = avatarImage
    }
    
    private func setButtonActive(_ active: Bool, button: UIButton)
    {
        button.isEnabled = active
        button.isUserInteractionEnabled = active
        button.alpha = active ? GameDataUILayout.activeALphaValue : GameDataUILayout.inactiveAlphaValue
    }
    
    @IBAction func createPlayerButtonPresse(_ sender: UIButton)
    {
        interactor?.requestExistingCharacter()
    }
    
    @IBAction func startGameButtonPressed(_ sender: UIButton)
    {
        interactor?.requestSavedGameExist()
    }
    
    @IBAction func settingsButtonPressed(_ sender: UIButton)
    {
        presenter?.showSettingsOptionsSelector()
    }
    
    func responseNavigateToNewScene(_ scene: UIViewController)
    {
        presenter?.presentNewScene(scene)
    }
    
    func responseToSavedGameNotExist()
    {
        router?.navigateToMainScene(withData: nil)
    }
    
    func responseToSavedGameExist()
    {
        presenter?.showLoadingOptionsSelector()
    }
    
    func responseToLoadGame(_ data: [String: Any?])
    {
        router?.navigateToMainScene(withData: data)
    }
    
    func responseToPresentStatisticScene()
    {
        let ps = interactor?.requestPlayerStatistics()
        
        router?.navigateToStatisticScene(withData: ps)
    }
    
    func responseToPresentMapScene()
    {
        let roomNumber = interactor?.requestRoomNumber()
        
        router?.navigateToMapScene(withData: roomNumber!)
    }
    
    func responsePresentOptionsSelector(_ actionSelector: UIAlertController)
    {
        present(actionSelector, animated: true, completion: nil)
    }
    
    func responseCharacterExist(_ pc: PlayerCharacteristics)
    {
        router?.navigateToCreatePlayerScene(withData: pc)
    }
    
    func responseCharacterNotExist()
    {
        router?.navigateToCreatePlayerScene(withData: nil)
    }
    
    func manageFatalError()
    {
        presenter?.showFatalErrorAlert()
    }
    
    func responsePresentFatalErrorAlert(_ alertError: UIAlertController)
    {
        present(alertError, animated: true, completion: nil)
    }
}
