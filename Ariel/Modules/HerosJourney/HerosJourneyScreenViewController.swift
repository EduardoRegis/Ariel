//
//  HerosJourneyScreenViewController.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 20/01/23.
//

import UIKit

class HerosJourneyScreenViewController: BaseViewController {
    
    @IBOutlet var collectionOfButtons: Array<UIButton>?
    @IBOutlet weak var backButton: UIButton!
    
    // MARK: - Properties
    var presenter: HerosJourneyScreenPresenter!
    
    // MARK: - View Lifecycle
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.set(3, forKey: "activeHerosJourney")
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
        
        if let collectionOfButtons = self.collectionOfButtons {
            for (index, button) in collectionOfButtons.enumerated() {
                button.addTarget(self, action:#selector(handleRegister(sender:)), for: .touchUpInside)
                if index >= UserDefaults.standard.integer(forKey: "activeHerosJourney") {
                    button.isEnabled = false
                }
            }
        }
        
    }
    
    @objc func handleRegister(sender: UIButton) {
        if let value = sender.titleLabel?.text {
            print(value)
        }
    }

    // MARK: - Actions
    @IBAction func backAction(_ sender: Any) {
        self.presenter.backToMenu()
    }
}

// MARK: - HerosJourneyScreenPresenterDelegate
extension HerosJourneyScreenViewController: HerosJourneyScreenPresenterDelegate {
    func didLoadRemoteConfig() {
    }
}
