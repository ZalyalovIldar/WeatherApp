//
//  ApiProvider.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 08.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import Alamofire

class WeatherApiProvider: ApiProvider {
    
    var baseURL = URL(string: "http://api.openweathermap.org/data/2.5")
    
    //Default parameters
    let appIDKey = "APPID"
    let appID = "1a2e21b9e193d6978cd83827fec09122"
    let unitsKey = "units"
    let units = "metric"
    let langKey = "lang"
    let lang = "ru"
    lazy var defaultParameters: [String: Any] = {
        return [appIDKey: appID, unitsKey: units, langKey: lang]
    }()
    
    func makeRequest(with request: Request, completionBlock: @escaping (Data?) -> Void) {
        guard let baseURL = self.baseURL else { return }
        let url = baseURL.appendingPathComponent(request.endPoint)
        
        var parameters = request.parameters
        defaultParameters.forEach { parameters[$0.key] = $0.value }
        
        Alamofire.request(url, method: request.method, parameters: parameters)
            .validate()
            .responseData { (response) in
                guard response.result.isSuccess else {
                    print("Error while make request: \(String(describing: response.result.error))")
                    completionBlock(nil)
                    return
                }
                
                guard let data = response.result.value else {
                    print("No data found in response")
                    completionBlock(nil)
                    return
                }
                
                completionBlock(data)
        }
    }
    
}
