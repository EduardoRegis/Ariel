//
//  CustomButton.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 26/02/23.
//

import UIKit

extension UIButton {
    
    func applyEnabledCustomButton() {
        self.layer.cornerRadius = 3
        self.tintColor = .clear
        self.setTitleColor(UIColor(named: "color_tint"), for: .normal)
        self.layer.backgroundColor = UIColor(named: "color_button")?.cgColor
    }
    
    func applyDisabledCustomButton() {
        self.layer.cornerRadius = 3
        self.tintColor = .clear
        self.backgroundColor = .clear
        self.setTitleColor(UIColor(named: "color_tint"), for: .normal)
        self.layer.backgroundColor = UIColor(named: "color_background")?.cgColor
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor(named: "color_button")?.cgColor
    }
}
