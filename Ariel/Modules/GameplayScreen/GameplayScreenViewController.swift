//
//  GameplayScreenViewController.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 28/02/23.
//

import UIKit

protocol SwipeableCardViewDataSource: AnyObject {
    func numberOfCards() -> Int
    func card(forItemAtIndex index: Int) -> SwipeableCardViewCard
    func viewForEmptyCards() -> UIView?
}

class GameplayScreenViewController: BaseViewController, SwipeableCardViewDataSource {
    
    // MARK: - Outlets
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var swipeableCardView: SwipeableCardViewContainer!
    
    // MARK: - Properties
    var dialogue: Dialogue = Dialogues.firstText.getDialogue()
    var presenter: GameplayScreenPresenter!
    
    // MARK: - View Lifecycle
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        swipeableCardView.dataSource = self
        presenter.didLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.willAppear()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.didAppear()
    }
    
    // MARK: - Actions
    @IBAction func backAction(_ sender: Any) {
        dialogue = Dialogues.secondText.getDialogue()
        swipeableCardView.reloadData()
//        self.presenter.backToMenu()
    }
}

// MARK: - SwipeableCardViewDataSource

extension GameplayScreenViewController {

    func numberOfCards() -> Int {
        return 1
    }

    func card(forItemAtIndex index: Int) -> SwipeableCardViewCard {
        let cardView = SampleSwipeableCard()
        cardView.viewModel = dialogue
        return cardView
    }

    func viewForEmptyCards() -> UIView? {
        return nil
    }

}

// MARK: - GameplayScreenPresenterDelegate
extension GameplayScreenViewController: GameplayScreenPresenterDelegate {
    func didLoadRemoteConfig() {
    }
}
