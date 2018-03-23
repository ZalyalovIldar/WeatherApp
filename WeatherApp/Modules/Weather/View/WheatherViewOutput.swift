//
//  WheatherViewOutput.swift
//  WeatherApp
//
//  Created by Damir Zaripov on 18.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import GooglePlaces

protocol WheatherViewOutput: class {
    
    func setAllData(to place: GMSPlace)
}
