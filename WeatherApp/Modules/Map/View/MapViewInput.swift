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
    
    /// Set user location with coordinates
    ///
    /// - Parameters:
    ///   - latitude: latitude
    ///   - longitude: longitude
    func setUserLocation(latitude: Double, longitude: Double)
    
    /// To setup map
    func setUpMap()
    
    /// To remove camera on place after auto complete
    ///
    /// - Parameters:
    ///   - latitude: latitude
    ///   - longitude: longitude
    ///   - placeName: city name
    ///   - image: coat of army of city
    func setCamera(latitude: Double, longitude: Double, placeName: String, image: UIImage)
    
    /// To get user location
    func getUserLocation()
    
}
