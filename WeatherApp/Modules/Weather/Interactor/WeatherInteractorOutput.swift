//
//  WeatherInteractorOutput.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 07.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol WeatherInteractorOutput: class {
    
    /// Success result of getting weather info
    ///
    /// - Parameter weatherInfo: weather info
    func getWeatherSuccess(with weatherInfo: WeatherInfo)
    
    /// Failure result of getting weather info
    ///
    /// - Parameter message: error message
    func getWeatherFailure(with message: String)
    
    /// Result of image loading
    ///
    /// - Parameter response: response
    func didFinishLoadImage(with response: Response<PhotoModel>)
    
}
