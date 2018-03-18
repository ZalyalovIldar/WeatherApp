//
//  WeatherInfoInput.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 12.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol WeatherInfoInput: class {
    
    /// Configure collection view
    func prepareCollectionView()
    
    /// Reload info in collection view
    func refreshCollectionView()
    
    // Setters
    func set(currentWeatherInfoTitle title: String)
    func set(currentWeatherInfoText text: String)
    func set(currentWeatherInfoCount count: Int)
    
}
