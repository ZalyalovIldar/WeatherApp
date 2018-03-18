//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 07.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, WeatherViewInput, ModuleInputHolder {
    
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
    @IBOutlet weak var cityImageView: UIImageView!
    
    var presenter: WeatherViewOutput!
    var moduleInput: ModuleInput?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewIsReady()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segueIdentifierCase(for: segue) {
        case .collectionViewSegue:
            guard let moduleInputHolder = segue.destination as? ModuleInputHolder else { return }
            guard let moduleInput = moduleInputHolder.moduleInput else { return }
            presenter.setCollectionContainerModuleInput(moduleInput)
            break
        }
    }
    
    // MARK: - view input
    
    func setState(_ state: String) {
        stateLabel.text = state
    }
    
    func setTemperature(_ temperature: String) {
        temperatureLabel.text = temperature
    }
    
    func setSunriseTime(_ time: String) {
        sunriseLabel.text = time
    }
    
    func setSunsetTime(_ time: String) {
        sunsetLabel.text = time
    }
    
    func setCityTitle(_ title: String) {
        self.title = title
    }
    
    func setCityImage(_ image: UIImage) {
        cityImageView.image = image
    }

}
