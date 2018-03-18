//
//  WeatherModuleInput.swift
//  WeatherApp
//
//  Created by Damir Zaripov on 19.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import GooglePlaces

protocol WeatherModuleInput: class {
    
    /// Setup with place
    ///
    /// - Parameter place: place info
    func setPlace(_ place: GMSPlace)
    
}
