//
//  CustomButton.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 26/02/23.
//

import UIKit

fileprivate let gradientLayerName = "gradientLayer"

extension UIButton {

    
    func applyCustomButton() {
        self.layer.cornerRadius = 3
        self.tintColor = .clear
        self.setTitleColor(UIColor(named: "color_tint"), for: .normal)
        self.layer.backgroundColor = UIColor(named: "color_button")?.cgColor
    }
}
