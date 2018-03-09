//
//  Weather.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 08.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

struct WeatherInfo: Codable {
    
    let weather: [Weather]
    let main: Main
    let sys: Sys
    let wind: Wind
    let clouds: Clouds
    let visibility: Int
    let dt: Int
    let name: String
    
    struct Main: Codable {
        let temp: Double
        let pressure: Int
        let humidity: Int
    }
    
    struct Weather: Codable {
        let description: String
    }
    
    struct Sys: Codable {
        let sunrise: Int
        let sunset: Int
    }
    
    struct Wind: Codable {
        let speed: Int
        let deg: Int
    }
    
    struct Clouds: Codable {
        let all: Int
    }
}
