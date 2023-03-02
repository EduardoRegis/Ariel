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
    func setNewDialogue(newDialogue: Dialogue)
}

class GameplayScreenViewController: BaseViewController, SwipeableCardViewDataSource {
    
    // MARK: - Outlets
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var desciptionContainer: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionScrollView: UIScrollView!
    @IBOutlet weak var swipeableCardView: SwipeableCardViewContainer!
    @IBOutlet weak var backgroundCard: UIView!
    
    @IBOutlet weak var contentScrollViewHeightConstraint: NSLayoutConstraint!
    
    // MARK: - Properties
    var dialogue: Dialogue?
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
        backgroundCard.layer.cornerRadius = 14.0
        presenter.didLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNewDialogue(newDialogue: Dialogues.firstText.getDialogue())
        self.swipeableCardView.removeAllCardViews()
        presenter.willAppear()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.didAppear()
    }
    
    // MARK: - Methods
    func resetScrollViewHeight() {
        self.descriptionLabel.attributedText = .none
        self.contentScrollViewHeightConstraint.constant = 30
        self.view.layoutIfNeeded()
    }
    
    func automaticScrollToBottom() {
        if self.descriptionLabel.frame.height > desciptionContainer.frame.height {
            let bottomOffset = CGPoint(x: 0, y: descriptionScrollView.contentSize.height - descriptionScrollView.bounds.height + descriptionScrollView.contentInset.bottom)
            descriptionScrollView.setContentOffset(bottomOffset, animated: true)
        }
    }
    
    func resizeScrollViewHeight() {
        if self.contentScrollViewHeightConstraint.constant < self.descriptionLabel.frame.height {
            self.contentScrollViewHeightConstraint.constant = self.descriptionLabel.frame.height
            self.automaticScrollToBottom()
            self.view.layoutIfNeeded()
        }
    }
    
    // MARK: - Actions
    @IBAction func backAction(_ sender: Any) {
        self.presenter.backToMenu()
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
    
    func setNewDialogue(newDialogue: Dialogue) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [self] in
            
            resetScrollViewHeight()
            
            dialogue = newDialogue
            presenter.checkTrigger(dialogue: newDialogue)
            presenter.setupDialogue(newDialogue: newDialogue)
            
            if let soundEffect = dialogue?.soundTrigger {
                presenter.triggeringSound(name: soundEffect)
            }
            
            descriptionLabel.setTypingAttributed(newText: presenter.descriptionText!, characterDelay: 1.0, typeLetterCompletion: { [self] in
                resizeScrollViewHeight()
            },  beforeCompletion: { [self] in
                automaticScrollToBottom()
                swipeableCardView.reloadData()
            })
        }
    }
}

// MARK: - GameplayScreenPresenterDelegate
extension GameplayScreenViewController: GameplayScreenPresenterDelegate {
    func didLoadRemoteConfig() {
    }
}
