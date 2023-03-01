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
}
