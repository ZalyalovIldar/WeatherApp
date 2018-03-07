//
//  WeatherInteractor.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 07.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class WeatherInteractor: WeatherInteractorInput {
    
    var currentCity: String?
    var currentCoordinates: Coordinates?
    
    weak var presenter: WeatherInteractorOutput!
    
    func setCity(_ city: String) {
        currentCity = city
    }
    
    func setCoordinates(_ coordinates: Coordinates) {
        currentCoordinates = coordinates
    }
    
}
