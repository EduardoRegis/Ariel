//
//  ConfigurationsScreenViewController.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 20/01/23.
//

import UIKit

class ConfigurationsScreenViewController: BaseViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var soundEffectLabel: UILabel!
    @IBOutlet weak var ambienceLabel: UILabel!
    @IBOutlet weak var musicLabel: UILabel!
    
    @IBOutlet weak var soundEffectSlider: UISlider!
    @IBOutlet weak var ambienceSlider: UISlider!
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
        titleLabel.text = ConfigScreenTexts.title.localized()
        
        musicLabel.text = ConfigScreenTexts.music.localized()
        musicSlider.setValue(UserDefaults.standard.float(forKey: "MusicVolume"), animated: true)
        musicSlider.addTarget(self, action: #selector(onSliderValChanged(slider:event:)), for: .valueChanged)
        musicSlider.tag = 0
        
        ambienceLabel.text = ConfigScreenTexts.ambience.localized()
        ambienceSlider.setValue(UserDefaults.standard.float(forKey: "AmbienceVolume"), animated: true)
        ambienceSlider.addTarget(self, action: #selector(onSliderValChanged(slider:event:)), for: .valueChanged)
        ambienceSlider.tag = 1
        
        soundEffectLabel.text = ConfigScreenTexts.soundEffect.localized()
        soundEffectSlider.setValue(UserDefaults.standard.float(forKey: "SoundEffectVolume"), animated: true)
        soundEffectSlider.addTarget(self, action: #selector(onSliderValChanged(slider:event:)), for: .valueChanged)
        soundEffectSlider.tag = 2
        
        backButton.setTitle(ConfigScreenTexts.back.localized(), for: .normal)
    }

    // MARK: - Actions

    @objc func onSliderValChanged(slider: UISlider, event: UIEvent) {
        if let touchEvent = event.allTouches?.first {
            if touchEvent.phase == .ended {
                presenter.ajustVolume(tag: slider.tag, value: slider.value)
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
