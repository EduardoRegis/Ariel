//
//  HerosJourneyScreenViewController.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 20/01/23.
//

import UIKit

class HerosJourneyScreenViewController: BaseViewController {
    
    
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
