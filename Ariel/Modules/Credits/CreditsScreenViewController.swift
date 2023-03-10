//
//  CreditsScreenViewController.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 20/01/23.
//

import UIKit

class CreditsScreenViewController: BaseViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet var collectionOfMembersFunctions: Array<UILabel>?
    
    // MARK: - Properties
    var presenter: CreditsScreenPresenter!
    
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
        self.titleLabel.text = CreditsScreenTexts.title.localized()
        if let collectionOfMembersFunctions = self.collectionOfMembersFunctions {
            for (index, label) in collectionOfMembersFunctions.enumerated() {
                label.lineBreakMode = .byWordWrapping
                label.numberOfLines = 2
                label.text = presenter.memberFunction(index: index)
            }
        }
        self.backButton.applyEnabledCustomButton()
        self.backButton.setTitle(CreditsScreenTexts.back.localized(), for: .normal)
    }

    // MARK: - Actions
    @IBAction func backAction(_ sender: Any) {
        self.presenter.backToMenu()
    }
}

// MARK: - CreditsScreenPresenterDelegate
extension CreditsScreenViewController: CreditsScreenPresenterDelegate {
    func didLoadRemoteConfig() {
    }
}
