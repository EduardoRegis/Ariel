//
//  GameplayCardView.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 12/01/23.
//

import SwiftUI

struct GameplayCardView: View {

    @State private var dialogue: Dialogue = Dialogues.firstText.getDialogue()
    @State private var descriptionText: String = ""
    @State var nextDialogue: String = "" 
    
    var body: some View {
        
        GeometryReader { gp in
            VStack {
                VStack {
                    Rectangle().foregroundColor(.black)
                }
                .frame(width: gp.size.width, height: gp.size.height * 0.2)
                VStack {
                    Text(self.descriptionText)
                        .onChange(of: dialogue.descriptionText)
                        { newValue in
                            for char in newValue {
                                self.descriptionText += "\(char)"
                                print(self.descriptionText)
                            }
                        }
                }
                .frame(width: gp.size.width * 0.6, height: gp.size.height * 0.3)
                VStack {
                    ZStack {
                        Rectangle()
                            .frame(width: 280, height: 280)
                            .cornerRadius(4.0)
                            .foregroundColor(.black)
                            .shadow(radius: 4)
                        CardView(nextDialogue: self.$nextDialogue, dialogue: dialogue)
                            .onChange(of: nextDialogue)
                                { newValue in
                                    if let newDialogue = DialogueManager.shared.getDialogueByString(name: nextDialogue) {
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                            self.dialogue = newDialogue
                                        }
                                    }
                                }
                    }
                }
                .frame(width: gp.size.width, height: gp.size.height * 0.5)
            }
        }
        .onAppear {
            // TODO: - Carregar aqui o progresso do usuário
            let data = Dialogues.firstText
            self.dialogue = data.getDialogue()
        }
    }
}
