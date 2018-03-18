//
//  WheatherViewInput.swift
//  WeatherApp
//
//  Created by Damir Zaripov on 18.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import UIKit

protocol WheaterViewInput: class {
    
    func setCityNameLabel(with name: String)
    func setCityImage(with image: UIImage)
    func setTemperatureLabel(with temperature: String)
    func setSunsetLabel(with sunset: String)
    func setSunriseLabel(with sunrise: String)
    func setWheaterLabel(with wheater: String)
}
