//
//  CardView.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 12/01/23.
//

import SwiftUI

struct CardView: View {
    
    var person: String
    @State private var offset = CGSize.zero
    @State private var color: Color = .black
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 280, height: 280)
                .border(.white, width: 6.0)
                .cornerRadius(4.0)
                .foregroundColor(color.opacity(0.9))
                .shadow(radius: 4)
            HStack {
                Text(person)
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
            } .onEnded { _ in
                withAnimation {
                    swipeCard(width: offset.width)
                    changeColor(width: offset.width)
                }
            }
        )
    }
    
    func swipeCard(width: CGFloat) {
        switch width {
        case -500...(-150):
            print("\(person) removed")
            offset = CGSize(width: -500 , height: 0)
        case 150...500:
            print("\(person) added")
            offset = CGSize(width: 500 , height: 0)
        default:
            offset = .zero
        }
    }
    
    func changeColor(width: CGFloat) {
        switch width {
        case -500...(-130):
            color = .red
        case 130...500:
            color = .green
        default:
            color = .black
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(person: "Teste")
    }
}
