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

extension WeatherInfo {
    
    /// Helper method to get info with title for display in cell
    ///
    /// - Returns: array with weather info
    func getCollectionInfo() -> [WeatherCollectionInfo] {
        var weatherCollectionInfo = [WeatherCollectionInfo]()
        for infoType in WeatherInfoType.allValues {
            let info = WeatherCollectionInfo(title: infoType.rawValue, info: getWeatherInfo(for: infoType))
            weatherCollectionInfo.append(info)
        }
        return weatherCollectionInfo
    }
    
    private func getWeatherInfo(for type: WeatherInfoType) -> String {
        switch type {
        case .wind: return "Угол \(wind.deg)°"
        case .pressure: return "\(main.pressure) hPa"
        case .humidity: return "\(main.humidity)%"
        case .clouds: return "\(clouds.all)"
        case .visibility: return "\(visibility) м"
        }
    }
    
}

/// Weather info types with titles
enum WeatherInfoType: String {
    case wind = "Направление ветра"
    case pressure = "Давление"
    case humidity = "Влажность"
    case clouds = "Облачность"
    case visibility = "Видимость"
    
    static let allValues = [wind, pressure, humidity, clouds, visibility]
}

