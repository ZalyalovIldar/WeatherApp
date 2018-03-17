//
//  WeatherInfoType.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 14.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

/// Weather info types with titles
enum WeatherInfoType: String {
    case wind = "Направление ветра"
    case pressure = "Давление"
    case humidity = "Влажность"
    case clouds = "Облачность"
    case visibility = "Видимость"
    
    static let allValues = [wind, pressure, humidity, clouds, visibility]
}
