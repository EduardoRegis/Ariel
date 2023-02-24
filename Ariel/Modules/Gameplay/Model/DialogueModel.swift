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
    var achievementTrigger: String?
    var genericTrigger: String?
    var soundLoop: Bool?
    
    init (descriptionText: String, leftCardText: String, rightCardText: String,
          imageName: String, herosJourneysStage: String, nextLeftDialogue: String? = "",
          nextRightDialogue: String? = "", soundTrigger: String? = "", achievementTrigger: String? = "", genericTrigger: String? = "", soundLoop: Bool? = false) {
        self.descriptionText = descriptionText
        self.leftCardText = leftCardText
        self.rightCardText = rightCardText
        self.imageName = imageName
        self.herosJourneysStage = herosJourneysStage
        self.nextLeftDialogue = nextLeftDialogue
        self.nextRightDialogue = nextRightDialogue
        self.soundTrigger = soundTrigger
        self.achievementTrigger = achievementTrigger
        self.genericTrigger = genericTrigger
        self.soundLoop = soundLoop
    }
}
