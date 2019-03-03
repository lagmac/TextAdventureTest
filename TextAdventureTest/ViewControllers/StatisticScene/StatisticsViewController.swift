//
//  StatisticsViewController.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 30/01/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import UIKit

class StatisticsViewController: UIViewController, StatisticViewDisplayLogic
{
    @IBOutlet weak var backToHomeButton: UIButton!
    @IBOutlet weak var gameTimeLabel: UILabel!
    @IBOutlet weak var visitedRoomsLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var experienceLabel: UILabel!
    @IBOutlet weak var goldLabel: UILabel!
    @IBOutlet weak var tresuresFound: UILabel!
    
    private var router: StatisticViewRouter?
    private var interactor: StatisticViewInteractor?
    private var presenter: StatisticPresenter?
    
    var playerStatistics: PlayerStatistics?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let router = StatisticViewRouter()
        router.scene = self
        self.router = router
        
        let interactor = StatisticViewInteractor()
        interactor.scene = self
        self.interactor = interactor
        
        let presenter = StatisticPresenter()
        presenter.scene = self
        self.presenter = presenter
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        interactor?.requestParsePlayerStatistics(fromData: playerStatistics)
    }
    
    @IBAction func backToHomeButtonPressed(_ sender: UIButton)
    {
        router?.navigateToHomeScene(withData: nil)
    }
    
    func responseParsePlayerStatistics(_ pc: [String : String])
    {
        gameTimeLabel.text = pc[PlayerStatistics.GAME_TIME]
        visitedRoomsLabel.text = pc[PlayerStatistics.VISITED_ROOMS]
        levelLabel.text = pc[PlayerStatistics.LEVEL_TEXT]
        experienceLabel.text = pc[PlayerStatistics.EXP_TEXT]
        goldLabel.text = pc[PlayerStatistics.GOLD_TEXT]
        tresuresFound.text = pc[PlayerStatistics.TREASURES_FOUND]
    }
    
    func responseNavigateToNewScene(_ scene: UIViewController)
    {
        presenter?.presentNewScene(scene)
    }
    
    func manageFatalError()
    {
        
    }
}
