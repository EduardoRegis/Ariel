//
//  GameplayCardView.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 12/01/23.
//

import SwiftUI

struct GameplayCardView: View {

    @State private var dialogue: Dialogue = Dialogues.firstText.getDialogue()
    @State var nextDialogue: String = ""
    
    // Control variables to auto filling description text
    @State private var descriptionText: String = ""
    @State private var isTextTimerActive = false
    @State private var stringCounter: Int = 0
    @State private var stringLimit: Int = 10
    let textTimer = Timer.publish(every: 0.012, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        GeometryReader { gp in
            VStack {
                VStack {
                    Rectangle().foregroundColor(.black)
                }
                .frame(width: gp.size.width, height: gp.size.height * 0.2)
                VStack {
                    Text(self.descriptionText)
                        .onChange(of: self.dialogue.descriptionText)
                        { newValue in
                            self.descriptionText = ""
                            isTextTimerActive.toggle()
                            self.stringLimit = newValue.count
                        }
                }
                .frame(width: gp.size.width * 0.6, height: gp.size.height * 0.3, alignment: .top)
                .onReceive(textTimer, perform: { _ in
                    
                    guard isTextTimerActive else { return }
                    
                    if self.descriptionText != self.dialogue.descriptionText {
                        self.descriptionText += self.dialogue.descriptionText[stringCounter]
                        stringCounter += 1
                    } else {
                        isTextTimerActive = false
                        stringCounter = 0
                    }
                })
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
            let data = Dialogues.secondText
            if (self.dialogue == data.getDialogue()) {
                isTextTimerActive.toggle()
            }
            self.dialogue = data.getDialogue()
            self.stringLimit = self.dialogue.descriptionText.count
        }
    }
}
