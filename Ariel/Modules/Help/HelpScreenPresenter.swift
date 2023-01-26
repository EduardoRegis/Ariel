//
//  HelpScreenPresenter.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 20/01/23.
//

import Foundation

protocol HelpScreenPresenterDelegate: BasePresenterDelegate {
}

class HelpScreenPresenter {
    
    weak var delegate: HelpScreenPresenterDelegate?
    let router: HelpScreenRouter
    
    init(delegate: HelpScreenPresenterDelegate, router: HelpScreenRouter) {
        
        self.delegate = delegate
        self.router = router
    }
    func didLoad() {
    }
    
    func willAppear() {
    }
    
    func didAppear() {
    }
    
    func helpTitle(index: Int) -> String {
        switch index {
        case 0:
            return HelpScreenTexts.first.localized()
        case 1:
            return HelpScreenTexts.second.localized()
        case 2:
            return HelpScreenTexts.third.localized()
        case 3:
            return HelpScreenTexts.fourth.localized()
        default:
            return ""
        }
    }
    
    func helpImage(index: Int) -> String {
        switch index {
        case 0:
            return "smd_logo"
        case 1:
            return "smd_logo"
        case 2:
            return "smd_logo"
        case 3:
            return "smd_logo"
        default:
            return ""
        }
    }
    
    func helpDescription(index: Int) -> String {
        switch index {
        case 0:
            return HelpScreenTexts.firstDesc.localized()
        case 1:
            return HelpScreenTexts.secondDesc.localized()
        case 2:
            return HelpScreenTexts.thirdDesc.localized()
        case 3:
            return HelpScreenTexts.fourthDesc.localized()
        default:
            return ""
        }
    }
    
    func backToMenu() {
        self.router.backToMenu()
    }
}
