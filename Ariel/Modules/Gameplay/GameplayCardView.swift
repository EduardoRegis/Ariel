//
//  GameplayCardView.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 12/01/23.
//

import SwiftUI

let defaultTimeForCharTyped: CGFloat = 0.012

struct GameplayCardView: View {

    @State private var dialogue: Dialogue = Dialogues.firstText.getDialogue()
    @State var nextDialogue: String = ""
    @Environment(\.presentationMode) var presentationMode
    @State private var coloredWords: [String] = []
    
    // Control variables to auto filling description text
    @State private var descriptionText: String = ""
    @State private var isTextTimerActive = false
    @State private var stringCounter: Int = 0
    @State private var stringLimit: Int = 10
    let textTimer = Timer.publish(every: defaultTimeForCharTyped, on: .main, in: .common).autoconnect()
    
    var body: some View {
        GeometryReader { gp in
            VStack {
                VStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.left").foregroundColor(.white)
                    }
                }
                .frame(width: gp.size.width, height: gp.size.height * 0.1, alignment: .leading)
                .background(.black)
                VStack {
                    Text(coloringWords(text: self.descriptionText))
                        .onChange(of: self.dialogue.descriptionText)
                        { newValue in
                            if isTextTimerActive == false {
                                let regex = "\\{(.*?)\\}"
                                self.coloredWords = self.matchesForRegexInText(regex: regex, text: newValue)
                                self.removeCurlyBraces()
                            }
                            self.descriptionText = ""
                            isTextTimerActive.toggle()
                            self.stringLimit = newValue.count
                        }
                }
                .frame(width: gp.size.width * 0.6, height: gp.size.height * 0.3, alignment: .top)
                .onReceive(textTimer, perform: { _ in
                    guard isTextTimerActive else { return }
                    if stringCounter < self.dialogue.descriptionText.count {
                        if (self.dialogue.descriptionText[stringCounter] != "{") &&
                            (self.dialogue.descriptionText[stringCounter] != "}") {
                            self.descriptionText += self.dialogue.descriptionText[stringCounter]
                        }
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
                        CardView(nextDialogue: self.$nextDialogue,
                                 isTextTimerActive: self.$isTextTimerActive,
                                 dialogue: dialogue)
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
                .frame(width: gp.size.width, height: gp.size.height * 0.5, alignment: .top)
            }
        }
        .onAppear {
            // TODO: - Carregar aqui o progresso do usuário
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                let data = Dialogues.firstText
                if (self.dialogue == data.getDialogue()) {
                    let regex = "\\{(.*?)\\}"
                    self.coloredWords = self.matchesForRegexInText(regex: regex, text: self.dialogue.descriptionText)
                    self.removeCurlyBraces()
                    isTextTimerActive.toggle()
                }
                self.dialogue = data.getDialogue()
                self.stringLimit = self.dialogue.descriptionText.count
            }
        }
    }
    
    func coloringWords(text: String) -> NSMutableAttributedString {
        let mutableAttributedString = NSMutableAttributedString.init(string: text)
        for word in self.coloredWords {
            let range = (text as NSString).range(of: word)
            mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: range)
        }
        
        return mutableAttributedString
    }
    
    func matchesForRegexInText(regex: String!, text: String!) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex, options: [])
            let nsString = text as NSString
            let results = regex.matches(in: text, options: [], range: NSMakeRange(0, nsString.length))
            return results.map { nsString.substring(with: $0.range)}
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
    
    func removeCurlyBraces() {
        var newColoredWords: [String] = []
        for coloredWord in self.coloredWords {
            newColoredWords.append(String(coloredWord.dropFirst().dropLast()))
        }
        self.coloredWords = newColoredWords
    }
}
