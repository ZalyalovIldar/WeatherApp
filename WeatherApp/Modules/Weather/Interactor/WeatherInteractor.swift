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
        
        weatherService.getWeather(with: city) { [weak self] (response) in
            DispatchQueue.main.async { [weak self] in
                guard let strongSelf = self else { return }
                switch response {
                case .success(let weatherInfo): strongSelf.presenter.getWeatherSuccess(with: weatherInfo)
                case .error(let errorMessage): strongSelf.presenter.getWeatherFailure(with: errorMessage)
                }
            }
        }
    }
    
}
