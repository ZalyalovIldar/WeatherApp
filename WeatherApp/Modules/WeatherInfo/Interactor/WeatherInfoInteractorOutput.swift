//
//  WeatherInfoInteractorOutput.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 12.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol WeatherInfoInteractorOutput: class {
    
    func didFinishUpdateCurrentWeatherInfo(_ weatherInfo: WeatherCollectionInfo)
    func dudFinishUpdateCurrentWeatherInfoCount(_ count: Int)
    
}
