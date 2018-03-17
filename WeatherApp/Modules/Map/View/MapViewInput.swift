//
//  MapViewInput.swift
//  WeatherApp
//
//  Created by Elina on 09/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import GooglePlaces

protocol MapViewInput: class {
    
    func setUserLocation(latitude: Double, longitude: Double)
    
    func setUpMap()
    
    func getUserLocation()
    
    func setCamera(latitude: Double, longitude: Double, placeName: String, placeFormattedAddress: String?)
    
}
