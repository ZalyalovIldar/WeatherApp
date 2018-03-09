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

    var weatherService: WeatherService!
    weak var presenter: WeatherInteractorOutput!
    
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
            strongSelf.preparePresentet(with: response)
        }
    }
    
    func getWeatherFromCoordinates() {
        guard let coordinates = currentCoordinates else { return }
        let request = GetLocationWeatherRequest(longitude: coordinates.longitude, latitude: coordinates.latitude)
        
        weatherService.getWeather(with: request) { [weak self] (response) in
            guard let strongSelf = self else { return }
            strongSelf.preparePresentet(with: response)
        }
    }
    
    private func preparePresentet(with response: Response<WeatherInfo>) {
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            switch response {
            case .success(let weatherInfo): strongSelf.presenter.getWeatherSuccess(with: weatherInfo)
            case .error(let errorMessage): strongSelf.presenter.getWeatherFailure(with: errorMessage)
            }
        }
    }
    
}
