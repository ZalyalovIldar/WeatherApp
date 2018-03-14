//
//  WeatherInteractorInput.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 07.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol WeatherInteractorInput: class {
    
    /// To get the weather by city name
    ///
    /// - Parameter city: name of city
    func setCity(_ city: String)
    
    /// To get the weather by coordinates
    ///
    /// - Parameter coordinates: coordinates of pin
    func setCoordinates(_ coordinates: Coordinates)
    
    func setPlaceID(_ placeID: String)
    
    func getWeatherFromCity()
    
    func getWeatherFromCoordinates()
    
    func loadPhotoForPlace()
    
}
