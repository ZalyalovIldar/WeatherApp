//
//  WeatherInfo.swift
//  WeatherApp
//
//  Created by Damir Zaripov on 18.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

struct WeatherInfo: Codable {
    
    struct Hourly: Codable {
        struct Data: Codable {
            let temperature: Double?
        }
        
        let data: [Data]?
    }

    let hourly: Hourly?
    
    struct Daily: Codable {
        struct Data: Codable {
            let sunriseTime: Int?
            let sunsetTime: Int?
            let icon: String?
        }
        
        let data: [Data]?
    }
    
    let daily: Daily?
}
