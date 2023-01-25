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
    
    func getDialogueByString(name: String) -> Dialogue? { // lembrar de colocar um case para cada diálogo aqui também
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
    // lembrar de colocar um case para cada diálogo aqui também
    
    func getDialogue() -> Dialogue {
        switch self { // aqui vão os diálogos com escolhas
        case .firstText:
            return Dialogue(descriptionText: DialogueTexts.first_text.localized(),
                            leftCardText: DialogueTexts.first_leftCard.localized(),
                            rightCardText: DialogueTexts.first_rightCard.localized(),
                            imageName: "ariel still",
                            herosJourneysStage: HerosJourneysStageTexts.teste.localized(),
                            nextLeftDialogue: "secondText",
                            nextRightDialogue: "thirdText") // se não possuir parâmetro soundTrigger, ele apenas não emitirá nenhum efeito
        case .secondText:
            return Dialogue(descriptionText: DialogueTexts.second_text.localized(),
                            leftCardText: DialogueTexts.second_leftCard.localized(),
                            rightCardText: DialogueTexts.second_rightCard.localized(),
                            imageName: "Treinador",
                            herosJourneysStage: HerosJourneysStageTexts.teste.localized(),
                            nextLeftDialogue: "thirdText",
                            nextRightDialogue: "fourthText",
                            soundTrigger: "sliderButtonReleased") // aqui tem o parâmetro soundTrigger, onde vc coloca o nome do arquivo de som a ser tocado
        case .thirdText:
            return Dialogue(descriptionText: "(thirdText) CUESTA 🇦🇷 NA MEIA 🧦 ESQUERDA⬅️⬅️AMEAÇOU 🔫🔪 NÃO BATEU 🚫🥊 VEM PRA TABELA 📉📈 PEGLOW ☄️ PRO CUESTA 🇦🇷 BATEU CRUZADO 💴⚔️✝️ EDENILSOOOOOOOOOOOOOOOOON 👨🏾👨🏾👨🏾👨🏾👨🏾👨🏾👨🏾👨🏾  QUARENTA E UM ANOS 4️⃣1️⃣ 👉👌👴🏻🏆GOOOOOOOOOOOOOOL ⚽👨🏾🤸🏾‍♂️👨🏾 pipipi 🧏‍♂️🙋‍♂️🙋‍♂️🗽🚩",
                            leftCardText: "Mó paia",
                            rightCardText: "Com certeza",
                            imageName: "Capela",
                            herosJourneysStage: "Teste",
                            nextLeftDialogue: "fourthText",
                            nextRightDialogue: "fifthText",
                            archievementTrigger: "prodigy") // caso chegar nesse Dialogue implique em ativar um archievement, é só colocar o nome do archievement nesse parâmetro. Caso não tenha archievement basta não colocar esse parâmetro
        case .fourthText:
            return Dialogue(descriptionText: "(fourthText) Lorem ipsum World sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                            leftCardText: "Nada a ver",
                            rightCardText: "Pô, vdd",
                            imageName: "Ariel_chega_casa",
                            herosJourneysStage: "Teste",
                            nextLeftDialogue: "fifthText",
                            nextRightDialogue: "sixthText",
                            genericTrigger: "babaca+1") // caso precise aumentar o indice de babaca, só chamar esse parâmetro com "babaca+1", o parâmetro assim como o archievementTrigger, é opcional
        case .fifthText:
            return Dialogue(descriptionText: "(fifthText) Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
                            leftCardText: "Tá zoando",
                            rightCardText: "Pode crer",
                            imageName: "Solum - Magia",
                            herosJourneysStage: "Teste",
                            nextLeftDialogue: "sixthText",
                            nextRightDialogue: "seventhText",
                            archievementTrigger: "bestEnd",
                            genericTrigger: "herosJourney_1") // caso chegar nesse Dialogue implique em desbloquear um colecionável relativo a Jornada do Herói, basta colocar "herosJourney_?", com ? sendo o índice do colecionável em questão.
        case .sixthText:
            return Dialogue(descriptionText: "(sixthText) CUESTA 🇦🇷 NA MEIA 🧦 ESQUERDA⬅️⬅️AMEAÇOU 🔫🔪 NÃO BATEU 🚫🥊 VEM PRA TABELA 📉📈 PEGLOW ☄️ PRO CUESTA 🇦🇷 BATEU CRUZADO 💴⚔️✝️ EDENILSOOOOOOOOOOOOOOOOON 👨🏾👨🏾👨🏾👨🏾👨🏾👨🏾👨🏾👨🏾  QUARENTA E UM ANOS 4️⃣1️⃣ 👉👌👴🏻🏆GOOOOOOOOOOOOOOL ⚽👨🏾🤸🏾‍♂️👨🏾 pipipi 🧏‍♂️🙋‍♂️🙋‍♂️🗽🚩",
                            leftCardText: "Mó paia",
                            rightCardText: "Com certeza",
                            imageName: "Solum - sequestro",
                            herosJourneysStage: "Teste",
                            nextLeftDialogue: "seventhText",
                            nextRightDialogue: "eighthText",
                            genericTrigger: "archetype_1") // caso chegar nesse Dialogue implique em desbloquear um colecionável relativo a Arquétipos, basta colocar "archetype_?", com ? sendo o índice do colecionável em questão.
        case .seventhText:
            return Dialogue(descriptionText: "(seventhText) Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
                            leftCardText: "Tá zoando",
                            rightCardText: "Pode crer",
                            imageName: "Rato",
                            herosJourneysStage: "Teste",
                            nextLeftDialogue: "eighthText",
                            nextRightDialogue: "",
                            genericTrigger: "herosJourney_2")
        case .eighthText:
            return Dialogue(descriptionText: "(eighthText) Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
                            leftCardText: "Tá zoando",
                            rightCardText: "Pode crer",
                            imageName: "Rato",
                            herosJourneysStage: "Teste",
                            nextLeftDialogue: "",
                            nextRightDialogue: "",
                            genericTrigger: "archetype_2")
        case .ninthText:
            return Dialogue(descriptionText: "(ninthText) Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
                            leftCardText: "Tá zoando",
                            rightCardText: "Pode crer",
                            imageName: "Poder",
                            herosJourneysStage: "Teste",
                            nextLeftDialogue: "",
                            nextRightDialogue: "")
        case .tenthText:
            return Dialogue(descriptionText: "(tenthText) Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
                            leftCardText: "Tá zoando",
                            rightCardText: "Pode crer",
                            imageName: "smd_logo",
                            herosJourneysStage: "Teste",
                            nextLeftDialogue: "",
                            nextRightDialogue: "")
        }
    }
}
