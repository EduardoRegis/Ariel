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
    @State private var colorsIndexes: [Int] = []
    
    // Control variables to auto filling description text
    @State private var descriptionText: String = ""
    @State private var isTextTimerActive = false
    @State private var stringCounter: Int = 0
    @State private var stringLimit: Int = 10
    let textTimer = Timer.publish(every: defaultTimeForCharTyped, on: .main, in: .common).autoconnect()
    
    @Namespace var bottomId
    
    var body: some View {
        GeometryReader { gp in
            VStack {
                VStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.left").foregroundColor(.white)
                    }.padding(.leading, 20)
                }
                .frame(width: gp.size.width, height: gp.size.height * 0.1, alignment: .leading)
                .background(.gray)
                VStack() {
                    ScrollView {
                        ScrollViewReader { scrollView in
                            Text(coloringWords(text: self.descriptionText))
                                .onChange(of: self.dialogue.descriptionText)
                                { newValue in
                                    if isTextTimerActive == false {
                                        self.coloredWords = self.matchesForRegexesInText(text: newValue)
                                        self.removeCurlyBraces()
                                    }
                                    self.descriptionText = ""
                                    isTextTimerActive.toggle()
                                    self.stringLimit = newValue.count
                                }
                                .onTapGesture {
                                    self.isTextTimerActive = false
                                    var newText = self.dialogue.descriptionText
                                    
                                    for (char) in SpecialCharacteresToRegexText {
                                        newText = newText.filter { $0 != char.first }
                                    }
                                    
                                    self.descriptionText = newText
                                    scrollView.scrollTo(bottomId, anchor: .bottom)
                                }
                            Spacer()
                                .id(bottomId)
                                .onAppear {
                                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3, execute: {
                                        _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
                                            if isTextTimerActive {
                                                scrollView.scrollTo(bottomId, anchor: .bottom)
                                            }
                                        }
                                    })
                                }
                        }
                    }
                }
                .onReceive(textTimer, perform: { _ in
                    guard isTextTimerActive else { return }
                    if stringCounter < self.dialogue.descriptionText.count {
                        if !(SpecialCharacteresToRegexText.contains(self.dialogue.descriptionText[stringCounter])) {
                            self.descriptionText += self.dialogue.descriptionText[stringCounter]
                        }
                        stringCounter += 1
                    } else {
                        isTextTimerActive = false
                        stringCounter = 0
                    }
                })
                .frame(width: gp.size.width * 0.9, height: gp.size.height * 0.3, alignment: .top)
                VStack {
                    ZStack {
                        Rectangle()
                            .frame(width: UIScreen.screenWidth * 0.85, height: UIScreen.screenWidth * 0.85)
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
                                    checkTrigger(dialogue: newDialogue)
                                }
                            }
                        }
                    }
                }
                .frame(width: gp.size.width, height: gp.size.height * 0.5, alignment: .top)
            }
        }
        .background(Color("color_background"))
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                var data = Dialogues.firstText.getDialogue()
                if UserDefaults.standard.bool(forKey: "isNewJourney") {
                    UserDefaults.standard.set("firstText", forKey: "lastDialogueSaved")
                } else {
                    let lastDialogueSaved = UserDefaults.standard.string(forKey: "lastDialogueSaved")
                    if lastDialogueSaved == "" {
                        if let firstDialogue = DialogueManager.shared.getDialogueByString(name: "firstText") {
                            data = firstDialogue
                        }
                    } else {
                        if let lastDialogueSaved = UserDefaults.standard.string(forKey: "lastDialogueSaved") {
                            if let dialogueSaved = DialogueManager.shared.getDialogueByString(name: lastDialogueSaved) {
                                data = dialogueSaved
                            }
                        }
                    }
                }
                if (self.dialogue == data) {
                    self.coloredWords = self.matchesForRegexesInText(text: self.dialogue.descriptionText)
                    self.removeCurlyBraces()
                    isTextTimerActive.toggle()
                }
                self.dialogue = data
                self.stringLimit = self.dialogue.descriptionText.count
            }
        }
        .onDisappear {
            if UserDefaults.standard.string(forKey: "lastDialogueSaved") != "" {
                UserDefaults.standard.set(self.nextDialogue, forKey: "lastDialogueSaved")
            }
        }
    }
    
    func coloringWords(text: String) -> NSMutableAttributedString {
        let mutableAttributedString = NSMutableAttributedString.init(string: text)
        mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor,
                                             value: UIColor(named: "color_tint") as Any,
                                             range: (text as NSString).range(of: text))
        for (index, name) in self.coloredWords.enumerated() {
            let range = (text as NSString).range(of: name)
            mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: RegexColors[colorsIndexes[index]], range: range)
        }
        return mutableAttributedString
    }
    
    func matchesForRegexesInText(text: String!) -> [String] {
        let regexes = ["\\{(.*?)\\}", "\\[(.*?)\\]", "\\|(.*?)\\%", "\\&(.*?)\\#"]
        var regexesResults: [String] = []
        
        self.colorsIndexes = []
        
        for (index, name) in regexes.enumerated() {
            let result = matchesForRegexInText(regex: name, text: text)
            regexesResults.append(contentsOf: result)
            self.colorsIndexes.append(contentsOf: Array(repeating: index, count: result.count))
        }
        
        return regexesResults
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
    
    func checkTrigger(dialogue: Dialogue) {
        
        let userDefaults = UserDefaults.standard
        
        if let genericTrigger = dialogue.genericTrigger, genericTrigger != "" {
            if genericTrigger.contains("babaca") {
                userDefaults.set(userDefaults.integer(forKey: "duchbagCounter") + 1, forKey: "duchbagCounter")
            } else if genericTrigger.contains("herosJourney") {
                let triggerSplited = genericTrigger.components(separatedBy: "_")
                guard let herosJourneyIndex = Int(triggerSplited[1]) else { return }
                if herosJourneyIndex > userDefaults.integer(forKey: "activeHerosJourney") {
                    userDefaults.set(herosJourneyIndex, forKey: "activeHerosJourney")
                }
            } else if genericTrigger.contains("archetype") {
                let triggerSplited = genericTrigger.components(separatedBy: "_")
                guard let archetypeIndex = Int(triggerSplited[1]) else { return }
                if archetypeIndex > userDefaults.integer(forKey: "activeArchetypes") {
                    userDefaults.set(archetypeIndex, forKey: "activeArchetypes")
                }
            }
        }
        
        if let achievementTrigger = dialogue.achievementTrigger, achievementTrigger != "" {
            var strings: [String] = userDefaults.stringArray(forKey: "achievements") ?? []
            
            if !strings.contains(achievementTrigger) {
                strings.append(achievementTrigger)
                userDefaults.set(strings, forKey: "achievements")
                
                SnackBarHelper.shared.showSuccessMessage(message: AchievementManager.shared.getAchievementByString(name: achievementTrigger))
            }
        }
        
    }
}
