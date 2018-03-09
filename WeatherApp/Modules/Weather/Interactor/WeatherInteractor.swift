//
//  WeatherInteractor.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 07.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class WeatherInteractor: WeatherInteractorInput {
    
    private var currentCity: String?
    private var currentCoordinates: Coordinates?
    private var currentWeatherCollectionInfo: [WeatherCollectionInfo]?

    var weatherService: WeatherService!
    weak var presenter: WeatherInteractorOutput!
    
    private let noDataMessage = "Нет данных"
    
    func setCity(_ city: String) {
        currentCity = city
    }
    
    func setCoordinates(_ coordinates: Coordinates) {
        currentCoordinates = coordinates
    }
    
    func getWeatherFromCity() {
        guard let city = currentCity else { return }
        let request = GetCityWeatherRequest(city: city)
        
        weatherService.getWeather(with: request) { [weak self] (response) in
            guard let strongSelf = self else { return }
            strongSelf.preparePresenter(with: response)
        }
    }
    
    func getWeatherFromCoordinates() {
        guard let coordinates = currentCoordinates else { return }
        let request = GetLocationWeatherRequest(longitude: coordinates.longitude, latitude: coordinates.latitude)
        
        weatherService.getWeather(with: request) { [weak self] (response) in
            guard let strongSelf = self else { return }
            strongSelf.preparePresenter(with: response)
        }
    }
    
    private func preparePresenter(with response: Response<WeatherInfo>) {
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            switch response {
            case .success(let weatherInfo):
                strongSelf.presenter.getWeatherSuccess(with: weatherInfo)
                strongSelf.currentWeatherCollectionInfo = weatherInfo.getCollectionInfo()
            case .error(let errorMessage): strongSelf.presenter.getWeatherFailure(with: errorMessage)
            }
        }
    }
    
    func getWeatherCollectionInfo() -> [WeatherCollectionInfo]? {
        guard let weatherCollectionInfo = currentWeatherCollectionInfo else { return nil }
        return weatherCollectionInfo
    }
    
}
