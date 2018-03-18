//
//  WheatherViewController.swift
//  WeatherApp
//
//  Created by Damir Zaripov on 18.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit
import GooglePlaces

class WheatherViewController: UIViewController, WheaterViewInput {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var cityImage: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    
    var presenter: WheatherViewOutput!
    var place: GMSPlace?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let currentPlace = place else { return }
        presenter.setAllData(to: currentPlace)
    }
    
    func setCityNameLabel(with name: String) {
        cityNameLabel.text = name
    }
    
    func setCityImage(with image: UIImage) {
        cityImage.image = image
    }
    
    func setTemperatureLabel(with temperature: String) {
        temperatureLabel.text = temperature
    }
    
    func setSunsetLabel(with sunset: String) {
        sunsetLabel.text = sunset
    }
    
    func setSunriseLabel(with sunrise: String) {
        sunriseLabel.text = sunrise
    }
    
    func setWheaterLabel(with wheater: String) {
        weatherLabel.text = wheater
    }

}
