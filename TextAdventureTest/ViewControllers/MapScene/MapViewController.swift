//
//  MapViewController.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 07/03/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, MapViewDisplayLogic
{
    @IBOutlet weak var backToHomeButton: UIButton!
    
    private var router: MapViewRouter?
    private var presenter: MapViewPresenter?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let router = MapViewRouter()
        router.scene = self
        self.router = router

//        let interactor = StatisticViewInteractor()
//        interactor.scene = self
//        self.interactor = interactor
//
        let presenter = MapViewPresenter()
        presenter.scene = self
        self.presenter = presenter
    }
    
    override func viewWillAppear(_ animated: Bool)
    {

    }
    
    @IBAction func backToHomeButtonPressed(_ sender: UIButton)
    {
        router?.navigateToHomeScene(withData: nil)
    }
    
    func responseNavigateToNewScene(_ scene: UIViewController)
    {
        presenter?.presentNewScene(scene)
    }
    
    func manageFatalError()
    {
        
    }
}
