//
//  WeatherInfoOutput.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 12.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol WeatherInfoOutput: class {
    
    /// View lifecycle
    func viewIsReady()
    
    /// Update current weather info for collection view
    ///
    /// - Parameter indexPath: index of cell to update
    func updateCurrentWeatherInfo(at indexPath: IndexPath)
    
    /// Update current count of cells
    func updateCurrentWeatherInfoCount()
    
}
