//
//  ArchetypesModel.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 23/01/23.
//

import Foundation

struct ArchetypeModel: Hashable {
    var descriptionText: String
    var imageName: String
    var archetypeStage: String
    
    init (descriptionText: String, imageName: String, archetypeStage: String) {
        self.descriptionText = descriptionText
        self.imageName = imageName
        self.archetypeStage = archetypeStage
    }
}
