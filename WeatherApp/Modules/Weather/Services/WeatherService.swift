//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 08.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol WeatherService: class {
    
     func getWeather(with request: Request, completionBlock: @escaping (Response<WeatherInfo>) -> Void)
    
}
