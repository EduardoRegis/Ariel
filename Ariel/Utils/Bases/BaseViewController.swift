//
//  BaseViewController.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 20/01/23.
//

import UIKit

protocol BaseViewControllerMethods {
    func showLoader()
    func hideLoader()
    func showMessage(_ message: String, okAction: (() -> Void)?, cancelAction: (() -> Void)?)
}

class BaseViewController: UIViewController, BaseViewControllerMethods {
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    var greyView = UIView()
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.backgroundColor = UIColor(named: "color_background")
    }
    
    @objc func showLoader() {
        guard let window = AppDelegate.windowView else { return }
        
        activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        activityIndicator.center = window.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .medium
        let transfrom = CGAffineTransform.init(scaleX: 1.5, y: 1.5)
        activityIndicator.transform = transfrom
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        greyView.frame = CGRect(x: 0, y: 0, width: window.bounds.width, height: window.bounds.height)
        greyView.backgroundColor = UIColor.black
        greyView.alpha = 0.6
        self.view.addSubview(greyView)
    }
    
    @objc func hideLoader() {
        self.activityIndicator.stopAnimating()
        self.greyView.removeFromSuperview()
    }
    
    func showMessage(_ message: String, okAction: (() -> Void)?, cancelAction: (() -> Void)?) {
        let alert = UIAlertController(title: AlertTexts.alert.localized(),
                                      message: message, preferredStyle: .alert)
        let okActionBtn = UIAlertAction(title: AlertTexts.ok.localized(), style: .default, handler: {_ in
            guard let okAction = okAction else { return}
            okAction()
        })
        if let cancelAction = cancelAction {
            let cancelActionBtn = UIAlertAction(title: AlertTexts.cancel.localized(), style: .default, handler: {_ in
                cancelAction()
            })
            alert.addAction(cancelActionBtn)
        }
        alert.addAction(okActionBtn)
        self.present(alert, animated: true, completion: nil)
    }
}
