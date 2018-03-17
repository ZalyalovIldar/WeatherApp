//
//  WeatherInfoInteractorInput.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 12.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol WeatherInfoInteractorInput: class {
    
    /// Prepare data as array for collection view
    ///
    /// - Parameter weatherInfo: data to prepare
    func convertAndSetColletionInfo(from weatherInfo: WeatherInfo)
    
    /// Update current info in collection view cell
    ///
    /// - Parameter indexPath: index of element in collection view
    func updateCurrentInfo(at indexPath: IndexPath)
    
    /// Update current count info cells for collection view
    func updateCurrentInfoCount()
    
}
