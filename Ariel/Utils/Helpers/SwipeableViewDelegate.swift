//
//  SwipeableViewDelegate.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 28/02/23.
//

import Foundation

protocol SwipeableViewDelegate: AnyObject {
    func didTap(view: SwipeableView)
    func didBeginSwipe(onView view: SwipeableView)
    func didEndSwipe(onView view: SwipeableView)
}
