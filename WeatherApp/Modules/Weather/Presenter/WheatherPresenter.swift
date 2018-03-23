//
//  WheatherPresenter.swift
//  WeatherApp
//
//  Created by Damir Zaripov on 18.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import GooglePlaces

class WheatherPresenter: WheatherViewOutput, WheatherInteractorOutput, WeatherModuleInput {

    weak var view: WheaterViewInput!
    var interactor: WheatherInteractorInput!
    
    func setAllData(to place: GMSPlace) {
        interactor.getAllInfo(from: place)
    }
    
    func didFinishingLoadingInformation(with wheather: CorrectWeatherInfo) {
        let roundedTemperature = wheather.temperature.rounded(toPlaces: 1)
        
        let temperature = "\(String(wheather.temperature.rounded(toPlaces: 1))) °С"
        //let temperature = String(describing: roundedTemperature)
        let sunrise = "Время восхода: \(wheather.sunrise)"
        let sunset = "Время захода: \(wheather.sunset)"
        
        view.setTemperatureLabel(with: temperature)
        view.setSunriseLabel(with: sunrise)
        view.setSunsetLabel(with: sunset)
    }
    
    func didFinishingLoadingPhoto(with photo: CityPhoto) {
        view.setCityImage(with: photo.photo)
    }
    
    func didFinishingSetCityInfo(with city: String) {
        view.setCityNameLabel(with: city)
    }
    
    func setPlace(_ place: GMSPlace) {
        view.setPlace(place)
    }
    

}
