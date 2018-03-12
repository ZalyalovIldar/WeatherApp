//
//  WeatherInteractorOutput.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 07.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol WeatherInteractorOutput: class {
    
    func getWeatherSuccess(with weatherInfo: WeatherInfo)
    func getWeatherFailure(with message: String)
    func didFinishLoadImage(with response: Response<PhotoModel>)
    
}
