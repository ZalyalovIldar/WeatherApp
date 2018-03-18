//
//  ImageManagerDelegate.swift
//  WeatherApp
//
//  Created by Elina on 18/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol ImageManagerDelegate {
    
    /// To get PhotoModel of coat of arms
    ///
    /// - Parameters:
    ///   - image: struct PhotoModel
    ///   - place: Place which be shown on a map
    func getCoatOfArms(image: PhotoModel, place: Place)
    
}
