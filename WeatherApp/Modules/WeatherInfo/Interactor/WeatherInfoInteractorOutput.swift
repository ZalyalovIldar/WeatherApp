//
//  WeatherInfoInteractorOutput.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 12.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol WeatherInfoInteractorOutput: class {
    
    /// Result updating of current weather info in cell
    ///
    /// - Parameter weatherInfo: weather info for cell
    func didFinishUpdateCurrentWeatherInfo(_ weatherInfo: WeatherCollectionInfo)
    
    /// Result updating of current count of cells
    ///
    /// - Parameter count: count of cells
    func dudFinishUpdateCurrentWeatherInfoCount(_ count: Int)
    
}
