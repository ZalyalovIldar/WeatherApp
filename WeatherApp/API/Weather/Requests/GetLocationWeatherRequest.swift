//
//  GetLocationWeatherRequest.swift
//  WeatherApp
//
//  Created by Damir Zaripov on 08.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import Alamofire

class GetLocationWeatherRequest: Request {
    
    var method: HTTPMethod = .get
    var endPoint = "weather"
    var parameters: [String : Any]
    
    let longitudeKey = "lon"
    let latitudeKey = "lat"
    
    init(longitude: Double, latitude: Double) {
        self.parameters = [longitudeKey: longitude, latitudeKey: latitude]
    }
    
}
