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
    var herosJourneysStage: String
    var nextLeftDialogue: String?
    var nextRightDialogue: String?
    var soundTrigger: String?
    var archievementTrigger: String?
    var genericTrigger: String?
    
    init (descriptionText: String, leftCardText: String, rightCardText: String,
          imageName: String, herosJourneysStage: String, nextLeftDialogue: String? = "",
          nextRightDialogue: String? = "", soundTrigger: String? = "", archievementTrigger: String? = "", genericTrigger: String? = "") {
        self.descriptionText = descriptionText
        self.leftCardText = leftCardText
        self.rightCardText = rightCardText
        self.imageName = imageName
        self.herosJourneysStage = herosJourneysStage
        self.nextLeftDialogue = nextLeftDialogue
        self.nextRightDialogue = nextRightDialogue
        self.soundTrigger = soundTrigger
        self.archievementTrigger = archievementTrigger
        self.genericTrigger = genericTrigger
    }
}
