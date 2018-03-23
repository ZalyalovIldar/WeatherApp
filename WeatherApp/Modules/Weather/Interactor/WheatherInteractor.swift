//
//  WheatherInteractor.swift
//  WeatherApp
//
//  Created by Damir Zaripov on 18.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import GooglePlaces

class WheatherInteractor: WheatherInteractorInput {

    weak var presenter: WheatherInteractorOutput!
    var wheaterApiManager: WheatherAPIManagerProtocol!
    
    let sight = " достопримечательность"
 
    func getAllInfo(from place: GMSPlace) {
        self.getCityName(from: place)
        self.getCityPhoto(from: place)
        self.getWheaterInfo(from: place)
    }
    
    
    func getCityPhoto(from place: GMSPlace) {
        let cityName = place.name
        let queryString = cityName + sight
        wheaterApiManager.getFirstImage(with: queryString) { [weak self] (image) in
            DispatchQueue.main.async { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.presenter.didFinishingLoadingPhoto(with: CityPhoto(photo: image))
            }
        }
    }
    
    func getWheaterInfo(from place: GMSPlace) {
        let coordinates = Coordinates(longitude: place.coordinate.latitude, latitude: place.coordinate.longitude)
        wheaterApiManager.getWheaterInfo(with: coordinates) { (weatherInfo) in
            DispatchQueue.main.async { [weak self] in
                guard let temperatureInFahrenheit = weatherInfo.hourly?.data?.first?.temperature else { return }
                let temperatureInСesium = ((temperatureInFahrenheit - 32) / 2) + (((temperatureInFahrenheit - 32) / 2) / 10)
                guard let sunsetTime = weatherInfo.daily?.data?.first?.sunsetTime, let sunriseTime = weatherInfo.daily?.data?.first?.sunriseTime else { return }
                guard let correctSunsetTime = self?.getCorrectTime(from: sunsetTime), let correctSunrisetTime = self?.getCorrectTime(from: sunriseTime) else { return }
                let correctWeather = CorrectWeatherInfo(temperature: temperatureInСesium, sunset: correctSunsetTime, sunrise: correctSunrisetTime)
                guard let strongSelf = self else { return }
                strongSelf.presenter.didFinishingLoadingInformation(with: correctWeather)
            }
        }
    }
    
    func getCityName(from place: GMSPlace) {
        let cityName = place.name
        self.presenter.didFinishingSetCityInfo(with: cityName)
    }
    
    func getCorrectTime(from time: Int) -> String {
        let date = Date(timeIntervalSince1970: Double(time))
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.short
        dateFormatter.dateStyle = DateFormatter.Style.none
        dateFormatter.timeZone = NSTimeZone.local
        
        let localDate = dateFormatter.string(from: date)
        return localDate
    }
    
}
