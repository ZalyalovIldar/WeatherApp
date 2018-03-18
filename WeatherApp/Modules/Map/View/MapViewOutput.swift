//
//  MapViewOutput.swift
//  WeatherApp
//
//  Created by BLVCK on 18/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol MapViewOutput: class {
    
    func getCurrentLocation()
    func configure(with manager: inout GMSAutocompleteManager)
    
}

