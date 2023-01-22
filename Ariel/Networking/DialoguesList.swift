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
        case "fourthText":
            return Dialogues.fourthText.getDialogue()
        case "fifthText":
            return Dialogues.fifthText.getDialogue()
        case "sixthText":
            return Dialogues.sixthText.getDialogue()
        case "seventhText":
            return Dialogues.seventhText.getDialogue()
        case "eighthText":
            return Dialogues.eighthText.getDialogue()
        case "ninthText":
            return Dialogues.ninthText.getDialogue()
        case "tenthText":
            return Dialogues.tenthText.getDialogue()
        default:
            return nil
        }
    }
}

enum Dialogues {
    
    case firstText, secondText, thirdText, fourthText, fifthText, sixthText, seventhText, eighthText, ninthText, tenthText
    
    func getDialogue() -> Dialogue {
        switch self {
        case .firstText:
            return Dialogue(descriptionText: "Lorem ipsum {World} sit amet, [consectetur] #adipiscing# elit, sed do eiusmod #tempor# incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                            leftCardText: "Nada a ver",
                            rightCardText: "Pô, vdd",
                            imageName: "ariel still",
                            herosJourneysStage: "Teste",
                            nextLeftDialogue: "tenthText",
                            nextRightDialogue: "thirdText")
        case .secondText:
            return Dialogue(descriptionText: "Sed ut (perspiciatis) unde omnis {iste} natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
                            leftCardText: "Tá zoando",
                            rightCardText: "Pode crer",
                            imageName: "Treinador",
                            herosJourneysStage: "Teste",
                            nextLeftDialogue: "thirdText",
                            nextRightDialogue: "fourthText")
        case .thirdText:
            return Dialogue(descriptionText: "CUESTA 🇦🇷 NA MEIA 🧦 ESQUERDA⬅️⬅️AMEAÇOU 🔫🔪 NÃO BATEU 🚫🥊 VEM PRA TABELA 📉📈 PEGLOW ☄️ PRO CUESTA 🇦🇷 BATEU CRUZADO 💴⚔️✝️ EDENILSOOOOOOOOOOOOOOOOON 👨🏾👨🏾👨🏾👨🏾👨🏾👨🏾👨🏾👨🏾  QUARENTA E UM ANOS 4️⃣1️⃣ 👉👌👴🏻🏆GOOOOOOOOOOOOOOL ⚽👨🏾🤸🏾‍♂️👨🏾 pipipi 🧏‍♂️🙋‍♂️🙋‍♂️🗽🚩",
                            leftCardText: "Mó paia",
                            rightCardText: "Com certeza",
                            imageName: "Capela",
                            herosJourneysStage: "Teste",
                            nextLeftDialogue: "fourthText",
                            nextRightDialogue: "fifthText")
        case .fourthText:
            return Dialogue(descriptionText: "Lorem ipsum World sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                            leftCardText: "Nada a ver",
                            rightCardText: "Pô, vdd",
                            imageName: "Ariel_chega_casa",
                            herosJourneysStage: "Teste",
                            nextLeftDialogue: "fifthText",
                            nextRightDialogue: "sixthText")
        case .fifthText:
            return Dialogue(descriptionText: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
                            leftCardText: "Tá zoando",
                            rightCardText: "Pode crer",
                            imageName: "Solum - Magia",
                            herosJourneysStage: "Teste",
                            nextLeftDialogue: "sixthText",
                            nextRightDialogue: "seventhText")
        case .sixthText:
            return Dialogue(descriptionText: "CUESTA 🇦🇷 NA MEIA 🧦 ESQUERDA⬅️⬅️AMEAÇOU 🔫🔪 NÃO BATEU 🚫🥊 VEM PRA TABELA 📉📈 PEGLOW ☄️ PRO CUESTA 🇦🇷 BATEU CRUZADO 💴⚔️✝️ EDENILSOOOOOOOOOOOOOOOOON 👨🏾👨🏾👨🏾👨🏾👨🏾👨🏾👨🏾👨🏾  QUARENTA E UM ANOS 4️⃣1️⃣ 👉👌👴🏻🏆GOOOOOOOOOOOOOOL ⚽👨🏾🤸🏾‍♂️👨🏾 pipipi 🧏‍♂️🙋‍♂️🙋‍♂️🗽🚩",
                            leftCardText: "Mó paia",
                            rightCardText: "Com certeza",
                            imageName: "Solum - sequestro",
                            herosJourneysStage: "Teste",
                            nextLeftDialogue: "seventhText",
                            nextRightDialogue: "eighthText")
        case .seventhText:
            return Dialogue(descriptionText: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
                            leftCardText: "Tá zoando",
                            rightCardText: "Pode crer",
                            imageName: "Rato",
                            herosJourneysStage: "Teste",
                            nextLeftDialogue: "eighthText",
                            nextRightDialogue: "")
        case .eighthText:
            return Dialogue(descriptionText: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
                            leftCardText: "Tá zoando",
                            rightCardText: "Pode crer",
                            imageName: "Rato",
                            herosJourneysStage: "Teste",
                            nextLeftDialogue: "",
                            nextRightDialogue: "")
        case .ninthText:
            return Dialogue(descriptionText: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
                            leftCardText: "Tá zoando",
                            rightCardText: "Pode crer",
                            imageName: "Poder",
                            herosJourneysStage: "Teste",
                            nextLeftDialogue: "",
                            nextRightDialogue: "")
        case .tenthText:
            return Dialogue(descriptionText: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
                            leftCardText: "Tá zoando",
                            rightCardText: "Pode crer",
                            imageName: "smd_logo",
                            herosJourneysStage: "Teste",
                            nextLeftDialogue: "",
                            nextRightDialogue: "")
        }
    }
}
