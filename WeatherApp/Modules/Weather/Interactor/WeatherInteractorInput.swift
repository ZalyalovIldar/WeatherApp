//
//  WeatherInteractorInput.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 07.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol WeatherInteractorInput: class {
    
    // Setters
    func setCity(_ city: String)
    func setCoordinates(_ coordinates: Coordinates)
    func setPlaceID(_ placeID: String)
    
    /// Get weather info by city name
    func getWeatherFromCity()
    
    /// Get weather info by city coordinates
    func getWeatherFromCoordinates()
    
    /// Load photo of city by place ID
    func loadPhotoForPlace()
    
}
