//
//  LocationDelegate.swift
//  WeatherApp
//
//  Created by Elina on 16/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol LocationDelegate {
    
    /// Result of getting coordinates
    ///
    /// - Parameter coordinates: struct Coordinates
    func coordinatesResult(with coordinates: Coordinates)
    
}
