//
//  WeatherInfoInteractor.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 12.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class WeatherInfoInteractor: WeatherInfoInteractorInput {
    
    weak var presenter: WeatherInfoInteractorOutput!
    
    private var weatherCollectionInfo: [WeatherCollectionInfo]?
    
    func convertAndSetColletionInfo(from weatherInfo: WeatherInfo) {
        var weatherCollectionInfo = [WeatherCollectionInfo]()
        for infoType in WeatherInfoType.allValues {
            let title = infoType.rawValue
            var info: String
            
            switch infoType {
                case .wind: info = "Угол \(weatherInfo.wind.deg)°"
                case .pressure: info = "\(weatherInfo.main.pressure) hPa"
                case .humidity: info = "\(weatherInfo.main.humidity)%"
                case .clouds: info = "\(weatherInfo.clouds.all)"
                case .visibility: info = "\(weatherInfo.visibility) м"
            }
            
            weatherCollectionInfo.append(WeatherCollectionInfo(title: title, text: info))
        }
        
        self.weatherCollectionInfo = weatherCollectionInfo
    }
    
    func updateCurrentInfo(at indexPath: IndexPath) {
        guard let weatherInfo = weatherCollectionInfo else { return }
        presenter.didFinishUpdateCurrentWeatherInfo(weatherInfo[indexPath.row])
    }
    
    func updateCurrentInfoCount() {
        presenter.dudFinishUpdateCurrentWeatherInfoCount(weatherCollectionInfo?.count ?? 0)
    }
    
}
