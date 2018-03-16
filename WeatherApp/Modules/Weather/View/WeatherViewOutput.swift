//
//  WeatherViewOutput.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 07.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol WeatherViewOutput: class {
    
    func viewIsReady()
    func updateCurrentWeatherInfo(at indexPath: IndexPath)
    func updateCurrentWeatherInfoCount()
    
}
