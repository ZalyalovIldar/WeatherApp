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
    weak var wheaterApiManager: WheatherAPIManagerProtocol!
    
    let sight = " достопримечательность"
 
    func getAllInfo(from place: GMSPlace) {
        self.getCityName(from: place)
        self.getCityPhoto(from: place)
        self.getWheaterInfo(from: place)
    }
    
    
    func getCityPhoto(from place: GMSPlace) {
        let cityName = place.name
        let queryString = cityName + sight
        wheaterApiManager.getFirstImage(with: queryString) { (image) in
            self.presenter.didFinishingLoadingPhoto(with: CityPhoto(photo: image))
        }
    }
    
    func getWheaterInfo(from place: GMSPlace) {
        let coordinates = Coordinates(longitude: place.coordinate.latitude, latitude: place.coordinate.longitude)
        wheaterApiManager.getWheaterInfo(with: coordinates) { (weatherInfo) in
            self.presenter.didFinishingLoadingInformation(with: weatherInfo)
        }
    }
    
    func getCityName(from place: GMSPlace) {
        let cityName = place.name
        self.presenter.didFinishingSetCityInfo(with: cityName)
    }
    
}
