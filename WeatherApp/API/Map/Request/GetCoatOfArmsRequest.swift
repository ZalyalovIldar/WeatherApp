//
//  GetCoatOfArmsRequest.swift
//  WeatherApp
//
//  Created by Elina on 18/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import Alamofire

class GetCoatOfArmsRequest: Request {
    
    var method: HTTPMethod = .get
    var endPoint = "value"
    var parameters: [String : Any]
    
    private let coatOfArmsKey = "q"
    private let partOfValue = "coat+of+arms+of+"
    
    init(city: String) {
        let value = partOfValue + city
        self.parameters = [coatOfArmsKey: value]
    }
    
}
