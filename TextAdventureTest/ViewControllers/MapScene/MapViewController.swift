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
    @IBOutlet weak var mapImageViewBackground: UIView!
    @IBOutlet weak var mapImageView: MapView!
    @IBOutlet weak var panGesture: UIPanGestureRecognizer!
    @IBOutlet weak var doubleTapGesture: UITapGestureRecognizer!
    
    private var router: MapViewRouter?
    private var presenter: MapViewPresenter?
    
    private var resetPoint: CGPoint!
    
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
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {

    }
    
    private func setupUI()
    {
        mapImageViewBackground.layer.cornerRadius = GameDataUILayout.cornerRadius
        mapImageViewBackground.clipsToBounds = true
        
        panGesture.require(toFail: doubleTapGesture)
        
        resetPoint = mapImageView.center
    }
    
    @IBAction func backToHomeButtonPressed(_ sender: UIButton)
    {
        router?.navigateToHomeScene(withData: nil)
    }
    
    @IBAction func handlePan(recognizer: UIPanGestureRecognizer)
    {
        let translation = recognizer.translation(in: self.view)
        
        if let view = recognizer.view
        {
            view.center = CGPoint(x:view.center.x + translation.x,
                                  y:view.center.y + translation.y)
        }
        
        recognizer.setTranslation(CGPoint.zero, in: self.view)
    }
    
    @IBAction func handleDoubleTap(recognizer: UITapGestureRecognizer)
    {
        if let view = recognizer.view
        {
            view.center = resetPoint
        }
    }
    
    func responseNavigateToNewScene(_ scene: UIViewController)
    {
        presenter?.presentNewScene(scene)
    }
    
    func manageFatalError()
    {
        
    }
}
