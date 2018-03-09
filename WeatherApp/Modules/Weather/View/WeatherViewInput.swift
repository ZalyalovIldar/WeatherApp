//
//  WeatherViewInput.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 07.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

protocol WeatherViewInput: class {
    
    func prepareCollectionView()
    func setState(_ state: String)
    func setTemperature(_ temperature: String)
    func setSunriseTime(_ time: String)
    func setSunsetTime(_ time: String)
    func setCityTitle(_ title: String)
    func setCurrentWeatherInfoTitle(_ title: String)
    func setCurrentWeatherInfo(_ info: String)
    func setCurrentWeatherInfoCount(_ count: Int)
    func reloadCollectionView()
    func setCityImage(_ image: UIImage)
    
}
