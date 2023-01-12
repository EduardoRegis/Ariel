//
//  ViewController.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 12/01/23.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goToArielAction(_ sender: Any) {
        let swiftUIViewController = UIHostingController(rootView: GameplayCardView())
        swiftUIViewController.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
        self.present(swiftUIViewController, animated: true, completion: nil)
    }
    
}

