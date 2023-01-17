//
//  GameplayCardView.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 12/01/23.
//

import SwiftUI

struct GameplayCardView: View {

    private var dialogues: [Dialogue] = [Dialogues.firstText.getDialogue(), Dialogues.secondText.getDialogue()]
    private var dialogue: Dialogue = Dialogues.firstText.getDialogue()
    
    var body: some View {
        
        GeometryReader { gp in
            VStack {
                VStack {
                    Rectangle().foregroundColor(.black)
                }
                .frame(width: gp.size.width, height: gp.size.height * 0.2)
                VStack {
                    Text(dialogue.descriptionText)
                }
                .frame(width: gp.size.width * 0.6, height: gp.size.height * 0.3)
                VStack {
                    ZStack {
//                        CardView(dialogue: dialogue)
                        ForEach(dialogues, id: \.self) { dialogue in
                            CardView(dialogue: dialogue)
                        }
                    }
                }
                .frame(width: gp.size.width, height: gp.size.height * 0.5)
            }
        }
        .onAppear {
            let data = Dialogues.firstText
            let myObject = data.getDialogue()
            
            print(myObject.descriptionText, myObject.leftCardText, myObject.rightCardText)
        }
    }
}

struct GameplayCardView_Previews: PreviewProvider {
    static var previews: some View {
        GameplayCardView()
    }
}
