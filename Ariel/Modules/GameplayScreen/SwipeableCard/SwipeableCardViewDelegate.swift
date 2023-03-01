//
//  SwipeableCardViewDelegate.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 28/02/23.
//

import Foundation

protocol SwipeableCardViewDelegate: AnyObject {
    func didSelect(card: SwipeableCardViewCard, atIndex index: Int)
}
