//
//  Weather.swift
//  WeatherApp
//
//  Created by Азат Алекбаев on 13.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class Weather: Codable {
    let forecast: Forecast
    
}
struct Forecast: Codable {
    let forecastText: ForecastText
    
    private enum CodingKeys: String, CodingKey {
        case forecastText = "txt_forecast"
    }
}
struct ForecastText: Codable {
    let date: String
    let forecastDays: [ForecastDay]
    
    private enum CodingKeys: String, CodingKey {
        case date
        case forecastDays = "forecastday"
    }
}
struct ForecastDay: Codable {
    let iconUrl: URL
    let descriptionName: String
    let description: String
    
     private enum CodingKeys: String, CodingKey {
        case iconUrl = "icon_url"
        case descriptionName = "title"
        case description = "fcttext"
    }
}

