//
//  HelpScreenViewController.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 20/01/23.
//

import UIKit

class HelpScreenViewController: BaseViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet var collectionOfHelpTitles: Array<UILabel>?
    @IBOutlet var collectionOfHelpImages: Array<UIImageView>?
    @IBOutlet var collectionOfHelpDescriptions: Array<UILabel>?
    
    
    // MARK: - Properties
    var presenter: HelpScreenPresenter!
    
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
        if let collectionOfHelpTitles = self.collectionOfHelpTitles {
            for (index, label) in collectionOfHelpTitles.enumerated() {
                label.text = presenter.helpTitle(index: index)
            }
        }
        
        if let collectionOfHelpImages = self.collectionOfHelpImages {
            for (index, imageView) in collectionOfHelpImages.enumerated() {
                imageView.image = UIImage(named: presenter.helpImage(index: index))
            }
        }
        
        if let collectionOfHelpDescriptions = self.collectionOfHelpDescriptions {
            for (index, label) in collectionOfHelpDescriptions.enumerated() {
                label.lineBreakMode = .byWordWrapping
                label.numberOfLines = 2
                label.text = presenter.helpDescription(index: index)
            }
        }
    }

    // MARK: - Actions
    @IBAction func backAction(_ sender: Any) {
        self.presenter.backToMenu()
    }
}

// MARK: - HelpScreenPresenterDelegate
extension HelpScreenViewController: HelpScreenPresenterDelegate {
    func didLoadRemoteConfig() {
    }
}
