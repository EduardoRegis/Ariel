//
//  DialoguesList.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 12/01/23.
//

import Foundation

class DialogueManager {
    
    static var shared: DialogueManager = {
        let instance = DialogueManager()
        return instance
    }()

    private init() {}
    
    func getDialogueByString(name: String) -> Dialogue? {
        switch name {
        case "firstText":
            return Dialogues.firstText.getDialogue()
        case "secondText":
            return Dialogues.secondText.getDialogue()
        case "thirdText":
            return Dialogues.thirdText.getDialogue()
        default:
            return nil
        }
    }
}

enum Dialogues {
    
    case firstText, secondText, thirdText
    
    func getDialogue() -> Dialogue {
        switch self {
        case .firstText:
            return Dialogue(descriptionText: "Lorem ipsum World sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                            leftCardText: "Nada a ver",
                            rightCardText: "Pô, vdd",
                            imageName: "Poder",
                            nextLeftDialogue: "secondText",
                            nextRightDialogue: "thirdText")
        case .secondText:
            return Dialogue(descriptionText: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
                            leftCardText: "Tá zoando",
                            rightCardText: "Pode crer",
                            imageName: "Treinador",
                            nextLeftDialogue: "fourthText",
                            nextRightDialogue: "fifthText")
        case .thirdText:
            return Dialogue(descriptionText: "CUESTA 🇦🇷 NA MEIA 🧦 ESQUERDA⬅️⬅️AMEAÇOU 🔫🔪 NÃO BATEU 🚫🥊 VEM PRA TABELA 📉📈 PEGLOW ☄️ PRO CUESTA 🇦🇷 BATEU CRUZADO 💴⚔️✝️ EDENILSOOOOOOOOOOOOOOOOON 👨🏾👨🏾👨🏾👨🏾👨🏾👨🏾👨🏾👨🏾  QUARENTA E UM ANOS 4️⃣1️⃣ 👉👌👴🏻🏆GOOOOOOOOOOOOOOL ⚽👨🏾🤸🏾‍♂️👨🏾 pipipi 🧏‍♂️🙋‍♂️🙋‍♂️🗽🚩",
                            leftCardText: "Mó paia",
                            rightCardText: "Com certeza",
                            imageName: "Capela",
                            nextLeftDialogue: "secondText",
                            nextRightDialogue: "seventhText")
        }
    }
}
