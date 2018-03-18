//
//  MapInteractorInput.swift
//  WeatherApp
//
//  Created by Elina on 09/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol MapInteractorInput {
    
    /// To get users coordinates
    func getUsersCoordinates()
    
    /// To get image from url and to send a place
    ///
    /// - Parameters:
    ///   - url: url of image
    ///   - place: Place which be shown on a map
    func getCoatOfArmsImage(from url: URL, place: Place)
    
    /// To make a request of image with city
    ///
    /// - Parameters:
    ///   - city: city name
    ///   - place: Place which be shown on a map
    func getCoatOfArms(of city: String, place: Place)
    
}
