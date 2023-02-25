//
//  AchievementsScreenViewController.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 24/02/23.
//

import UIKit

class AchievementsScreenViewController: BaseViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var backButton: UIButton!
    
    // MARK: - Properties
    var presenter: AchievementsScreenPresenter!
    
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
        getAchievements()
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
        self.titleLabel.text = AchievementsScreenTexts.title.localized()
        self.prepareCollection()
        self.backButton.setTitle(AchievementsScreenTexts.back.localized(), for: .normal)
    }
    
    private func prepareCollection() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        AchievementCollectionViewCell.registerNib(for: collectionView)
        self.collectionView.contentMode = .center
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.backgroundColor = UIColor.clear
    }
    
    func getAchievements() {
        presenter.getAchievements(completion: { [self] in
            reloadData()
        })
    }
    
    func reloadData() {
        collectionView.reloadData()
//        if (presenter.isListEmpty()) {
//            showEmptyBox()
//        } else {
//            hideEmptyBox()
//        }
    }

    // MARK: - Actions
    @IBAction func backAction(_ sender: Any) {
        self.presenter.backToMenu()
    }
}

// MARK: - AchievementsScreenPresenterDelegate
extension AchievementsScreenViewController: AchievementsScreenPresenterDelegate {
    func didLoadRemoteConfig() {
    }
}

// MARK: - CollectionView Methods

extension AchievementsScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.achievements.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = AchievementCollectionViewCell.dequeueCell(from: collectionView, for: indexPath)
        cell.fill(name: presenter.achievements[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  25
        let collectionViewSize = collectionView.frame.size.width - padding
        return CGSize(width: collectionViewSize/3, height: 187)
    }
}
