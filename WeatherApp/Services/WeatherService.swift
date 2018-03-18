//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 08.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol WeatherService: class {
    
     /// Get weather info
     ///
     /// - Parameters:
     ///   - request: request for send to API
     ///   - completionBlock: block with result
     func getWeather(with request: Request, completionBlock: @escaping (Response<WeatherInfo>) -> Void)
    
}
