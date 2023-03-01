//
//  UILabel+Writing.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 01/03/23.
//

import UIKit

extension UILabel {
    
    func setTyping(text: String, characterDelay: TimeInterval = 2.0) {
      self.text = ""
        
      let writingTask = DispatchWorkItem { [weak self] in
        text.forEach { char in
          DispatchQueue.main.async {
            self?.text?.append(char)
          }
          Thread.sleep(forTimeInterval: characterDelay/100)
        }
      }
        
      let queue: DispatchQueue = .init(label: "typespeed", qos: .userInteractive)
      queue.asyncAfter(deadline: .now() + 0.05, execute: writingTask)
    }
    
    func setTypingAttributed(newText: NSMutableAttributedString, characterDelay: TimeInterval = 2.0) {
        
        let writingTask = DispatchWorkItem { [weak self] in
            for i in 0...newText.length {
                DispatchQueue.main.async {
                    let str: NSAttributedString = newText.attributedSubstring(from: NSRange(location: 0, length: i))
                    self?.attributedText = str
                }
                Thread.sleep(forTimeInterval: characterDelay/100)
            }
        }
        
        let queue: DispatchQueue = .init(label: "typespeed", qos: .userInteractive)
        queue.asyncAfter(deadline: .now() + 0.05, execute: writingTask)
    }
}
