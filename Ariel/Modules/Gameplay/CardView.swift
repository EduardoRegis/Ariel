//
//  CardView.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 12/01/23.
//

import SwiftUI

let defaultOutOfBoundsPosition: CGSize = CGSize(width: -300 , height: -2500)

struct CardView: View {
    
    @Binding var nextDialogue: String
    @Binding var isTextTimerActive: Bool
    
    var dialogue: Dialogue
    
    @State private var textCard: String = ""
    @State private var offset = defaultOutOfBoundsPosition
    @State private var color: Color = .clear
    
    var body: some View {
        ZStack {
            Image(dialogue.imageName)
                .resizable()
                .frame(width: UIScreen.screenWidth * 0.85, height: UIScreen.screenWidth * 0.85)
                .border(.white, width: 6.0)
                .cornerRadius(4.0)
                .shadow(radius: 4)
                .onChange(of: dialogue, perform: {
                    newValue in
                    repositioningCardOutOfBounds()
                    if let soundEffect = newValue.soundTrigger {
                        triggeringSound(name: soundEffect)
                    }
                })
                .onChange(of: isTextTimerActive, perform: {
                    newValue in
                    if (newValue == false) {
                        positioningCard()
                    }
                })
            Rectangle()
                .frame(width: UIScreen.screenWidth * 0.75, height: UIScreen.screenWidth * 0.75)
                .cornerRadius(4.0)
                .foregroundColor(color.opacity(0.7))
            HStack {
                Text(textCard)
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
        }
        .offset(x: offset.width, y: offset.height * 0.4)
        .rotationEffect(.degrees(Double(offset.width / 40)))
        .gesture(
            DragGesture().onChanged { gesture in
                offset = gesture.translation
                withAnimation {
                    changeColor(width: offset.width)
                }
                changeText(width: offset.width)
            } .onEnded { _ in
                withAnimation {
                    swipeCard(width: offset.width)
                    changeColor(width: offset.width)
                }
                nextCard(width: offset.width)
                changeText(width: offset.width)
            }
        )
    }
    
    func triggeringSound(name: String) {
        if name != "" {
            AudioManager.shared.playSoundEffect(name: name)
        }
    }
    
    func repositioningCardOutOfBounds() {
        textCard = ""
        offset = defaultOutOfBoundsPosition
        color = .clear
    }
    
    func positioningCard() {
        withAnimation {
            offset = .zero
        }
    }
    
    func swipeCard(width: CGFloat) {
        switch width {
        case -500...(-50):
            offset = CGSize(width: -500 , height: 0)
        case 50...500:
            offset = CGSize(width: 500 , height: 0)
        default:
            offset = .zero
        }
    }
    
    func nextCard(width: CGFloat) {
        switch width {
        case -500...(-50):
            self.nextDialogue = dialogue.nextLeftDialogue ?? ""
            AudioManager.shared.playSoundEffect(name: "cardSideChoosen")
        case 50...500:
            self.nextDialogue = dialogue.nextRightDialogue ?? ""
            AudioManager.shared.playSoundEffect(name: "cardSideChoosen")
        default:
            break
        }
        if (self.nextDialogue == "") {
            UserDefaults.standard.set(false, forKey: "gameInProgress")
        }
    }
    
    func changeText(width: CGFloat) {
        switch width {
        case -500...(-50):
            textCard = dialogue.leftCardText
        case 50...500:
            textCard = dialogue.rightCardText
        default:
            textCard = ""
        }
    }
    
    func changeColor(width: CGFloat) {
        switch width {
        case -500...(-50):
            color = .white
        case 50...500:
            color = .white
        default:
            color = .clear
        }
    }
}
