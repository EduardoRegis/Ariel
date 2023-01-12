//
//  GameplayCardView.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 12/01/23.
//

import SwiftUI

struct GameplayCardView: View {
    
    private var people: [String] = ["Mario", "Luigi", "Peach", "Toad", "Daisy"].reversed()
    
    var body: some View {
        
        GeometryReader { gp in
            VStack {
                VStack {
                    Text("Blue")
                }
                .frame(width: gp.size.width, height: gp.size.height * 0.4)
                VStack {
                    ZStack {
                        ForEach(people, id: \.self) { person in
                            CardView(person: person)
                        }
                    }
                }
                .frame(width: gp.size.width, height: gp.size.height * 0.5)
            }
        }
    }
}

struct GameplayCardView_Previews: PreviewProvider {
    static var previews: some View {
        GameplayCardView()
    }
}
