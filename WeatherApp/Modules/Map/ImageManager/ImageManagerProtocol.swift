//
//  ImageManagerProtocol.swift
//  WeatherApp
//
//  Created by Elina on 18/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol ImageManagerProtocol {

    /// To get image from url
    ///
    /// - Parameters:
    ///   - imageURL: url of image
    ///   - place: Place which be shown on a map
    func getImageFromUrl(imageURL: URL, place: Place)
    
}

