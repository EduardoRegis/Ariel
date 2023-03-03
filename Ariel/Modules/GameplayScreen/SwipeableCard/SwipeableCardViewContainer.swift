//
//  SwipeableCardViewContainer.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 28/02/23.
//

import UIKit

class SwipeableCardViewContainer: UIView, SwipeableViewDelegate {

    static let horizontalInset: CGFloat = 12.0
    static let verticalInset: CGFloat = 12.0

    var dataSource: SwipeableCardViewDataSource? {
        didSet {
            reloadData()
        }
    }

    var delegate: SwipeableCardViewDelegate?
    private var cardViews: [SwipeableCardViewCard] = []
    private var visibleCardViews: [SwipeableCardViewCard] {
        return subviews as? [SwipeableCardViewCard] ?? []
    }

    fileprivate var remainingCards: Int = 0
    static let numberOfVisibleCards: Int = 3

    override func awakeFromNib() {
        super.awakeFromNib()

        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
    }

    func reloadData() {
        removeAllCardViews()
        guard let dataSource = dataSource else {
            return
        }

        let numberOfCards = dataSource.numberOfCards()
        remainingCards = numberOfCards

        for index in 0..<min(numberOfCards, SwipeableCardViewContainer.numberOfVisibleCards) {
            addCardView(cardView: dataSource.card(forItemAtIndex: index), atIndex: index)
        }

        if let emptyView = dataSource.viewForEmptyCards() {
            addEdgeConstrainedSubView(view: emptyView)
        }

        setNeedsLayout()
    }

    private func addCardView(cardView: SwipeableCardViewCard, atIndex index: Int) {
        cardView.delegate = self
        setFrame(forCardView: cardView, atIndex: index)
        cardViews.append(cardView)
        insertSubview(cardView, at: 0)
        remainingCards -= 1
    }

    func removeAllCardViews() {
        for cardView in visibleCardViews {
            cardView.removeFromSuperview()
        }
        cardViews = []
    }

    private func setFrame(forCardView cardView: SwipeableCardViewCard, atIndex index: Int) {
        var cardViewFrame = bounds
        var offScreenFrame = bounds
        let horizontalInset = (CGFloat(index) * SwipeableCardViewContainer.horizontalInset)
        let verticalInset = CGFloat(index) * SwipeableCardViewContainer.verticalInset

        cardViewFrame.size.width -= 2 * horizontalInset
        cardViewFrame.origin.x += (horizontalInset)
        cardViewFrame.origin.y += (verticalInset)
        
        offScreenFrame.size.width -= 2 * horizontalInset
        offScreenFrame.origin.x += (horizontalInset - 500)
        offScreenFrame.origin.y += (verticalInset - 1000)

        cardView.frame = offScreenFrame
        
        UIView.animate(withDuration: 0.5) {
            cardView.frame = cardViewFrame
        }
    }

}

// MARK: - SwipeableViewDelegate

extension SwipeableCardViewContainer {

    func didTap(view: SwipeableView) {
        if let cardView = view as? SwipeableCardViewCard,
           let index = cardViews.firstIndex(of: cardView) {
            delegate?.didSelect(card: cardView, atIndex: index)
        }
    }

    func didBeginSwipe(onView view: SwipeableView) {
        // React to Swipe Began?
    }
    
    func showTextInCard(direction: SwipeDirection) {
        if let cardView = cardViews.first as? SampleSwipeableCard {
            cardView.showTextInCard(direction: direction)
        }
    }
    
    func hideTextInCard() {
        if let cardView = cardViews.first as? SampleSwipeableCard {
            cardView.hideTextInCard()
        }
    }

    func didEndSwipe(onView view: SwipeableView, direction: SwipeDirection) {
        guard let dataSource = dataSource else {
            return
        }
        
        if let cardView = self.cardViews.first as? SampleSwipeableCard {
            switch direction {
            case .right:
                AudioManager.shared.playSoundEffect(name: "cardSideChoosen")
                guard let dialogueName = cardView.dialogue?.nextRightDialogue else { return }
                guard let nextDialogue = DialogueManager.shared.getDialogueByString(name: dialogueName) else { return }
                UserDefaults.standard.set(dialogueName, forKey: "lastDialogueSaved")
                dataSource.setNewDialogue(newDialogue: nextDialogue)
            case .left:
                AudioManager.shared.playSoundEffect(name: "cardSideChoosen")
                guard let dialogueName = cardView.dialogue?.nextLeftDialogue else { return }
                guard let nextDialogue = DialogueManager.shared.getDialogueByString(name: dialogueName) else { return }
                UserDefaults.standard.set(dialogueName, forKey: "lastDialogueSaved")
                dataSource.setNewDialogue(newDialogue: nextDialogue)
            default:
                break
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: {
            // Remove swiped card
            view.removeFromSuperview()
        })
    }
}

