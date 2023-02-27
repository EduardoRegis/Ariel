//
//  BasePresenterDelegate.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 20/01/23.
//

import UIKit

protocol BasePresenterDelegate where Self: UIViewController {
    func showLoader()
    func hideLoader()
    func showMessage(_ message: String, okAction: (() -> Void)?, cancelAction: (() -> Void)?)
}
