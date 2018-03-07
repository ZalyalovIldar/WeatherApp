//
//  WeatherPresenter.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 07.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class WeatherPresenter: WeatherViewOutput, WeatherInteractorOutput, WeatherModuleInput {
    
    weak var view: WeatherViewInput!
    var interactor: WeatherInteractorInput!
    var router: WeatherRouterProtocol!
    
}
