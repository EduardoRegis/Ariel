//
//  ArchetypesScreenViewController.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 20/01/23.
//

import UIKit

class ArchetypesScreenViewController: BaseViewController {
    
    @IBOutlet var collectionOfButtons: Array<UIButton>?
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionText: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Properties
    var presenter: ArchetypesScreenPresenter!
    
    // MARK: - View Lifecycle
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.set(2, forKey: "activeArchetypes")
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
                if index >= UserDefaults.standard.integer(forKey: "activeArchetypes") {
                    button.isEnabled = false
                }
            }
        }
        if let archetypeModel = ArchetypeManager.shared.getArchetypeByString(name: "1") {
            getInfoFormModel(archetype: archetypeModel)
        }
    }
    
    func getInfoFormModel(archetype: ArchetypeModel) {
        self.titleLabel.text = archetype.archetypeStage
        self.descriptionText.text = archetype.descriptionText
        self.imageView.image = UIImage(named: archetype.imageName)
    }
    
    @objc func handleRegister(sender: UIButton) {
        if let value = sender.titleLabel?.text {
            if let archetype = ArchetypeManager.shared.getArchetypeByString(name: value) {
                getInfoFormModel(archetype: archetype)
            }
        }
    }

    // MARK: - Actions

    @IBAction func backAction(_ sender: Any) {
        self.presenter.backToMenu()
    }
}

// MARK: - ArchetypesScreenPresenterDelegate
extension ArchetypesScreenViewController: ArchetypesScreenPresenterDelegate {
    func didLoadRemoteConfig() {
    }
}
