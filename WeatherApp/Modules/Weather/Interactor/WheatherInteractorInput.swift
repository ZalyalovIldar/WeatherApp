//
//  WheatherInteractorInput.swift
//  WeatherApp
//
//  Created by Damir Zaripov on 18.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import GooglePlaces

protocol WheatherInteractorInput: class {
    
    func getCityPhoto(from place: GMSPlace)
    func getWheaterInfo(from place: GMSPlace)
    func getCityName(from place: GMSPlace)
    func getAllInfo(from place: GMSPlace)
}
