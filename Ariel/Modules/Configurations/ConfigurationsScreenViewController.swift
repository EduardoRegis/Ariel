//
//  ConfigurationsScreenViewController.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 20/01/23.
//

import UIKit

class ConfigurationsScreenViewController: BaseViewController {

    @IBOutlet weak var soundEffectSlider: UISlider!
    @IBOutlet weak var ambientSlider: UISlider!
    @IBOutlet weak var musicSlider: UISlider!
    
    @IBOutlet weak var backButton: UIButton!

    // MARK: - Properties
    var presenter: ConfigurationsScreenPresenter!
    
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
        musicSlider.setValue(UserDefaults.standard.float(forKey: "MusicVolume"), animated: true)
        musicSlider.addTarget(self, action: #selector(onSliderValChanged(slider:event:)), for: .valueChanged)
    }

    // MARK: - Actions

    @objc func onSliderValChanged(slider: UISlider, event: UIEvent) {
        if let touchEvent = event.allTouches?.first {
            if touchEvent.phase == .ended {
                let value = musicSlider.value
                UserDefaults.standard.set(value, forKey: "MusicVolume")
                AudioManager.shared.ajustMusicVolume()
                AudioManager.shared.playSoundEffect(name: "sliderButtonReleased")
            }
        }
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.presenter.backToMenu()
    }
}

// MARK: - ConfigurationsScreenPresenterDelegate
extension ConfigurationsScreenViewController: ConfigurationsScreenPresenterDelegate {
    func didLoadRemoteConfig() {
    }
}
