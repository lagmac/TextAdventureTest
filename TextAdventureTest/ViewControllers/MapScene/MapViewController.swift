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
    
    private var mapImageView: MapView!
    
    private var router: MapViewRouter?
    private var presenter: MapViewPresenter?
    
    private var resetPoint: CGPoint!
    
    var roomList: [String]?
    
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
        guard roomList != nil else {
            
            return
        }
        
        mapImageViewBackground.layer.cornerRadius = GameDataUILayout.cornerRadius
        mapImageViewBackground.clipsToBounds = true

        let mapViewRect = CGRect(x: 0, y: 0, width: RoomData.MapWidth, height: RoomData.MapHeight)
        
        let originX: CGFloat = (mapImageViewBackground.frame.width - RoomData.MapWidth) / 2
        let originY: CGFloat = (mapImageViewBackground.frame.height - RoomData.MapHeight) / 2
        
        let origin: CGPoint = CGPoint(x: originX, y: originY)
        
        mapImageView = MapView(frame: mapViewRect)
        mapImageView.frame.origin = origin
        mapImageView.roomNameList = roomList
        
        addMapViewGestures()
        
        mapImageView.drawRoom()
        
        self.mapImageViewBackground.addSubview(mapImageView)
        
        resetPoint = mapImageView.center
    }
    
    @IBAction func backToHomeButtonPressed(_ sender: UIButton)
    {
        router?.navigateToHomeScene(withData: nil)
    }
    
    @objc func handlePan(_ recognizer: UIPanGestureRecognizer)
    {
        if let view = recognizer.view
        {
            let translation = recognizer.translation(in: self.view)
            
            view.center = CGPoint(x:view.center.x + translation.x,
                                  y:view.center.y + translation.y)
        }
        
        recognizer.setTranslation(CGPoint.zero, in: self.view)
    }
    
    @objc func handleDoubleTap(_ recognizer: UITapGestureRecognizer)
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
    
    private func addMapViewGestures()
    {
        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleDoubleTap(_:)))
        doubleTapGesture.numberOfTapsRequired = 2
        doubleTapGesture.delaysTouchesBegan = true
        doubleTapGesture.delaysTouchesEnded = true
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.handlePan(_:)))
        panGesture.delaysTouchesBegan = true
        panGesture.delaysTouchesEnded = true
        panGesture.require(toFail: doubleTapGesture)
        
        mapImageView.isUserInteractionEnabled = true
        mapImageView.addGestureRecognizer(panGesture)
        mapImageView.addGestureRecognizer(doubleTapGesture)
    }
}
