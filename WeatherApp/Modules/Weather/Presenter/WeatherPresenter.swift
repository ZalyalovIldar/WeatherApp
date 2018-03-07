//
//  WeatherPresenter.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 07.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class WeatherPresenter: WeatherViewOutput, WeatherInteractorOutput, WeatherModuleInput {
    
    weak var view: WeatherViewInput!
    var interactor: WeatherInteractorInput!
    var router: WeatherRouterProtocol!
    
    //MARK: - module input
    
    func setCity(_ city: String) {
        interactor.setCity(city)
    }
    
    func setCoordinates(longitude: Double, latidude: Double) {
        interactor.setCoordinates(Coordinates(longitude: longitude, latitude: latidude))
    }
    
}
