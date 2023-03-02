//
//  GameplayScreenPresenter.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 28/02/23.
//

import UIKit

protocol GameplayScreenPresenterDelegate: BasePresenterDelegate {
}

class GameplayScreenPresenter {
    
    weak var delegate: GameplayScreenPresenterDelegate?
    let router: GameplayScreenRouter
    var colorsIndexes: [Int] = []
    var coloredWords: [String] = []
    var descriptionText: NSMutableAttributedString?

    init(delegate: GameplayScreenPresenterDelegate, router: GameplayScreenRouter) {
        self.delegate = delegate
        self.router = router
    }
    func didLoad() {
    }
    
    func willAppear() {
    }
    
    func didAppear() {
    }
    
    func backToMenu() {
        self.router.backToMenu()
    }
    
    func setupDialogue(newDialogue: Dialogue) {
        self.coloredWords = self.matchesForRegexesInText(text: newDialogue.descriptionText)
        self.removeSpecialCharacters()
        var textWithoutSpecialCharacters: String = newDialogue.descriptionText
        for (char) in SpecialCharacteresToRegexText {
            textWithoutSpecialCharacters = textWithoutSpecialCharacters.filter { $0 != char.first }
        }
        self.descriptionText = self.coloringWords(text: textWithoutSpecialCharacters)
    }
    
    func triggeringSound(name: String) {
        if name != "" {
            AudioManager.shared.playSoundEffect(name: name)
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
    
    func removeSpecialCharacters() {
        var newColoredWords: [String] = []
        for coloredWord in self.coloredWords {
            newColoredWords.append(String(coloredWord.dropFirst().dropLast()))
        }
        self.coloredWords = newColoredWords
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
