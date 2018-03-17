//
//  WeatherServiceImpementation.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 08.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class WeatherServiceImplementation: WeatherService {
    
    var apiProvider: ApiProvider!
    let dataErrorMessage = "Ошибка при получении данных"
    
    func getWeather(with request: Request, completionBlock: @escaping (Response<WeatherInfo>) -> Void) {
        apiProvider.makeRequest(with: request) { [weak self] (data) in
            guard let strongSelf = self else { return }
            guard let data = data else {
                completionBlock(.error(strongSelf.dataErrorMessage))
                return
            }
            
            guard let weatherInfo = try? JSONDecoder().decode(WeatherInfo.self, from: data) else {
                completionBlock(.error(strongSelf.dataErrorMessage))
                return
            }
            completionBlock(.success(weatherInfo))
        }
    }
    
}
