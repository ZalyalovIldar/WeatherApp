//
//  GetCityWeatherRequest.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 08.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import Alamofire

class GetCityWeatherRequest: Request {
    
    var method: HTTPMethod = .get
    var endPoint = "weather"
    var parameters: [String : Any]
    
    private let cityKey = "q"
    
    init(city: String) {
        self.parameters = [cityKey: city]
    }
    
}
