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
        VStack {
            ZStack {
                ForEach(people, id: \.self) { person in
                    CardView(person: person)
                }
            }
        }
    }
}

struct GameplayCardView_Previews: PreviewProvider {
    static var previews: some View {
        GameplayCardView()
    }
}
