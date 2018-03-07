//
//  WeatherModuleInput.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 07.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol WeatherModuleInput: class {
    
    /// To get the weather by city name
    ///
    /// - Parameter city: name of city
    func setCity(_ city: String)
    
    /// To get the weather by coordinates
    ///
    /// - Parameters:
    ///   - longitude: longitude coordinate
    ///   - latidude: latitude coordinate
    func setCoordinates(longitude: Double, latidude: Double)
    
}
