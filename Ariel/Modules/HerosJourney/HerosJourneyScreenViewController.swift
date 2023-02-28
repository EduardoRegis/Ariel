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
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textDescription: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
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
        // TODO: Remover esse mock e fzer a adicao desse parametro via gameplay
//        UserDefaults.standard.set(3, forKey: "activeHerosJourney")
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
        self.scrollView.showsHorizontalScrollIndicator = false
        if let collectionOfButtons = self.collectionOfButtons {
            for (index, button) in collectionOfButtons.enumerated() {
                button.addTarget(self, action:#selector(handleRegister(sender:)), for: .touchUpInside)
                if index >= UserDefaults.standard.integer(forKey: "activeHerosJourney") {
                    button.isEnabled = false
                    button.applyDisabledCustomButton()
                } else {
                    button.applyEnabledCustomButton()
                }
            }
        }
        if let herosJourney = HerosJourneyManager.shared.getHerosJourneyByString(name: "1") {
            getinfoFormModel(herosJourney: herosJourney)
        }
        self.backButton.applyEnabledCustomButton()
        self.backButton.setTitle(HerosJourneyScreenTexts.back.localized(), for: .normal)
    }
    
    func getinfoFormModel(herosJourney: HerosJourneyModel) {
        self.titleLabel.text = herosJourney.herosJourneysStage
        self.textDescription.text = herosJourney.descriptionText
        self.imageView.image = UIImage(named: herosJourney.imageName)
    }
    
    @objc func handleRegister(sender: UIButton) {
        if let value = sender.titleLabel?.text {
            if let herosJourney = HerosJourneyManager.shared.getHerosJourneyByString(name: value) {
                getinfoFormModel(herosJourney: herosJourney)
            }
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
