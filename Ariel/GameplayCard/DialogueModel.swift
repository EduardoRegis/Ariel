//
//  DialogueModel.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 12/01/23.
//

import Foundation

struct Dialogue: Hashable {
    var descriptionText: String
    var leftCardText: String
    var rightCardText: String
    var imageName: String
    
    init (descriptionText: String, leftCardText: String, rightCardText: String, imageName: String) {
        self.descriptionText = descriptionText
        self.leftCardText = leftCardText
        self.rightCardText = rightCardText
        self.imageName = imageName
    }
}
