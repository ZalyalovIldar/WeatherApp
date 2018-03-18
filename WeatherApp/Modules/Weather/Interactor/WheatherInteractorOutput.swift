//
//  WheatherInteractorOutput.swift
//  WeatherApp
//
//  Created by Damir Zaripov on 18.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import GooglePlaces

protocol WheatherInteractorOutput: class {
    
    func didFinishingLoadingInformation(with wheather: WeatherInfo)
    func didFinishingLoadingPhoto(with photo: CityPhoto)
    func didFinishingSetCityInfo(with city: String)
}
