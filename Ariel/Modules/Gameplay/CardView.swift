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
                .frame(width: 280, height: 280)
                .onChange(of: dialogue, perform: {
                    newValue in
                    repositioningCardOutOfBounds()
                })
                .onChange(of: isTextTimerActive, perform: {
                    newValue in
                    if (newValue == false) {
                        positioningCard()
                    }
                })
            Rectangle()
                .frame(width: 280, height: 280)
                .border(.white, width: 6.0)
                .cornerRadius(4.0)
                .foregroundColor(color.opacity(0.7))
                .shadow(radius: 4)
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
        case -500...(-100):
            offset = CGSize(width: -500 , height: 0)
        case 100...500:
            offset = CGSize(width: 500 , height: 0)
        default:
            offset = .zero
        }
    }
    
    func nextCard(width: CGFloat) {
        switch width {
        case -500...(-100):
            self.nextDialogue = dialogue.nextLeftDialogue ?? ""
        case 100...500:
            self.nextDialogue = dialogue.nextRightDialogue ?? ""
        default:
            break
        }
    }
    
    func changeText(width: CGFloat) {
        switch width {
        case -500...(-100):
            textCard = dialogue.leftCardText
        case 100...500:
            textCard = dialogue.rightCardText
        default:
            textCard = ""
        }
    }
    
    func changeColor(width: CGFloat) {
        switch width {
        case -500...(-100):
            color = .white
        case 100...500:
            color = .white
        default:
            color = .clear
        }
    }
}
