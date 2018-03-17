//
//  MapApiProvider.swift
//  WeatherApp
//
//  Created by Elina on 17/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//


import Foundation
import Alamofire

class MapApiProvider: ApiProvider {
    
    var baseURL = URL(string: "https://api.cognitive.microsoft.com/bing/v7.0")
    
    let headers: HTTPHeaders = [
        "Ocp-Apim-Subscription-Key" : "ddeb057d4ea8459dbc364d2a1f2abd5c"
    ]
    
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
        
        Alamofire.request(url, method: request.method, parameters: parameters, headers: headers)
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
