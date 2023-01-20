//
//  MenuScreenViewController.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 20/01/23.
//

import UIKit
import SwiftUI

class MenuScreenViewController: BaseViewController {

    // MARK: - Outlets
    @IBOutlet weak var newJourneyButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var herosJourneyButton: UIButton!
    @IBOutlet weak var archetypesButton: UIButton!
    @IBOutlet weak var creditsButton: UIButton!
    @IBOutlet weak var configurationsButton: UIButton!
    @IBOutlet weak var helpsButton: UIButton!
    
    // MARK: - Properties
    var presenter: MenuScreenPresenter!
    
    // MARK: - View Lifecycle
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.didLoad()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.willAppear()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.didAppear()
    }
    
    // MARK: - Methods
    func configureUI() {
        creditsButton.setTitle("", for: .normal)
        creditsButton.setImage(UIImage(systemName: "person.3.fill"), for: .normal)
        
        configurationsButton.setTitle("", for: .normal)
        configurationsButton.setImage(UIImage(systemName: "gearshape.fill"), for: .normal)
        
        helpsButton.setTitle("", for: .normal)
        helpsButton.setImage(UIImage(systemName: "questionmark.circle.fill"), for: .normal)
    }

    // MARK: - Actions
    
    
    @IBAction func newJourneyAction(_ sender: Any) {
        let swiftUIViewController = UIHostingController(rootView: GameplayCardView())
        swiftUIViewController.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
        self.present(swiftUIViewController, animated: true, completion: nil)
    }
    
    
    @IBAction func continueAction(_ sender: Any) {
        let swiftUIViewController = UIHostingController(rootView: GameplayCardView())
        swiftUIViewController.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
        self.present(swiftUIViewController, animated: true, completion: nil)
    }
    
    @IBAction func herosJourneyAction(_ sender: Any) {
        self.presenter.navigateToHerosJourney()
    }
    
    @IBAction func archetypesAction(_ sender: Any) {
        self.presenter.navigateToArchetypes()
    }
    
    @IBAction func creditsAction(_ sender: Any) {
        self.presenter.navigateToCredits()
    }
    
    @IBAction func configurationsAction(_ sender: Any) {
        self.presenter.navigateToConfigurations()
    }
    
    @IBAction func helpsAction(_ sender: Any) {
        self.presenter.navigateToHelp()
    }
}

// MARK: - MenuScreenPresenterDelegate
extension MenuScreenViewController: MenuScreenPresenterDelegate {
    func didLoadRemoteConfig() {
    }
}