//
//  WeatherInfoOutput.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 12.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol WeatherInfoOutput: class {
    
    func viewIsReady()
    func updateCurrentWeatherInfo(at indexPath: IndexPath)
    func updateCurrentWeatherInfoCount()
    
}
