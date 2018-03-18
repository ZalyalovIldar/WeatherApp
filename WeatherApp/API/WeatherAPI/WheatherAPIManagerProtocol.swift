//
//  WheatherAPIManagerProtocol.swift
//  WeatherApp
//
//  Created by Damir Zaripov on 18.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import UIKit
import GooglePlaces

protocol WheatherAPIManagerProtocol: class {
    
    func getFirstImage(with query: String, completionBlock: @escaping (UIImage) -> ())
    func getWheaterInfo(with place: Coordinates, completionBlock: @escaping (WeatherInfo) -> ())
}

