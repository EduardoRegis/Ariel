//
//  DialoguesList.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 12/01/23.
//

import Foundation

enum Dialogues {
    case firstText, secondText

    func getDialogue() -> Dialogue {
        switch self {
        case .firstText:
            return Dialogue(descriptionText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                            leftCardText: "Nada a ver",
                            rightCardText: "Pô, vdd",
                            imageName: "Poder")
        case .secondText:
            return Dialogue(descriptionText: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
                            leftCardText: "Tá zoando",
                            rightCardText: "Pode crer",
                            imageName: "Treinador")
        }
    }
}
